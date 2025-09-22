if other.state == "Vampire Dash" && moving {
	alarm[0] = 1;
	moving = false;
	sprite_index = spr_wolf_boss_stun;
}
else if other.state == "Wolf Slash" && sprite_index == spr_wolf_boss_stun {
	hp--;
	sprite_index = spr_wolf_boss_stand;
	alarm[0] = 1;
}
else if moving {
	moving = false;
	sprite_index = spr_wolf_boss_scratch;
}