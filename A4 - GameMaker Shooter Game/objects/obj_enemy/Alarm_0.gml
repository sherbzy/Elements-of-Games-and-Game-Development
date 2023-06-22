/// @description Fire Bullet

// viewport variables
cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// first check if enemy is in the bounds of the viewport
if ((x - sprite_width/2 >= cam_x) /* right */
	&& (x + sprite_width/2 <= cam_x + cam_w) /* left */
	&& (y - sprite_height/2 >= cam_y) /* up */
	&& (y + sprite_height/2 <= cam_y + cam_h) /* down */) {
	
	// fire an enemy bullet in the direction the enemy is facing if the game state is playing
	if (global.game_state == game_states.PLAYING) {
		var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
		bullet.atk = atk;
		bullet.direction = direction;
		bullet.speed = bullet.spd;
	}
}


// reset alarm
alarm[0] = random_range(rand_min, rand_max);
