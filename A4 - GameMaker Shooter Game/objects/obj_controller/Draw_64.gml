/// @description Draw score, health, game state, etc

// draw the score in the top corner of the screen
draw_set_font(fnt_score);
draw_set_color(c_white);
draw_text(30, 30, "SCORE: " + string(score));

// check the room and the game state
// check the game state
switch (global.game_state) {
	case game_states.PAUSED:
		draw_set_font(fnt_paused);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "PAUSE");
		break;
	case game_states.GAMEOVER:
		draw_set_font(fnt_gameover);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "GAME OVER");
		
		// print win or loss
		if (player_won) {
			draw_set_font(fnt_winorlose);
			draw_text(display_get_gui_width()/2 + 200, display_get_gui_height()/2 + 100, "You won!");
		} else {
			draw_set_font(fnt_winorlose);
			draw_text(display_get_gui_width()/2 + 200, display_get_gui_height()/2 + 100, "You lose!");
		}
		break;
}

// draw the player's lives in the bottom corner of the screen
if (instance_exists(obj_player)) {
	var xhp = 30;
	repeat (obj_player.hp) {
		draw_sprite(spr_life, 0, xhp, 650);
		xhp += 30;
	}
}