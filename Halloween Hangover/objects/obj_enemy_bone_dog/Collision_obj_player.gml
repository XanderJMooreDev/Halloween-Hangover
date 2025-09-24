// Get stunned if it's dashed through. 
if other.state == "Vampire Dash" {
	stunType = "Confused";
	stunTimer = 6;
	sprite_index = spr_bone_dog_stun;
	audio_play_sound(sfx_vampire_stun, 1, false);
}