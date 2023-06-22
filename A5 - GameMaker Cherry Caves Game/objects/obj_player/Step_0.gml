/// @description Player Movement and Sprites

// check for player movement
var keyleft = keyboard_check(vk_left);
var keyright = keyboard_check(vk_right);
var jumping = keyboard_check(vk_space);
var keyup = keyboard_check(vk_up);
var keydown = keyboard_check(vk_down);

var move = keyright - keyleft;
var vmove = keydown - keyup;

hsp = spd * move;

// choose sprite based on movement
if (move != 0) {
	image_xscale = move;
	sprite_index = spr_player_move;
} else {
	sprite_index = spr_player_idle;
}

// checking for block collision in the x-direction
if (place_meeting(x + hsp, y, obj_block)) {	
	while (!place_meeting(x + sign(hsp), y, obj_block)) {
		// move one pixel at a time until we reach the block
		x += sign(hsp);
	}
	hsp = 0;
}


/*
*	Moving Platform Logic
*/
if (place_meeting(x, y + sprite_height/2, obj_platform_moving)) {
	show_debug_message("should be moving");
	hsp += (obj_platform_moving.spd * obj_platform_moving.dir);
}

// move
x += hsp;




/*
	Vertical Movement and Jumping
*/
vsp += grv;
if (climbing) {
	vsp -= grv;
}
// check for player's head hitting a block when jumping
if (vsp < 0 && place_meeting(x, y + vsp, obj_block)) {
	if (!climbing) {
		vsp = 0;
	}
}

// checking for block collision in the y-direction
// make sure the player is not climbing
if (place_meeting(x, y + vsp, obj_block) && !climbing) {
	while (!place_meeting(x, y + sign(vsp), obj_block)) {
		y += sign(vsp)
	}
	vsp = 0;
	grounded = true;
} else {
	grounded = false;
}

// jumping or on trampoline
if (grounded && jumping || force_jump) {
	audio_play_sound(snd_jump, 1, false);
	
	force_jump = false;
	vsp -= (jspd + jspd_bounce);
	jspd_bounce = 0;
	grounded = false;
	sprite_index = spr_player_idle;
}
y += vsp;




/*
	Climbing logic
*/

// check for climbing
if (place_meeting(x, y+1, obj_ladder)) {
	if (vmove < 0 ||
	(vmove == 0 && climbing) ||
	(vmove > 0 && place_meeting(x, y+sprite_height, obj_ladder))) {
		climbing = true;
	} else {
		climbing = false;
	}
} else {
	climbing = false;
}

if (climbing) {
	vsp = vmove * spd;
	sprite_index = spr_player_climb;
}


/*
	Check for falling out of the world
*/
if (y + sprite_height >= room_height && alarm[0] == -1) {
	alarm[0] = 40;
}
