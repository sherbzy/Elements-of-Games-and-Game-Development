/// @description Draw textbox

// Draw textbox
draw_self();	// basically, draw the sprite as normal

// Draw text
draw_set_font(fnt_textbox);
// draw_set_color(c_black);
draw_set_halign(fa_center);	// horizontal alignment: center
draw_set_valign(fa_middle);	// vertical alignment: middle
//draw_text(x, y, textToShow);
draw_text_ext_color(x, y, textToShow, lineHeight, textWidth, c_black, c_black, c_black, c_black, image_alpha);