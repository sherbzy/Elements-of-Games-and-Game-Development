/// @description Change to room 2

// launch level 2
room_goto(rm_level_2);

// reset game state
global.game_state = game_states.PLAYING;

// reset player health
obj_player.hp = 10;

