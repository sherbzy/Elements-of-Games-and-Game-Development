/// @description Handle Cherry Collection

// play the cherry sound
audio_play_sound(snd_cherry, 1, false);

// add one to the score and destroy the cherry
global.cherries += 1;
instance_destroy(other);
