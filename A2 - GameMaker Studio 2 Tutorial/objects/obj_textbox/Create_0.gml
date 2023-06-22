/// @description Variables and setup

// Textbox variables
textToShow = "This is a longer sentence, stupid head, with which I am testing width...";
textWidth = 450;
lineHeight = 28;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone;	// session 6

// turn the player controls off when the textbox is created
global.playerControl = false;

// Play UI sound
audio_play_sound(snd_pop01, 1, 0);	// arguments (sound, priority, loop)

// Dismiss any visible prompts
scr_dismissPrompt(obj_prompt, 0);