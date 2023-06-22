/// @description Pause the game

// play sound
audio_play_sound(snd_esc, 10, false);

// switch game state
if (global.game_state == game_states.PLAYING) {
	global.game_state = game_states.PAUSED;
} else if (global.game_state == game_states.PAUSED) {
	global.game_state = game_states.PLAYING;
}