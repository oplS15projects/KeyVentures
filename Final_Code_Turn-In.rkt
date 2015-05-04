#lang racket

(require 2htdp/image)
(require 2htdp/universe)
(require 2htdp/planetcute)
(require racket/format)
(require (prefix-in htdp: lang/htdp-beginner))
(require racket/system)
(require racket/file)
(require json)

(define working-directory "/home/justin/projects/KeyVentures/")
(define take-picture 
  (λ()
    (system (string-append working-directory "emotime/assets/emotimegui_cli -s " working-directory "emotime/resources/haarcascade_frontalface_cbcl1.xml " working-directory "emotime/resources/haarcascade_eye.xml 52 52 1 5 8 svm " working-directory "emotime/assets/svm_1vsallext_1_5_8_95c2eb0b58/*"))
    ))
(define pick-character
  (lambda()
    (begin (take-picture)
           (define result (string->jsexpr
            (file->string "Outfile.json")))
           (> (hash-ref result 'happy) (hash-ref result 'sadness)))))

(define (stack imgs)
  (cond [(empty? (rest imgs)) (first imgs)]
        [else (underlay/xy (first imgs) 0 82
                          (stack (rest imgs)))]))

(define img (beside/align
   "top"
   (stack (list chest-open grass-block dirt-block grass-block water-block grass-block grass-block))
   (stack (list tree-short grass-block water-block stone-block grass-block grass-block grass-block))
   (stack (list tree-short grass-block water-block grass-block grass-block water-block grass-block))
   (stack (list tree-short wood-block grass-block water-block grass-block stone-block grass-block))
   (stack (list character-princess-girl grass-block grass-block wood-block dirt-block grass-block water-block))
   (stack (list tree-short grass-block water-block wood-block water-block grass-block brown-block))
   (stack (list tree-short brown-block water-block wood-block dirt-block brown-block water-block))
   (stack (list tree-short grass-block stone-block wood-block water-block dirt-block brown-block))
   (stack (list chest-open dirt-block grass-block wood-block brown-block grass-block water-block))
   )
  )

(define evilSetCharacter 
  (list character-horn-girl character-pink-girl))

(define goodSetCharacter 
  (list character-boy character-cat-girl))

(define (player1 n)
  (begin (cond ((= (random 2) 0) (car evilSetCharacter))
               (else (car (cdr evilSetCharacter))))))

(define (player2 n)
  (begin (cond ((= (random 2) 0) (car goodSetCharacter))
               (else (car (cdr goodSetCharacter))))))

(define player-name1
  (text "EvilKhy" 12 "black"))

(define player-name2 
  (text "GoodGuyJustin" 12 "black"))

(define evil
  (text "GoodGuyJustin Won" 60 "black"))

(define good
  (text "EvilKhy Won" 60 "black"))                 

(define window (empty-scene 900 600))

(define player1leftCount 0)
(define player1rightCount 8)
(define player1upCount 0)
(define player1downCount 5)
(define player2leftCount 8)
(define player2rightCount 0)
(define player2upCount 0)
(define player2downCount 5)
(define player1score 0)
(define player2score 0)
(define keyX 450)
(define keyY 293)
(define player1X 850)
(define player1Y 545)
(define player2X 50)
(define player2Y 545)

(define count (lambda (x) 
                 (text (number->string x) 40 "red")))

(define count1 (lambda (x) 
                 (text (number->string x) 40 "blue")))


(define (scenes imgs) ;initializes the characters
  (place-images (list player1 player-name1 player2 player-name2 (count player1score) (count1 player2score) key img) 
                (list (htdp:make-posn player1X player1Y)
                      (htdp:make-posn player1X (- player1Y 40))
                      (htdp:make-posn player2X player2Y)
                      (htdp:make-posn player2X (- player2Y 40))
                      (htdp:make-posn 850 65)
                      (htdp:make-posn 50 65)
                      (htdp:make-posn keyX keyY)
                      (htdp:make-posn 450 303)) window)
)

(define (change w a-key) ;keyboard control-score count-randomizes the key once a character touches it
  (cond
    [(key=? a-key "left")  (cond ((= player1leftCount 8) (cons player1X player1Y))
                                 ((and (= (- player1X 100) keyX) (= player1Y keyY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! keyX (= (+ (* 100 (random 9)) 50))) (set! keyY (+ (* 84 (random 5)) 125)) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) (cons player1X player1Y)))
                                 (else (begin (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) (cons player1X player1Y))))] 
    [(key=? a-key "right") (cond ((= player1rightCount 8) (cons player1X player1Y))
                                 ((and (= (+ player1X 100) keyX) (= player1Y keyY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! keyX (+ (* 100 (random 9)) 50)) (set! keyY (+ (* 84 (random 5)) 125)) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) (cons player1X player1Y)))
                                 (else (begin (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) (cons player1X player1Y))))]
    [(key=? a-key "up")    (cond ((= player1upCount 5) (cons player1X player1Y))
                                 ((and (= player1X keyX) (= (- player1Y 84) keyY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! keyX (+ (* 100 (random 9)) 50)) (set! keyY (+ (* 84 (random 5)) 125)) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)) (cons player1X player1Y)))
                                 (else (begin (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)) (cons player1X player1Y))))]
    [(key=? a-key "down")  (cond ((= player1downCount 5) (cons (car w) (cdr w)))
                                 ((and (= (car w) keyX) (= (+ (cdr w) 84) keyY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! keyX (+ (* 100 (random 9)) 50)) (set! keyY (+ (* 84 (random 5)) 125)) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)) (cons player1X player1Y)))
                                 (else (begin (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)) (cons player1X player1Y))))]
    
     [(key=? a-key "a")  (cond ((= player2leftCount 8) (cons player2X player2Y))
                                 ((and (= (- player2X 100) keyX) (= player2Y keyY)) (begin (set! player2score (+ 1 player2score)) (count1 player2score) (set! keyX (+ (* 100 (random 9)) 50)) (set! keyY (+ (* 84 (random 5)) 125)) (set! player2rightCount (- player2rightCount 1)) (set! player2leftCount (+ player2leftCount 1)) (set! player2X (- player2X 100)) (cons player2X player2Y)))
                                 (else (begin (set! player2rightCount (- player2rightCount 1)) (set! player2leftCount (+ player2leftCount 1)) (set! player2X (- player2X 100)) (cons player2X player2Y))))] 
    [(key=? a-key "d") (cond ((= player2rightCount 8) (cons player2X player2Y))
                                 ((and (= (+ player2X 100) keyX) (= player2Y keyY)) (begin (set! player2score (+ 1 player2score)) (count1 player2score) (set! keyX (+ (* 100 (random 9)) 50)) (set! keyY (+ (* 84 (random 5)) 125)) (set! player2leftCount (- player2leftCount 1)) (set! player2rightCount (+ player2rightCount 1)) (set! player2X (+ player2X 100)) (cons player2X player2Y)))
                                 (else (begin (set! player2leftCount (- player2leftCount 1)) (set! player2rightCount (+ player2rightCount 1)) (set! player2X (+ player2X 100)) (cons player2X player2Y))))]
    [(key=? a-key "w")    (cond ((= player2upCount 5) (cons player2X player2Y))
                                 ((and (= player2X keyX) (= (- player2Y 84) keyY)) (begin (set! player2score (+ 1 player2score)) (count1 player2score) (set! keyX (+ (* 100 (random 9)) 50)) (set! keyY (+ (* 84 (random 5)) 125)) (set! player2upCount (+ player2upCount 1)) (set! player2downCount (- player2downCount 1)) (set! player2Y (- player2Y 84)) (cons player2X player2Y)))
                                 (else (begin (set! player2upCount (+ player2upCount 1)) (set! player2downCount (- player2downCount 1)) (set! player2Y (- player2Y 84)) (cons player2X player2Y))))]
    [(key=? a-key "s")  (cond ((= player2downCount 5) (cons (car w) (cdr w)))
                                 ((and (= (car w) keyX) (= (+ (cdr w) 84) keyY)) (begin (set! player2score (+ 1 player2score)) (count1 player2score) (set! keyX (+ (* 100 (random 9)) 50)) (set! keyY (+ (* 84 (random 5)) 125)) (set! player2downCount (+ player2downCount 1)) (set! player2upCount (- player2upCount 1)) (set! player2Y (+ player2Y 84)) (cons player2X player2Y)))
                                 (else (begin (set! player2downCount (+ player2downCount 1)) (set! player2upCount (- player2upCount 1)) (set! player2Y (+ player2Y 84)) (cons player2X player2Y))))]

    
    [(= (string-length a-key) 1) w] 
    [else w])) 

(define (scoreReach30 n) (cond ((or (= player2score 15) (= player1score 15)) #t)
                               (else #f)))

(define (setUpCharacter) 
  (cond ((pick-character) (begin (set! player1 (cond ((= (random 2) 0) (car goodSetCharacter))
               (else (car (cdr goodSetCharacter))))) (set! player-name1 (text "GoodGuyJustin" 12 "black")) (set! player2 (cond ((= (random 2) 0) (car evilSetCharacter))
               (else (car (cdr evilSetCharacter))))) (set! player-name2 (text "EvilKhy" 12 "black"))))
        (else (begin (set! player2 (cond ((= (random 2) 0) (car goodSetCharacter))
               (else (car (cdr goodSetCharacter))))) (set! player1 (cond ((= (random 2) 0) (car evilSetCharacter))
               (else (car (cdr evilSetCharacter)))))))))

(define (ready)
  (setUpCharacter)
  (big-bang '(50 . 445) 
          (to-draw scenes) 
          (on-key change)
          (stop-when scoreReach30)))

(ready)
