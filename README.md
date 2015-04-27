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

<b>JSON</b> When we take a picture using the c++ code, the other program will store the results in an file called Outfile.json. We then use the JSON library to serialize that into a hashmap of emotions and values. We then use that to determine whether the user is happy or sad and that is used to pick their character. 

##Favorite Lines of Code
####Khyteang Lim (a team member)
Each team member should identify a favorite line of code, expression, or procedure written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
```scheme
(define (scoreReach30 n) (cond ((= player2score 15) (begin (write evil) #t))
                               ((= player1score 15) (begin (write good) #t))
                               (else #f)))
```
This code is one of my favorites even though it looks simple. This is a pedicate that returns a boolean value depending on the condition statement that it checks for. This pedicate returns true if one of the players score reaches 15 and false if otherwise. However, what makes this code interesting is the fact that before it returns a boolean value, it performs some executions using the begin procedure. This begin procedure allows multiple executations of procedures before returning the boolean value.  

####Lillian (another team member)
This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```scheme
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
```

##Additional Remarks
Anything else you want to say in your report. Can rename or remove this section.

#How to Download and Run
You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc. 

