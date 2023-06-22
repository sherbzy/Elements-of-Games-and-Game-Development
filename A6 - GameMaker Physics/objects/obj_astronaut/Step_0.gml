/// @description Player movement in space

// Rotate left and right with arrow keys.
if (keyboard_check(vk_left)) {
	image_angle += turnRate;
}
if (keyboard_check(vk_right)) {
	image_angle -= turnRate;
}

// Up and down arrows for speed or stop.
if (keyboard_check(vk_up)) {
	motion_add(image_angle, thrustAmt);
	
	// add thrust sound
	if (!audio_is_playing(snd_thruster)) {
		audio_play_sound(snd_thruster, 15, false);
	}
	
	// smoke
	makeSmoke();
} else {
	if (audio_is_playing(snd_thruster)) {
		audio_stop_sound(snd_thruster);
	}
}

if (keyboard_check(vk_down)) {
	motion_set(image_angle, 0);
}

// Screen wrapping.
if (x > (room_width + 50)) {
	x = -50;
} else if (x < -50) {
	x = room_width + 50;
}

if (y > (room_height + 50)) {
	y = -50;
} else if (y < -50) {
	y = room_height + 50;
}


/* 
	Background music	
*/

audio_play_sound(snd_background, 10, true);
