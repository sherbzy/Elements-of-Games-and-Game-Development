/// @description Camera and Player Movement

// Set the speed of player and camera.
// Snap the player to stay in the viewport.
if (instance_exists(obj_player)) {
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	
	// when at the end of the level, stop the camera
	if (cam_y <= 0) {
		spd = 0;
		
		// set gameover and player won!
		global.game_state = game_states.GAMEOVER;
		obj_controller.player_won = true;
	}
	
	// Keeping the player in the bounds of the viewport.
	if (obj_player.x - obj_player.sprite_width/2 <= cam_x) {
		obj_player.x = cam_x + obj_player.sprite_width/2;
	}
	
	if (obj_player.y - obj_player.sprite_height/2 <= cam_y) {
		obj_player.y = cam_y + obj_player.sprite_height/2;
	}
	
	if (obj_player.y + obj_player.sprite_height/2 >= cam_y + cam_h) {
		obj_player.y = cam_y + cam_h - obj_player.sprite_height/2;
	}
	
	// check game state before setting speed
	if (global.game_state == game_states.PLAYING) {
		speed = spd;
		obj_player.speed = spd;
	} else if (global.game_state == game_states.PAUSED) {
		speed = 0;
		obj_player.speed = 0;
	} 
	
	// destroy any bullets that are not within view
	for (var i = 0; i < instance_number(obj_bullet_enemy); i++) {	// enemy bullets
		if ((instance_find(obj_bullet_enemy, i).y <= cam_y) || instance_find(obj_bullet_enemy, i).y >= cam_y + cam_h) {
			show_debug_message("destroying bullet - left window on y axis");
			instance_destroy(instance_find(obj_bullet_enemy, i));
		} else if ((instance_find(obj_bullet_enemy, i).x <= cam_x) || instance_find(obj_bullet_enemy, i).x >= cam_x + cam_w) {
			show_debug_message("destroying bullet - left window on x axis");
			instance_destroy(instance_find(obj_bullet_enemy, i));
		}
	}
	
	for (var i = 0; i < instance_number(obj_bullet_player); i++) {	// player bullets
		if (instance_find(obj_bullet_player, i).y <= cam_y) {
			instance_find(obj_bullet_player, i).with_explosion = false;
			instance_destroy(instance_find(obj_bullet_player, i));
		}
	}
} else {	// the player was destroyed, so stop the camera
	speed = spd;
}
	

	
	
	