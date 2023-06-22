The purpose of this assignment is to complete the Space Gala shooter games we started in class.  We will be working on Level 1 for one week and Level 2 for one week.
Requirements for Level 1:

Complete the game!
Player should move with left/right arrow keys, shoot with Space Bar key (that has a delay), and hit enemies (with a small explosion)
Enemies should move left to right and drop down every few seconds - add lots of enemies to your game (like a 9x3 grid of them)
Enemies should randomly shoot bullets down at the player, causing damage to the player and a small explosion
Destroy the player if its health drops below 0 with a large explosion
Destroy the enemy if its health drops below 0 with a large explosion
Game should have state to know if you are playing, paused, or gameover
Add score and health GUI components (spr_life sprites)
Player should increment score when it destroys an enemy
Announce the game as over when the player wins or loses with static text
Player wins when all enemies are gone, player loses after it is destroyed or the enemies get to the bottom of the screen
Hint: instance_exists method for checking if there are any of an object in the room
Hint: instance_number to determine how many of an object type are in the room
Hint: instance_find to access one instance of an object to be able to check its attributes, like its y-coordinate
Requirements for Level 2:

Add at least two sounds to the game - see Week 5 assets
Create a camera/viewport that scrolls while the ship moves, player should be able to move with all 4 arrow keys
Finishing level 1 should launch level 2 (while testing, just make your game start on level 2)
Enemies should only be able to shoot when they are in the camera view
Player bullets should be destroyed once they leave the camera view
Create an obj_enemy, then make all other enemies inherit from it
Add at least one path and an enemy that moves along that path
Add at least one tracker ufo enemy that tracks the player
Hint: use point_direction, direction, and image_angle
