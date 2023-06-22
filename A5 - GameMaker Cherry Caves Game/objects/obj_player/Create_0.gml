/// @description Variable Initialization


spd = 4;

// Gravity and falling
grv = 0.5;	// gravity
grounded = false;
vsp = 0;	// vertical speed

// Jumping attributes
jspd = 10;	// jump speed
climbing = false;

// Trampoline 
force_jump = false;
jspd_bounce = 0;

// Record Starting Position
start_x = x;
start_y = y;
alarm[0] = -1;

// Moving Platform
onMovingPlatform = false;