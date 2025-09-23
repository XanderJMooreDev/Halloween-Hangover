// Checks if we collide with the Zombie Shield. IF we do, we get stunned. 

if stunType == "None" {
	stunType = "Blocked";
	stunTimer = 5;
	
	if room == Level2 || room == room_wolf_fight {
		sprite_index = spr_pumpkin_stun;
	}
	else {
		sprite_index = spr_zombie_stun;
	}
}