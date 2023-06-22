/// @description Animation

// Rotate the cloud
image_angle += rotSpeed;
y -= driftSpeed;	// how the cloud rises from the ground

// Fade out the cloud
if (image_alpha > 0) {
	image_alpha -= fadeSpeed;	
}

// Destroy the cloud if it has faded completely
if (image_alpha <= 0) {
	instance_destroy();	
}
