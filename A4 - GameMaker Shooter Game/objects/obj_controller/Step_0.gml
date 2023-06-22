/// @description Check number of enemies

// first check room...
if (room = rm_level_1) {
	// if there are no enemies left, switch game state to game over
	if (!instance_exists(obj_enemy_red)) {
		global.game_state = game_states.GAMEOVER;
		player_won = true;
	
		// switch rooms to level 2 if the player wins
		if (alarm[0] < 0) {
			alarm[0] = 300;
		}
	}

	// if the player was destroyed, switch game state to game over
	if (!instance_exists(obj_player)) {
		global.game_state = game_states.GAMEOVER;
		player_won = false;
	}
} else if (room = rm_level_2) {
	// if the player was destroyed, switch game state to game over
	if (!instance_exists(obj_player)) {
		show_debug_message("player was destroyed");
		global.game_state = game_states.GAMEOVER;
		player_won = false;
		obj_camera.spd = 0;
	}
}
