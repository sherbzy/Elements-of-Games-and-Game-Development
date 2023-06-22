/// @description Restart the game

// check game state
if (global.game_state == game_states.WON || global.game_state == game_states.LOST) {
	// reset game variables
	global.cards_selected[0] = noone;
	global.cards_selected[1] = noone;
	play_time = 60;
	cur_time = play_time;
	card_number = 8;
	
	// shuffle and reset the cards
	shuffle_cards(deck);
	
	// set game state and start alarm
	global.game_state = game_states.WAITING;
	alarm[0] = play_time * room_speed;
}
