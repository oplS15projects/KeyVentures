# KeyVentures
KeyVentures! An adventure platformer game.

# KeyVentures

##Authors


Khyteang Lim


Justin Nguyen 


Rohit Krishnan


##Overview
KeyVentures is a multi-player key finding game where two players race against each other to capture the key first. There is a twist where in the beginning of the game, we take a picture of the user to determine whether they will play as the good character or the evil character. Additinoally, when a character captures a key by walking over it, we increment the total points that they have. 


##Screenshot
<p align="center">
     <img src="http://i.imgur.com/mndA6YT.png?1"/>
</p>

##Concepts Demonstrated
Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient. 
* **Data abstraction** is used to provide access to the elements of the RSS feed.
* The objects in the OpenGL world are represented with **recursive data structures.**
* **Symbolic language processing techniques** are used in the parser.

##External Technology and Libraries

<b>Planet Cute</b> We used the planetcute library which contains images drawn by Daniel Cook. These images represent our scenary and characters in the game. The library consists of blocks of images which we put together by stacking them on top of each other and side by side to create our world.

<b>JSON</b> When we take a picture using the C++ code, the other program will store the results in an file called Outfile.json. We then use the JSON library to serialize that into a hashmap of emotions and values. We then use that to determine whether the user is happy or sad and that is used to pick their character. 

##Favorite Lines of Code
####Khyteang Lim
Each team member should identify a favorite line of code, expression, or procedure written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
```scheme
(define (scoreReach30 n) (cond ((= player2score 15) (begin (write evil) #t))
                               ((= player1score 15) (begin (write good) #t))
                               (else #f)))
```
This code is one of my favorites even though it looks simple. This is a pedicate that returns a boolean value depending on the condition statement that it checks for. This pedicate returns true if one of the players score reaches 15 and false if otherwise. However, what makes this code interesting is the fact that before it returns a boolean value, it performs some executions using the begin procedure. This begin procedure allows multiple executations of procedures before returning the boolean value.  

####Justin Nguyen
 ```scheme
 (define (scenes imgs) ;t =WorldState
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
The piece of code above will read a JSOn file in the current working directory and serialize it into a hash table. We then check the 'Happy and 'Anger properties and compare them to see if the user is happy or sad. 

##Additional Remarks
Good luck running this.

#How to Download and Run

#How to Download and Run
     -Extract the two things in the archive to the KhyVentures folder. Make sure the .rkt file and the emotime folder are in the same directory.
     -Open up a terminal, cd into emotime/assets and run the following command once: cd ../build; cmake .. ; make clean; make ; make install; cd ../assets; ./emotimegui_cli -s ../resources/haarcascade_frontalface_cbcl1.xml ../resources/haarcascade_eye.xml 52 52 1 5 8 svm ../assets/svm_1vsallext_1_5_8_95c2eb0b58/*
     -Open the gui.rkt file and change the working-directory variable to point to wherever you have the "emotime" folder located. In my computer, it was /home/rkrishnan/Documents/OPL/finalProject/emotime, so I set that variable to be /home/rkrishnan/Documents/OPL/finalProject/.  
     -That's it, run the gui.rkt file and start by taking a picture first, then the game will start. To play, navigate with the arrow keys and the WASD keys.
