if other.state != "Vampire Dash" {
	moving = false;

	if !audio_is_playing(sfx_vampire_stun) {
		audio_play_sound(sfx_vampire_stun, 1, false);
	}
}