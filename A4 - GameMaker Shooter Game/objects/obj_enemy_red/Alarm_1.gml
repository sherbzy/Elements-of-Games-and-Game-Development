/// @description Enemy fires bullet straight down


// fire an enemy bullet straight down if the game state is playing
if (global.game_state == game_states.PLAYING) {
	var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
	bullet.atk = atk;
	bullet.direction = point_direction(x, y, x, y+1);	// straight down
	bullet.speed = bullet.spd;
}


// reset alarm
alarm[1] = random_range(rand_min, rand_max);


