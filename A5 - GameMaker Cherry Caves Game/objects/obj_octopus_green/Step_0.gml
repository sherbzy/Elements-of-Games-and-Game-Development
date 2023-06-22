/// @description Change direction when hit a block

if (place_meeting(x, y, obj_block)) {
	dir *= -1;
	image_xscale *= -1;
}

x += spd * dir;
