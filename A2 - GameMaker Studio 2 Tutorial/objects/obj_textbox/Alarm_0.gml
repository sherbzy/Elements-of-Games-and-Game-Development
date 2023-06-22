/// @description Destroy me [textbox] and do things

// Return control to player if no sequence to load
if (sequenceToShow == noone) {
	global.playerControl = true;	
}

// Create sequence if appropriate
if (sequenceToShow != noone) {
	// play NPC sequence
	scr_playSequence(sequenceToShow);
	
	/* // set sequence to centre of camera view	
	var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);
	var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);
	
	// make sure our sequence doesn't already exist
	if (instance_exists(obj_control) && !layer_sequence_exists(obj_control.curSeqLayer, sequenceToShow)) {
		if (layer_exists(obj_control.curSeqLayer)) {
			layer_sequence_create(obj_control.curSeqLayer, _camX, _camY, sequenceToShow);
	
			// maker sure cutscenes layer is above the action
			layer_depth(obj_control.curSeqLayer, -10000)
		}
	} */	// Replaced in session 6
}


// Destroy me [textbox]
global.playerControl = true;
instance_destroy();