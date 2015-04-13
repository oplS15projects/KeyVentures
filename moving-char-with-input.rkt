#lang racket

(require 2htdp/image)
(require 2htdp/universe)
(require 2htdp/planetcute)


(define (stack imgs)
  (cond [(empty? (rest imgs)) (first imgs)]
        [else (overlay/xy (first imgs) 0 40
                          (stack (rest imgs)))]))

(define (character t) ;t =WorldState
  (place-image character-horn-girl
               (car t)
               (cdr t)
               ;(place-image (rectangle 500 500 "solid" "red"))))
               (empty-scene 500 500)))



(define (change w a-key)
  (cond
    [(key=? a-key "left")  (cons (sub1 (car w)) (cdr w))] 
    [(key=? a-key "right") (cons (add1 (car w)) (cdr w))] 
    [(= (string-length a-key) 1) w] 
    [(key=? a-key "up")    (cons (car w) (sub1 (cdr w)))]
    [(key=? a-key "down")  (cons (car w) (add1 (cdr w)))]
    [else w])) 

(big-bang '(250 . 250) 
          (to-draw character)
          (on-key change))

