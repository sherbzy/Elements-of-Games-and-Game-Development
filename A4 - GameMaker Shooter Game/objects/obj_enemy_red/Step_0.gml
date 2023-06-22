/// @description Enemy movement


if (global.game_state == game_states.PLAYING) {
	// check enemy health and destroy if drops below 0
	if (hp < 0) {
		instance_destroy();
	}
	
	// enemy movement
	if (x <= start_x or x >= end_x) {
		dir *= -1;
	}

	x += spd * dir;
	
}


