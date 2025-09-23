// Get stunned if it's dashed through. 
if other.state == "Vampire Dash" {
	stunType = "Confused";
	stunTimer = 6;
	sprite_index = spr_mothman_boss_stun;
}