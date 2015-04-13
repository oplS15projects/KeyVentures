# Keyventure!

<p align="center">
	<img src="http://docs.racket-lang.org/teachpack/pict.png"/>
</p>

### Problem Statement
Evil Khy and nice-guy Justin are arch enemies. The local king Krishnan of Holyoke has challenged them both to collect all the keys scattered across the universe and win the competition. It is your decision to pick which character to play as.

### Problem Analysis
To tackle this problem, we will use lambdas, lets, conditional statements, and the use of external API's. 

### Data set or other source materials
In the beginning of the game, we will run a C++ code to take a picture of the user's face and depending upon whether they are happy or sad, choose "Evil Khy" or "nice-guy Justin" to play the rest of the game. The data will be passed from c++ to Racket via JSON. 

### Deliverable and Demonstration
At the end, there will be a working platformer game called Keyventure. The user will be able to choose Khy or Justin depending on their initial mood and use the arrow keys on the keyboard to control the character's movement. The spacebar will be used to make the character jump over dangerous obstacles. 

This program will be interactive and will present the user with a GUI that they can play with. We will get keyboard input from the user to control movement.

### Evaluation of Resultsd
If the game fully works, the user will be able to smile at the beginning of the game and play the rest of the game as nice-guy Justin or they can be sad and play the rest of the game as evil Khy. 

## Work Plan and Schedule

### First Milestone (04-13)
Our first milestone will be to have a GUI on the racket side, the characters loaded on the screen able to be moved with keyboard input, and finally the c++ code able to take a picture of the user and determine their mood.

### Second Milestone (04-21)
Our second milestone will have obstacles, background, and possibly music within the game. It will also be able to take the output of the c++ code and determine which character to play as.

## Group Responsibilities
Here each group member gets a section where they, as an individual, detail what they are responsible for in this project. Each group member writes their own Responsibility section. Include the milestones and final deliverable.

### Rohit Krishnan
- Modify C++ to take picture of user and analyze their mood
- Collect data from the racket side and determine which character to play as

### Justin Nguyen
- Take keyboard input and move characters
- Building some levels

### Khyteang  
- GUI of the game
- Creating the window
- Uploading the characters from the HDTP/PlanetCute library

## Proposal Presentation Link
https://docs.google.com/presentation/d/1rJbENX2HMqLwK012Huu0krBOsf2r1Fk0m8GWdhNJ_0g/edit?usp=sharing

<!-- Links -->
[piazza]: https://piazza.com/class/i55is8xqqwhmr?cid=453
[markdown]: https://help.github.com/articles/markdown-basics/
