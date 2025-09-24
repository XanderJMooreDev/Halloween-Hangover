// Get stunned if it's dashed through. 
if other.state == "Vampire Dash" {
	stunType = "Confused";
	stunTimer = 6;
	audio_play_sound(sfx_vampire_stun, 1, false);
	sprite_index = spr_mothman_boss_stun;
}