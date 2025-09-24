
if hp <= 0 {
	if alarm[2] < 0 {
		alarm[0] = -1;
		alarm[1] = -1;
		sprite_index = spr_wolf_boss_stun;
		
		alarm[2] = 180;
	}
	return;
}

angleX = (angleX * .95 + ((obj_player.x - originX) * .7) * .05);
angleY = (angleY * .95 + ((obj_player.y - originY) * .7) * .05);

if angleX < 0 {
	image_xscale = -3;
}
else if angleX > 0 {
	image_xscale = 3;
}

if moving 
&& x + angleX / 90 <= 1248
&& y + angleY / 90 <= 640
&& x + angleX / 90 >= 0
&& y + angleY / 90 >= 0
&& !place_meeting(x + angleX / 90, y + angleY / 90, obj_gap){
	x += angleX / 90;
	y += angleY / 90;
}
else {
	moving = false;
}