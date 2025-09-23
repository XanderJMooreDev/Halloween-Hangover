// Get stunned if it's dashed through. 
if other.state == "Vampire Dash" {
	stunType = "Confused";
	stunTimer = 6;
	
	if room == Level2 || room == room_wolf_fight {
		sprite_index = spr_pumpkin_stun;
	}
	else {
		sprite_index = spr_zombie_stun;
	}
}