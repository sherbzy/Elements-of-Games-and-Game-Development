/// @description Cards Match

// make cards disappear
global.cards_selected[0].visible = false;
global.cards_selected[1].visible = false;

// reset game state and cards selected
global.game_state = game_states.WAITING;
global.cards_selected[0] = noone;
global.cards_selected[1] = noone;

