/// @description Animation and effects

// Fade effects
switch fadeMe {
	case 0: {	// textbox fading in
		if (image_alpha < 1) {	// start fading if the image is invisible
			image_alpha += fadeSpeed;	
		}
		if (image_alpha == 1) {
			fadeMe = 1;	
		}
	}; break;
	case 2: {	// textbox fading out
		if (image_alpha > 0) {
			image_alpha -= fadeSpeed;	
		}
		if (image_alpha == 0) {	// stop fading if the image is not visible
			fadeMe = 3;
			alarm[0] = 2;	// queue up and destroy
		}
	}; break;
}