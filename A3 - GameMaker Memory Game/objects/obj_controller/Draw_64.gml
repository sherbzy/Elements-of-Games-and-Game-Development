/// @description Timer and GameOver Check

/*
	Check for the end of the timer
*/
if (alarm[0] = -1) {
	// alarm ended, so check for win or loss
	if (all_cards_paired(deck, card_number * 2) == true) {	// print win
		// print that the player won
		draw_set_font(fnt_gameOver);
		draw_set_color(c_white);
			// center the text
		draw_set_halign(fa_center);
		draw_set_halign(fa_middle);
		draw_text((display_get_gui_width() / 2), (display_get_gui_height() / 2), "You won!");
		
		// change game state
		global.game_state = game_states.WON;
		
		// print to press enter to restart
		draw_set_font(fnt_restartGame);
		draw_set_color(c_red);
		draw_text((display_get_gui_width() / 2), (display_get_gui_height() / 2), "Press \"ENTER\" to restart the game.");
	} else {	// loss
		// print that the player lost
		draw_set_font(fnt_gameOver);
		draw_set_color(c_white);
			// center the text
		draw_set_halign(fa_center);
		draw_set_halign(fa_middle);
		draw_text((display_get_gui_width() / 2), (display_get_gui_height() / 2), "You lost :(");
		
		// change the game state
		global.game_state = game_states.LOST;
		
		// print to press enter to restart
		draw_set_font(fnt_restartGame);
		draw_set_color(c_red);
		draw_text((display_get_gui_width() / 2), (display_get_gui_height() / 2), "Press \"ENTER\" to restart the game.");
	}

	
} else {	// alarm still running, check for win or increment timer
	if (all_cards_paired(deck, card_number * 2) == true) {
		// you won!
		show_debug_message("Winner winner chicken dinner!!");
	
		// stop the timer and change game state
		global.game_state = game_states.WON;
	
		// print that the player won
		draw_set_font(fnt_gameOver);
		draw_set_color(c_white);
			// center the text
		draw_set_halign(fa_center);
		draw_set_halign(fa_middle);
		draw_text((display_get_gui_width() / 2), (display_get_gui_height() / 2), "You won!");
		
		// print to press enter to restart
		draw_set_font(fnt_restartGame);
		draw_set_color(c_red);
		draw_text((display_get_gui_width() / 2), (display_get_gui_height() / 2), "Press \"ENTER\" to restart the game.");
	} else {
		// not won yet...
		show_debug_message("keep playing...");
	
		// decrement the timer
		cur_time = ceil(alarm[0] / room_speed);

		// draw the timer gui
		draw_set_font(fnt_arial);
		draw_set_color(c_white);
		draw_text(90, 10, "Time Left: " + string(cur_time));
	}
}