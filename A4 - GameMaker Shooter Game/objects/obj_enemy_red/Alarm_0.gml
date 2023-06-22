/// @description Move enemy down

// only move enemies if the game state is playing
if (global.game_state == game_states.PLAYING) {
	y += 30;
	alarm[0] = move_down_speed;
}