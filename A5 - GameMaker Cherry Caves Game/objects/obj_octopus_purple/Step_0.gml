/// @description Check for block

// add movement
y += spd * dir;

// check for block
if (place_meeting(x, y, obj_block)) {
	// stop moving
	spd = 0;
	
	// stop animating when stationary
	if (image_index == 1) {
		image_speed = 0;
	}
}
