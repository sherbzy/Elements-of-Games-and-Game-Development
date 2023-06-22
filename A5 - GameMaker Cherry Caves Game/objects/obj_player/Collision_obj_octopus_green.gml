/// @description Handle Collision with Green Octopus

// check if Berry is bonking the octopus on the head
if ((y + sprite_height/2) < other.y) {
	// destroy octopus
	audio_play_sound(snd_squash, 1, false);
	effect_create_above(ef_explosion, x, y, 1, c_green);
	instance_destroy(other);
	
	// have Berry jump off of octopus
	audio_play_sound(snd_jump, 1, false);
	force_jump = true;
} else {
	// take a Berry life
	audio_play_sound(snd_damage, 1, false);
	effect_create_above(ef_explosion, x, y, 1, c_blue);
	alarm[0] = 1;
}
