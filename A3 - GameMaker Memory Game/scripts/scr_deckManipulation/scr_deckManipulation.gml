// creaes and initializes each card in the deck
function create_deck(argument0, argument1, argument2) {
	var deck = argument0;
	var deck_size = argument1;
	var card_number = argument2;
	
	// loop through the deck and create each card instance
	for (var i = 0; i < deck_size; i += 1) {
		ds_list_add(deck, instance_create_layer(0, 0, "Instances", obj_card));
	}
	
	// loop through the deck and initialize each card
	for (var i = 0; i < deck_size; i += 1) {
		deck[| i].type = i % card_number; 
		deck[| i].face = 0; 
		deck[| i].index = i; 
		deck[| i].visible = false;
	}
}

// shuffles the cards and positions them visibly on the screen
function shuffle_cards(argument0) {
	var deck = argument0;
	
	randomize();
	ds_list_shuffle(deck);
	
	var cards_x = 130; 
	var cards_y = 100; 
	var deck_size = ds_list_size(deck); 
 
	// position cards on the screen 
	var cards = 1; 
	for (var i = 0; i < deck_size; i+=1) { 
		deck[| i].x = cards_x; 
		deck[| i].y = cards_y; 
		deck[| i].index = i; 
		deck[| i].visible = true; 
		
		// ensure the cards are face down
		deck[| i].face = 0;
 
		if (cards % 4 == 0) { 
			cards_x = 130; 
			cards_y += 160; 
		} else { 
			cards_x += 110; 
		} 
		cards += 1; 
	}
	
}


// checks to see if all cards in the deck have been paired correctly
function all_cards_paired(argument0, argument1) {
	var deck = argument0;
	var deck_size = argument1;
	
	// loop through all cards and check visibility/unpaired cards
	for (var i = 0; i < deck_size; i += 1) {
		if (deck[| i].visible == true) {
			return false;
		}
	}
	
	// return true if all cards have been paired
	return true;
}



