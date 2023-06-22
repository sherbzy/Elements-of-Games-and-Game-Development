/// @description Track The Player

event_inherited();

if (instance_exists(obj_player)) {
	var dir = point_direction(x, y, obj_player.x, obj_player.y);
	direction = dir;
	image_angle = dir;
}