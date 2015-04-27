# KeyVentures
Evil Khy and nice-guy Justin are arch enemies. The local king Krishnan of Holyoke has challenged them both to collect all the keys scattered across the universe and win the competition. It is your decision to pick which character to play as.

##Authors
Khyteang Lim


Justin Nguyen 


Rohit Krishnan


##Overview
KeyVentures is a multi-player key finding game where two players race against each other to capture the key first. There is a twist where in the beginning of the game, we take a picture of the user to determine whether they will play as the good character or the evil character. Additionally, when a character captures a key by walking over it, we increment the total points that they have. 

##Screenshot
<p align="center">
     <img src="http://i.imgur.com/mndA6YT.png?1"/>
</p>

##Concepts Demonstrated
* **Conditions** it allowed the user make their own choices using the keyboard. Also it allowed us to keep the characters within the gui.
* **Multiply procedures** allowed the key to move to a random place once a character touched the key.
* **HashMap** is used to serialize the data in the JSON file so it can be later accessed as key-value pairs.

##External Technology and Libraries

<b>Planet Cute</b> We used the planetcute library which contains images drawn by Daniel Cook. These images represent our scenary and characters in the game. The library consists of blocks of images which we put together by stacking them on top of each other and side by side to create our world.

<b>JSON</b> When we take a picture using the C++ code, the other program will store the results in an file called Outfile.json. We then use the JSON library to serialize that into a hashmap of emotions and values. We then use that to determine whether the user is happy or sad and that is used to pick their character. 

##Favorite Lines of Code
####Khyteang Lim
```scheme
(define (setUpCharacter) 
  (cond ((pick-character) (begin (set! player1 (cond ((= (random 2) 0) (car goodSetCharacter))
               (else (car (cdr goodSetCharacter))))) (set! player-name1 (text "GoodGuyJustin" 12 "black")) (set! player2 (cond ((= (random 2) 0) (car evilSetCharacter))
               (else (car (cdr evilSetCharacter))))) (set! player-name2 (text "EvilKhy" 12 "black"))))
        (else (begin (set! player2 (cond ((= (random 2) 0) (car goodSetCharacter))
               (else (car (cdr goodSetCharacter))))) (set! player1 (cond ((= (random 2) 0) (car evilSetCharacter))
               (else (car (cdr evilSetCharacter)))))))))
```
This code is what allows the first player to choose which characters, EvilKhy or GoodGuyJustin, he/she wants to play as in the game. This use the concept of the conditional statement which checks to see if the procedure pick-character returns true or false. However, what makes this piece of code interesting is that it uses the begin and set! procedures. The begin procedure allows multiple executations of procedures while set! allows redefining of variables.

####Justin Nguyen
 ```scheme
 (define (scenes imgs)
   (place-images (list player1 player-name1 player2 player-name2 (count player1score) (count1 player2score) key img) 
                (list (htdp:make-posn player1X player1Y)
                       (htdp:make-posn player1X (- player1Y 40))
                       (htdp:make-posn player2X player2Y)
                       (htdp:make-posn player2X (- player2Y 40))
                       (htdp:make-posn 850 65)
                       (htdp:make-posn 50 65)
                       (htdp:make-posn keyX key)
                       (htdp:make-posn 450 303)) window))
```
This is my favorite lines of code because it is the position of where the images are when the program runs. The (place-images (list...) places the images in the window and the next list is where the images are placed relavent to the window. (player1X and player1Y are global variables)


####Rohit Krishnan
```scheme
(define pick-character
  (lambda()
    (begin (take-picture)
           (define result (string->jsexpr
            (file->string (string-append working-directory "Outfile.json"))))
           (> (hash-ref result 'happy) (* 3 (hash-ref result 'anger))))))
```
The piece of code above will read a JSON file in the current working directory and serialize it into a hash table. We then check the 'Happy and 'Anger properties and compare them to see if the user is happy or sad. 

##Additional Remarks
Good luck running this.

#How to Download and Run

     -Extract the two things in the archive to the KeyVentures folder. Make sure the .rkt file and the emotime folder are in the same directory.
     -Open up a terminal, cd into emotime/assets and run the following command once: cd ../build; cmake .. ; make clean; make ; make install; cd ../assets; ./emotimegui_cli -s ../resources/haarcascade_frontalface_cbcl1.xml ../resources/haarcascade_eye.xml 52 52 1 5 8 svm ../assets/svm_1vsallext_1_5_8_95c2eb0b58/*
     -Open the gui.rkt file and change the working-directory variable to point to wherever you have the "emotime" folder located. In my computer, it was /home/rkrishnan/Documents/OPL/finalProject/emotime, so I set that variable to be /home/rkrishnan/Documents/OPL/finalProject/.  
     -That's it, run the gui.rkt file and start by taking a picture first, then the game will start. To play, navigate with the arrow keys and the WASD keys.
