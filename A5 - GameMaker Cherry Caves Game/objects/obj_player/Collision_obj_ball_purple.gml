/// @description Handle Collision

audio_play_sound(snd_damage, 1, false);
effect_create_above(ef_explosion, x, y, 1, c_blue);
alarm[0] = 1;
