/// @description Change direction

if (place_meeting(x, y, obj_block)) {
	dir *= -1;
}

x += spd * dir;

/* if (place_meeting(x, y, obj_player)) {
	with (obj_player) {
		onMovingPlatform = true;
	}
} else {
	with (obj_player) {
		onMovingPlatform = false;
	}
} */