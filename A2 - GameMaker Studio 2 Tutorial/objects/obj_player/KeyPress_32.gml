/// @description Textbox test

// Create a temp variable
var _text, _seq;

/*
	The following code block handles the creation of textboxes based on the player's proximity
	to items and/or NPCs
*/
// If the player has control
if (global.playerControl == true) {
	// If the player is near an NPC
	if (nearbyNPC) {
		// If NPC is still available
		if (nearbyNPC.myState == npcState.NORMAL) {
			// If the player doesn't have an item
			if (hasItem == noone || hasItem == undefined) {
				_text = nearbyNPC.myText;
				if (!instance_exists(obj_textbox)) {
					iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y - 400, -10000, obj_textbox);
					iii.textToShow = _text;
				}
			}
		
			// If the player has item (and it still exists)
			if (hasItem != noone && instance_exists(hasItem)) {
				// If the player has correct item
				if (hasItem.object_index == nearbyNPC.myItem) {
					_text = nearbyNPC.itemTextHappy;	
					_seq = nearbyNPC.sequenceHappy;
				
					// check if we should remove item, mark NPC
					alarm[1] = 10;
				} else {	// Or if the player has the incorrect item
					_text = nearbyNPC.itemTextSad;
					_seq = nearbyNPC.sequenceSad;
				}
			
				// Create textbox
				if (!instance_exists(obj_textbox)) {
					iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y - 400, -10000, obj_textbox);
					iii.textToShow = _text;
					iii.sequenceToShow = _seq;
				}
			}
		}
		
		// If NPC is "done"
		if (nearbyNPC.myState == npcState.DONE) {
			_text = nearbyNPC.itemTextDone;
			if (!instance_exists(obj_textbox)) {
				iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y - 400, -10000, obj_textbox);
				iii.textToShow = _text;
			}
		}
	}
	
	
	// If the player is near an item
	if (nearbyItem && !nearbyNPC) {
		// If the player doesn't have an item
		if (hasItem == noone || hasItem == undefined) {
			global.playerControl = false;
			myState = playerState.PICKINGUP;
			image_index = 0;
			hasItem = nearbyItem;
			
			// take into account the weight of the item that is being picked up
			carryLimit = hasItem.itemWeight * 0.1;
			
			// change the state of the item being picked up
			with (hasItem) {
				myState = itemState.TAKEN;
			}
			
			// play pickup sound
			audio_play_sound(snd_itemPickup, 1, 0);
		}
	}
	
	// If the player is not near an NPC or another item
	if (!nearbyItem && !nearbyNPC) {
		// put down	an item
		if (hasItem != noone) {
			myState = playerState.PUTTINGDOWN;
			image_index = 0;
			global.playerControl = false;
			
			// change the state of the item we were carrying
			with (hasItem) {
				putDownY = obj_player.y + 5;
				myState = itemState.PUTTINGBACK;
			}
			
			// play put-down sound
			audio_play_sound(snd_itemPutDown, 1, 0);
			
			// reset item
			hasItem = noone;
		}
	}
}

/* // Create a textbox
if (nearbyNPC && global.playerControl == true) {	// first check if near NPC
	_text = nearbyNPC.myText;
	if (!instance_exists(obj_textbox)) {
		// create an instance of a textbox object if one does not already exist
		iii = instance_create_depth(x, y, -10000, obj_textbox);	// note: iii sorta means "instance"
		iii.textToShow = _text;
	}
} */	// code block replaced in session 4
