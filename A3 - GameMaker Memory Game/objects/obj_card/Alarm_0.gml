/// @description Cards Don't Match

// Flip the two cards over
global.cards_selected[0].face = 0;
global.cards_selected[1].face = 0;

// reset game state and cards selected
global.game_state = game_states.WAITING;
global.cards_selected[0] = noone;
global.cards_selected[1] = noone;
