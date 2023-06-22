/// @description Deal with objects and NPC states

// remove object
if (hasItem != noone && instance_exists(hasItem)) {
	// destroy the item
	with (hasItem) {
		instance_destroy();	
	}
	
	// reset my item variables
	hasItem = noone;
	carryLimit = 0;
}

// mark NPC as done
if (nearbyNPC != noone && instance_exists(nearbyNPC)) {
	// set the NPC as done
	with (nearbyNPC) {
		myState = npcState.DONE;
	}
}

