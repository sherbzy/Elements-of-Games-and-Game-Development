/// @description Player Movement

// check keys for movement
if (global.playerControl = true) {
	moveRight = keyboard_check(vk_right);
	moveLeft = keyboard_check(vk_left);
	moveUp = keyboard_check(vk_up);
	moveDown = keyboard_check(vk_down);
}

if (global.playerControl = false) {
	moveRight = 0;
	moveLeft = 0;
	moveUp = 0;
	moveDown = 0;
}

// Run with Shift key
running = keyboard_check(vk_shift);

// Speed up if running
if (running == true) {
	// ramp up to run speed
	if (runSpeed < runMax) {
		runSpeed += 2;	
	}
	
	// start creating dust
	if (startDust == 0) {
		alarm[0] = 2;
		startDust = 1;
	}
}

// Slow down if no longer running
if (running == false) {
	// ramp down to walk speed or idle
	if (runSpeed > 0) {
		runSpeed -= 1;	
	}
	
	// stop creating dust
	startDust = 0;
}

// calculate the movement of the player
vx = ((moveRight - moveLeft) * (walkSpeed + runSpeed) * (1 - carryLimit));
vy = ((moveDown - moveUp) * (walkSpeed + runSpeed) * (1 - carryLimit));

/*
	If the player is idle...
*/
if (vx == 0 && vy == 0) {
	// If player is not picking up or putting down an item
	if (myState != playerState.PICKINGUP && myState != playerState.PUTTINGDOWN) {
		// If player doesn't have an item
		if (hasItem == noone) {
			myState = playerState.IDLE;	
		} else {	// If player does have an item
			myState = playerState.CARRYIDLE;	
		}
		
	}
	/* // change the idle sprite based on last direction moved
	switch dir {
		case 0:
			sprite_index = spr_player_idle_right;
			break;
		case 1:
			sprite_index = spr_player_idle_up;
			break;
		case 2:
			sprite_index = spr_player_idle_left;
			break;
		case 3:
			sprite_index = spr_player_idle_down;
			break;
	} */ // code block replaced during session 4
}



/*
	If the player is moving...
*/
if (vx != 0 || vy != 0) {
	// check for collision, but move player as necessary
	if !collision_point(x + vx, y, obj_par_environment, true, true) {
		x += vx;
	}
	
	if !collision_point(x, y + vy, obj_par_environment, true, true) {
		y += vy;	
	}
	
	/*
		change direction based  on movement
		[change the walking sprite based on the direction the player is moving]
	*/
	
	// walk right
	if (vx > 0) {
		// sprite_index = spr_player_walk_right;
		dir = 0;
	}
	
	// wwalk left
	if (vx < 0) {
		// sprite_index = spr_player_walk_left;
		dir = 2;
	}
	
	// walk down
	if (vy > 0) {
		// sprite_index = spr_player_walk_down;
		dir = 3;
	}
	
	// walk up
	if (vy < 0) {
		// sprite_index = spr_player_walk_up;
		dir = 1;
	}
	
	// Set state based on whether or not the player has an item
	if (hasItem == noone) {
		myState = playerState.WALKING;
	} else {
		myState = playerState.CARRYING;
	}
	
	
	/* changed in session 6
	// Move audio listener's positio with player
	audio_listener_set_position(0, x, y, 0); ( */
	
	
}

// Set my listener if sequence is playing
if (instance_exists(obj_control) && obj_control.sequenceState  == seqState.PLAYING) {
	var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);	
	var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);
	
	audio_listener_set_position(0, _camX, _camY, 0);
} else {	// otherwise, move the audio listener with me
	audio_listener_set_position(0, x, y, 0);	
}


// depth sorting
depth = -y;

/*
	Auto-choose sprite based on state and direction
*/
sprite_index = playerSpr[myState][dir];


/*
	Check for collision with or nearby NPCs
*/

// collision returns either "noone" (no instance id) or the instance id of what is found 
nearbyNPC = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_npc, false, true);
if nearbyNPC {
	// Play greeting sound once each time the player collides with an NPC
	if (hasGreeted == false) {
		audio_play_sound(snd_greeting01, 1, 0);
		hasGreeted = true;
	}
	
	// Pop up prompt
	if (npcPrompt == noone || npcPrompt == undefined) {
		npcPrompt = scr_showPrompt(nearbyNPC, nearbyNPC.x, nearbyNPC.y-450);
	}
	show_debug_message("obj_player has found an NPC!");
}
if !nearbyNPC {
	// Reset the greeting when the player walks away from an NPC
	if (hasGreeted == true) {
		hasGreeted = false;
	}
	
	// Get rid of prompt
	scr_dismissPrompt(npcPrompt, 0);
	show_debug_message("obj_player hasn't found any NPCs");
}


/*
	Check for collision with or nearby Items
*/
nearbyItem = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_item, false, true);
if (nearbyItem && !nearbyNPC) {
	if (itemPrompt == noone || itemPrompt == undefined) {
		show_debug_message("obj_player has found an item!");
		itemPrompt = scr_showPrompt(nearbyItem, nearbyItem.x, nearbyItem.y - 300);
	}
}
if (!nearbyItem || nearbyNPC) {
	// get rid of the prompt
	scr_dismissPrompt(itemPrompt, 1);
	show_debug_message("obj_player hasn't found any items");
}

// If picking up an item
if (myState == playerState.PICKINGUP) {
	if (image_index >= image_number - 1) {	// check on the current frame of animation
		myState = playerState.CARRYING;
		global.playerControl = true;
	}
}

// If putting down an item
if (myState == playerState.PUTTINGDOWN) {
	// reset weight
	carryLimit = 0;
	
	// reset player's state once animation finishes	
	if (image_index >= image_number - 1) {
		myState = playerState.IDLE;
		global.playerControl = true;
	}
}









