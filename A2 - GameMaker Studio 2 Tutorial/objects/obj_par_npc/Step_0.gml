/// @description Animation and more

// change appearance with state
switch myState {
	case npcState.NORMAL: {
		// random loop timing
		if (image_speed > 0) {	// is the animation moving?
			if (image_index == image_number) {	// is the animation at the last frame?
				// stop animating for a moment
				image_speed = 0;
				alarm[0] = irandom_range(loopRange01, loopRange02);
			}
		}
	}; break;
	case npcState.DONE: {
		sprite_index = doneSprite;
	}; break;
}

// depth sorting
depth = -y;