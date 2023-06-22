/// @description create event code

/*
	variables (session 1)
*/
walkSpeed = 16;
vx = 0;
vy = 0;
dir = 3;
moveRight = 0;
moveLeft = 0;
moveUp = 0;
moveDown = 0;

/*
	variables (session 2)
*/
// variables
nearbyNPC = noone;
lookRange = 30;
hasGreeted = false;


// play audio
audio_listener_set_position(0, x, y, 0);	// create a listener (player's position)  and
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);	// set its orientation

/*
	variables (session 3)
*/
npcPrompt = noone;

/*
	variables (session 4)
*/
hasItem = noone;
hasItemX = x;
hasItemY = y;
nearbyItem = noone;
itemPrompt = noone;
carryLimit = 0;
myState = playerState.IDLE;
startDust = 0;

// running variables
runSpeed = 0;
runMax = 12;
running = false;

// Player Sprite array [myState][dir]
// store the sprite asset based on the player direction/state

// Idle
playerSpr[playerState.IDLE][0] = spr_player_idle_right;
playerSpr[playerState.IDLE][1] = spr_player_idle_up;
playerSpr[playerState.IDLE][2] = spr_player_idle_left;
playerSpr[playerState.IDLE][3] = spr_player_idle_down;

// Walking
playerSpr[playerState.WALKING][0] = spr_player_walk_right;
playerSpr[playerState.WALKING][1] = spr_player_walk_up;
playerSpr[playerState.WALKING][2] = spr_player_walk_left;
playerSpr[playerState.WALKING][3] = spr_player_walk_down;

// Picking Up
playerSpr[playerState.PICKINGUP][0] = spr_player_pickUp_right;
playerSpr[playerState.PICKINGUP][1] = spr_player_pickUp_up;
playerSpr[playerState.PICKINGUP][2] = spr_player_pickUp_left;
playerSpr[playerState.PICKINGUP][3] = spr_player_pickUp_down;

// Carrying
playerSpr[playerState.CARRYING][0] = spr_player_carry_right;
playerSpr[playerState.CARRYING][1] = spr_player_carry_up;
playerSpr[playerState.CARRYING][2] = spr_player_carry_left;
playerSpr[playerState.CARRYING][3] = spr_player_carry_down;

// Carrying
playerSpr[playerState.CARRYIDLE][0] = spr_player_carryIdle_right;
playerSpr[playerState.CARRYIDLE][1] = spr_player_carryIdle_up;
playerSpr[playerState.CARRYIDLE][2] = spr_player_carryIdle_left;
playerSpr[playerState.CARRYIDLE][3] = spr_player_carryIdle_down;

// Putting Down
playerSpr[playerState.PUTTINGDOWN][0] = spr_player_putDown_right;
playerSpr[playerState.PUTTINGDOWN][1] = spr_player_putDown_up;
playerSpr[playerState.PUTTINGDOWN][2] = spr_player_putDown_left;
playerSpr[playerState.PUTTINGDOWN][3] = spr_player_putDown_down;


