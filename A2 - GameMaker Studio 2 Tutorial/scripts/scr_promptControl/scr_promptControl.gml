// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_showPrompt(_object, _x, _y) {
	// check  if the object exists
	if (instance_exists(_object)) {	
		// check if no textbox & prompt exist
		if (!instance_exists(obj_textbox) && !instance_exists(obj_prompt)) {
			if (obj_player.myState != playerState.PUTTINGDOWN) {
				iii = instance_create_depth(_x, _y, -10000, obj_prompt);
				return iii;
			}
		}
	}
}


function scr_dismissPrompt(_whichPrompt, _toReset) {
	// make sure the prompt still exists
	if (_whichPrompt != undefined) {
		if (instance_exists(_whichPrompt)) {
			// tell the prompt object to fade out
			with (_whichPrompt) {
				fadeMe = "fadeOut";	
			}
			
			// reset appropriate prompt variables
			if (instance_exists(obj_player)) {
				with(obj_player) {
					switch _toReset {
						case 0:	// reset npcPrompt
							npcPrompt = noone;
							break;
						case 1:	// reset itemPrompt
							itemPrompt = noone;
							break;
					}
				}
			}
		}
	}
}
