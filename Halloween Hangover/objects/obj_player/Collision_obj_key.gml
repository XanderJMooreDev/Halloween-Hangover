// Picks up the key and destroys it, setting that we have the key. 
hasKey = true;
audio_play_sound(sfx_key_pickup, 1, false);
instance_destroy(other);