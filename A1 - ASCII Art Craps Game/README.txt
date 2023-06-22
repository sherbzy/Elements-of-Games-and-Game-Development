The purpose of this assignment is to review object-oriented programming using C++ and write our first simple game.
Write a C++ program that plays the Vegas game of craps. 

Rules of Craps:

In the game of craps, a player rolls two 6-sided dice.   
If the sum of those dice is 7 or 11 on the first roll, the player wins. 
If the sum of those dice is 2, 3 or 12 on the first roll, the player loses. 
Any other sum becomes the player’s “point”.  The goal now is to continue rolling the dice until the sum is “point” and the player wins, or the sum is 7 and the player loses. 
 

Requirements: 

Create a Dice C++ class (Dice.cpp and Dice.h)
This class should contain various private draw methods that know how to draw the dice combinations using ASCII art 
This class should contain a public RollDice method that does the work of generating random dice rolls and drawing them
Use srand and rand (or some other random number generator) to generate your random dice rolls 
Your main program should handle the game logic, using the Dice class to roll the dice and draw them, then main should contain the logic for winning and losing the game 
From main, ask the user if they would like to play again, then loop your game until they do not want to play. 
 

Sample Output: 

You rolled... 

-----    ----- 

|        |   | O    | 

|  O   |   |   O  | 

|        |   |    O | 

-----    ----- 

Your point is ... 4 

  

You rolled... 

-----    ----- 

| O    |   | O    | 

|  O   |   |   O  | 

|    O |   |    O | 

-----    ----- 

  

Your point is ... 4 

  

You rolled... 

-----    ----- 

|        |   | O  O | 

|  O   |   |          | 

|        |   | O   O| 

-----    ----- 

  

Your point is ... 4 

  

You rolled... 

-----    ----- 

|        |   | O    | 

|  O   |   |   O  | 

|        |   |    O | 

-----    ----- 

  

CONGRATULATIONS ... YOU WIN! 
