if hp <= 0 {
	if sprite_index != spr_vampire_boss_stun {
		sprite_index = spr_vampire_boss_stun;
		alarm[0] = 1000000;
		alarm[1] = 1000000;
		
		alarm[2] = 180;
	}
	return;
}

angleX = (angleX * .95 + (obj_player.x - originX) * .05);
angleY = (angleY * .95 + (obj_player.y - originY) * .05);

if angleX < 0 {
	image_xscale = -2;
}
else if angleX > 0 {
	image_xscale = 2;
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