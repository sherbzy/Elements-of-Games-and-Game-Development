/// @description Keep Track of Lives, Cherries


if (room = Title) {
	draw_set_color(c_red);
	draw_set_font(fnt_score);
	draw_text(100, 100, "PRESS ENTER TO START!");
} else if (room == Room1) {
	// draw black rectangle
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, 40, false);

	// draw the score on the left
	draw_set_color(c_white);
	draw_set_font(fnt_score);
	draw_text(20, 10, "SCORE: " + string(score));

	// draw the cherry sprite and the number of cherries
	draw_sprite_ext(spr_cherry, -1, (room_width/2)-35, 5, 0.5, 0.5, 0, c_white, 1);
	draw_text(room_width/2, 10, string(global.cherries) + "/" + string(global.max_cherries));

	// draw the player sprite and the number of lives
	draw_sprite_ext(spr_player_idle, -1, room_width-110, 20, 0.5, 0.5, 0, c_white, 1);
	draw_text(room_width-100, 10, " x " + string(global.lives));
	
	
	/*
		Check for gameover
	*/
	if (global.lives <= 0) {
		global.gameover = true;
		
		draw_set_color(c_black);
		draw_set_font(fnt_gameover);
		draw_text(400, 350, "GAME OVER!");
	}
} else if (room == Room2) {
		// draw black rectangle
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, 40, false);

	// draw the score on the left
	draw_set_color(c_white);
	draw_set_font(fnt_score);
	draw_text(20, 10, "SCORE: " + string(score));
	
	// draw the cherry sprite and the number of cherries
	draw_sprite_ext(spr_cherry, -1, view_xport[0] + (view_wport[0]/2)-35, view_yport[0]+5, 0.5, 0.5, 0, c_white, 1);
	draw_text(view_xport[0] + view_wport[0]/2, view_yport[0]+10, string(global.cherries) + "/" + string(global.max_cherries));

	// draw the player sprite and the number of lives
	draw_sprite_ext(spr_player_idle, -1, view_xport[0] + view_wport[0]-110, view_yport[0]+20, 0.5, 0.5, 0, c_white, 1);
	draw_text(view_xport[0] + view_wport[0]-100, view_yport[0]+10, " x " + string(global.lives));
	
	
	/*
		Check for gameover
	*/
	if (global.lives <= 0) {
		global.gameover = true;
		
		draw_set_color(c_black);
		draw_set_font(fnt_gameover);
		draw_text(400, 350, "GAME OVER!");
	}
	
	if (global.cherries == global.max_cherries) {
		global.gameover = true;
		
		draw_set_color(c_black);
		draw_set_font(fnt_gameover);
		draw_text(400, 350, "YOU WON!");
	}
}
