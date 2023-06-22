// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function makeSmoke(){
	var smokeObj = instance_create_layer(x, y, "Instances", obj_smoke);
	smokeObj.speed = 4;
	smokeObj.direction = image_angle + 180 + irandom_range(-10, 10);
	
	with smokeObj {
		motion_add(direction, speed);
	}
}