
if hp <= 0 {
	if sprite_index != spr_wolf_boss_stun {
		alarm[0] = 100000000;
		alarm[1] = 100000000;
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
&& y + angleY / 90 >= 0 {
	x += angleX / 90;
	y += angleY / 90;
}
else {
	moving = false;
}