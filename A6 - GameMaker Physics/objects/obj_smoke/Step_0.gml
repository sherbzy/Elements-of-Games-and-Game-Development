/// @description Insert description here
// You can write your code in this editor

// Fade out the sprite while also growing
// in size.

image_alpha -= fadeRate;
if (image_alpha < 0) {
	instance_destroy();
}

scale += growRate;
image_xscale = scale;
image_yscale = scale;