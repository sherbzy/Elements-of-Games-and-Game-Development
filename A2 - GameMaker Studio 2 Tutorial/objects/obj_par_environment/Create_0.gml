/// @description Variables and setup

// Emitter variables
myEmitter = 0;

// Create emitter
if (useSound != noone) {	// if a sound variable has been chosen
	if (!audio_is_playing(useSound)) {	// ensure the sound is not currently playing
		myEmitter = audio_emitter_create();	// create an audio emitter
		audio_emitter_position(myEmitter, x, y, 0);	// set its position to the current object's x,y
		audio_falloff_set_model(audio_falloff_exponent_distance);	// determine how the audio fades with distance
		audio_emitter_falloff(myEmitter, fallStart, maxDist, 1);	//  set the audio falloff variables
		audio_play_sound_on(myEmitter, useSound, 1, 1);	// emit the sound
	}	
}
