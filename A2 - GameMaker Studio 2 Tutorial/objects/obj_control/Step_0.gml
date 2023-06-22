/// @description Deal with sequences by state

// Control Sequences
switch sequenceState {
	case seqState.PLAYING: {
		// fade out town music
		if (audio_is_playing(snd_townBGM)) {
			audio_sound_gain(snd_townBGM, 0, 60);	
		}
		
		// fade out town ambience
		if (audio_is_playing(snd_townAmbience)) {
			audio_sound_gain(snd_townAmbience, 0, 60);
		}
		
		global.playerControl = false;
	}; break;
	case seqState.FINISHED: {
		// remove sequence
		if (layer_sequence_exists(curSeqLayer, curSeq)) {
			layer_sequence_destroy(curSeq);
		}
		
		// restore town music
		if (audio_is_playing(snd_townBGM) && audio_sound_get_gain(snd_townBGM) < townBGMvolume) {
			audio_sound_gain(snd_townBGM, townBGMvolume, 60);
		}
		
		// restore town ambience
		if (audio_is_playing(snd_townAmbience) && audio_sound_get_gain(snd_townAmbience) < townAmbienceVolume) {
			audio_sound_gain(snd_townAmbience, townAmbienceVolume, 60);
		}
		
		// restore control to the player and reset
		global.playerControl = true;
		sequenceState = seqState.NOTPLAYING;
		curSeq = noone;
		
		// Check if NPCs are "done"
		if (global.gameOver == false) {
			if (obj_npc_baker.myState == npcState.DONE && obj_npc_teacher.myState == npcState.DONE && obj_npc_grocer.myState == npcState.DONE) {
				// queue up "game over" sequence
				global.playerControl = false;
				alarm[0] = 60;
				
				// mark game as won
				global.gameOver = true;
			}
		}
		
		
	}; break;
}
