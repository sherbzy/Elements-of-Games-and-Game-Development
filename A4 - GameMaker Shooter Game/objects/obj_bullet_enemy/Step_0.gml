/// @description Movement based on game state

if (global.game_state == game_states.PLAYING) {
	speed = 10;
} else if (global.game_state == game_states.PAUSED || global.game_state == game_states.GAMEOVER) {
	speed = 0;
}
