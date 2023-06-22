/// @description Check for next room and game end

// move from the title screen to level 1 when enter is pressed
if (keyboard_check_pressed(vk_enter) && room == Title) {
	room_goto_next();
}

// move to level 2 when all the cherries are collected
if (global.cherries == global.max_cherries && room == Room1) {
	// reset cherries
	global.cherries = 0;
	
	alarm[0] = 20;
}

if (keyboard_check_pressed(vk_escape)) {
	game_end();
}
