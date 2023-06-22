// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// script used to add gravitational pull to a sun or planet
function createGravitationalPull(grav_factor){
	// compute the distance from the player to the sun/planet
	var dist = point_distance(obj_astronaut.x, obj_astronaut.y, x, y);

	// compute the pull of the sun/planet - some factor * (1 / distance-squared)
	var grav_force = grav_factor * (1 / (dist * dist));

	// compute the direction from the player to the sun/planet
	var dir = point_direction(obj_astronaut.x, obj_astronaut.y, x, y);

	// add gravitational pull to the astronaut's movement
	if (dist >= 20) {
		with (obj_astronaut) {
			motion_add(dir, grav_force);
		}
	}
	
	
}