/// @description Handle Card Click

// When a card is left-clicked.
if (global.game_state == game_states.WAITING) {
	if (face == 0) {
		// Flip card to face up.
		face = 1;
		
		if (global.cards_selected[0] == noone) {
			global.cards_selected[0] = self;
		} else {
			// check to ensure the same card wasn't clicked twice
			if (global.cards_selected[0] != self) {
				global.game_state = game_states.CHECKING;
			
				global.cards_selected[1] = self;
			
				if (global.cards_selected[0].type == global.cards_selected[1].type) {
					// the cards match, make them invisible
					show_debug_message("matchy match");
				
					// add a delay before making the cards disappear
					alarm[1] = 35;				
				} else {
					// the cards do NOT match
					show_debug_message("these cards def DON'T match");
				
					// add a delay before flipping them back over
					alarm[0] = 35;
				}
			}
		}
		
	} else {
		face = 0;
	}
}
