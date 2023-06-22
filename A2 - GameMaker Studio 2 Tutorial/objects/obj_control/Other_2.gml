/// @description Game variables

// Game variables
global.playerControl = true;
townBGMvolume = audio_sound_get_gain(snd_townBGM);
townAmbienceVolume = audio_sound_get_gain(snd_townAmbience);
global.gameOver = false;
global.gameStart = false;

// Player States
enum playerState {
	IDLE,
	WALKING,
	PICKINGUP,
	CARRYING,
	CARRYIDLE,
	PUTTINGDOWN,
}

// Item states
enum itemState {
	IDLE,
	TAKEN,
	USED,
	PUTTINGBACK,
}

// Sequence States - Session 5
enum seqState {
	NOTPLAYING,
	WAITING,
	PLAYING,
	FINISHED,
}

// Sequence variables - Session 5
sequenceState = seqState.NOTPLAYING;
curSeqLayer = noone;
curSeq = noone;

// NPC states
enum npcState {
	NORMAL,
	DONE,
}


