/// @description declare health, speed, and damage variables

hp = 10; // health
spd = 3; // 3 pixels per frame
atk = 1; // damage the player can inflict

direction = point_direction(x, y, x, y-1);

// initialize alarm
alarm[0] = -1;