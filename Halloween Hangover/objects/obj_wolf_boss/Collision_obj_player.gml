if other.state == "Vampire Dash" && moving {
	alarm[0] = 1;
	moving = false;
	sprite_index = spr_wolf_boss_stun;
	if !audio_is_playing(sfx_vampire_stun) {
		audio_play_sound(sfx_vampire_stun, 1, false);
	}
}
else if other.state == "Wolf Slash" && sprite_index == spr_wolf_boss_stun {
	hp--;
	sprite_index = spr_wolf_boss_stand;
	alarm[0] = 1;
	if !audio_is_playing(sfx_enemy_hurt) {
		audio_play_sound(sfx_enemy_hurt, 1, false);
	}
}
else if moving {
	moving = false;
	sprite_index = spr_wolf_boss_scratch;
}