/// @description Jump to Block Above/Below

// change speed
spd = 4;

// change direction
dir *= -1;

// change sprite
image_yscale *= -1;
image_speed = 1;

// restart change of direction alarm
alarm[0] = 160;
