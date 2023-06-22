/// @description Track Player Score

// draw a rectangle background
draw_set_color(c_black);
draw_rectangle(0, 0, spr_star.sprite_width + 80, 40, false);

// draw the score
draw_set_color(c_white);
draw_set_font(fnt_score);
draw_text(20, 10, "SCORE: " + string(score) + "/" + string(global.stars));

// draw the star sprite
draw_sprite_ext(spr_star, 1, 220, 20, 1.3, 1.3, 0, c_white, 1);

