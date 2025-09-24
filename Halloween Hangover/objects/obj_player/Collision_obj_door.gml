// Runs code if we have a key. 
if hasKey{
	instance_destroy(other);
	audio_play_sound(sfx_unlock_door, 1, false);
}