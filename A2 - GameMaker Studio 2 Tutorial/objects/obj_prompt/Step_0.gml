/// @description Effects and animation

// Fade effects
switch fadeMe {
	case "fadeIn": {
		if (image_alpha < 1) {	// start fading if the image is invisible
			image_alpha += fadeSpeed;	
		}
		if (image_alpha >= 1) {
			fadeMe = "fadeVisible";
		}
	}; break;
	case "fadeOut": {
		if (image_alpha > 0) {
			image_alpha -= fadeSpeed;	
		}
		if (image_alpha <= 0) {	// stop fading if the image is not visible
			fadeMe = "fadeDone";
			alarm[0] = 2;	// queue up and destroy
		}
	}; break;
}


// Bob up and down
y += shift;
