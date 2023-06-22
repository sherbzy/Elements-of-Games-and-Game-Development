/// @description Change Direction

if (place_meeting(x, y, obj_block)) {
	dir *= -1;
}

y += spd * dir;