/// @description Initialize control variables

enum game_states {
	PLAYING,
	PAUSED,
	GAMEOVER
};

global.game_state = game_states.PLAYING;

// win or loss
player_won = false;

// switch rooms alarm
alarm[0] = -1;