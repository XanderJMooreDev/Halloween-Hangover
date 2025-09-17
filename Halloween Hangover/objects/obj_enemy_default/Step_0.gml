if stunTimer > 0 {
	stunTimer -= 1 / game_get_speed(gamespeed_fps);
}
else if stunType != "None" {
	stunType = "None";
}

if stunType == "None" {
	enemy_joystick(obj_player);

	if attempt_move(x + 3 * joystickX, y) {
		x += 3 * joystickX;
	}

	if attempt_move(x, y + 3 * joystickY) {
		y += 3 * joystickY;
	}
}
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