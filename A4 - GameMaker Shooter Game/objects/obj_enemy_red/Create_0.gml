/// @description Initialize variables

hp = 1; // health
atk = 1; // damage enemy can inflict
spd = 1; // speed
dir = 1; // direction, 1 or -1

start_x = x - 25;
end_x = x + 25;

move_down_speed = room_speed * 5; // 5 seconds
alarm[0] = move_down_speed;

// random number range and shoot alarm
rand_min = 300;
rand_max = 840;
alarm[1] = random_range(rand_min, rand_max);
