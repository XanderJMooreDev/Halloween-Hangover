if hp <= 0 {
	if sprite_index != spr_mothman_boss_stun {
		sprite_index = spr_mothman_boss_stun;
		alarm[0] = 1000000;
		
		alarm[2] = 180;
	}
	return;
}

// Reduces the stunTimer every frame. 
if stunTimer > 0 {
	stunTimer -= 1 / game_get_speed(gamespeed_fps);
}
// If the stunTimer is up and we're still stunned, we make this update. 
else if stunType != "None" {
	stunType = "None";
}

// We use typical movement code here if not stunned. 
if stunType == "None" {
	enemy_joystick(obj_player);

	if attempt_move(x + 3 * joystickX, y) {
		x += 3 * joystickX;
	}

	if attempt_move(x, y + 3 * joystickY) {
		y += 3 * joystickY;
	}
}
// If we are stunned, we basically do the exact same code as obj_box. 
else {

	if (attempt_move_push(x + velocityX, y)) {
		x += velocityX;
	}
	if (attempt_move_push(x, y + velocityY)) {
		y += velocityY;
	}
	
	velocityX = 0;
	velocityY = 0;
}

show_debug_message(hp);