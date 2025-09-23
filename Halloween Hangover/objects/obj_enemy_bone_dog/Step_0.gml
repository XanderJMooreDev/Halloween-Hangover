// Reduces the stunTimer every frame. 
if stunTimer > 0 {
	stunTimer -= 1 / game_get_speed(gamespeed_fps);
}
// If the stunTimer is up and we're still stunned, we make this update. 
else if stunType != "None" {
	stunType = "None";
	sprite_index = spr_bone_dog_walk;
}

// We use typical movement code here if not stunned. 
if stunType == "None" {
	enemy_joystick(obj_player);

	if attempt_move(x + 2 * joystickX, y) {
		x += 2 * joystickX;
	}

	if attempt_move(x, y + 2 * joystickY) {
		y += 2 * joystickY;
	}
	if joystickX < 0 {
		image_xscale = -1;
	}
	else if joystickX > 0 {
		image_xscale = 1;
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