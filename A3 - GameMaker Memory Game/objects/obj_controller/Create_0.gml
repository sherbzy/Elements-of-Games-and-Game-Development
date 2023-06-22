/// @description Initialize game
enum game_states {
	WAITING,
	CHECKING,
	WON,
	LOST
};
global.game_state = game_states.WAITING;
global.cards_selected = [noone, noone];

play_time = 60;
cur_time = play_time;

// Overall game controller.
card_number = 8;

// create the deck and its size
deck = ds_list_create();
var deck_size = card_number * 2;

// create and shuffle the deck
create_deck(deck, deck_size, card_number);
shuffle_cards(deck);

alarm[0] = play_time * room_speed;




