/// @description Beat level, go to next level

audio_play_sound(snd_goal, 1, false);
room_goto_next();


// reset starting position
obj_player.start_x = obj_player.x;
obj_player.start_y = obj_player.y;