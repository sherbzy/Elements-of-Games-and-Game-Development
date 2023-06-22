/// @description Insert Sorting and other

// Depth and animation
switch myState {
	case itemState.IDLE: {	// if item is sitting on the ground
		depth = -y;
	}; break;
	case itemState.TAKEN: {	// if item has been taken
		// keep track of player position
		var _result = scr_itemPosition();
		x = _result[0];
		y = _result[1];
		depth = _result [2];
	}; break;
	case itemState.PUTTINGBACK: {	// if item is being put back
		y = putDownY;
		myState = itemState.IDLE;
	}; break;
}
