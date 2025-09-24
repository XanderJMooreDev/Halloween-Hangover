// Checks if we collide with the Zombie Shield. IF we do, we get stunned. 

if stunType == "None" {
	stunType = "Blocked";
	stunTimer = 5;
	audio_play_sound(sfx_zombie_shield, 1, false);
}