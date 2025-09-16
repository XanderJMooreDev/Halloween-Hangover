if currentMonster == "Zombie" {
	if abs(x - other.x) > abs(y - other.y) {
		other.velocityX = 5.1 * joystickX;
	}
	else {
		other.velocityY = 5.1 * joystickY;
	}
}
else {
	if attempt_move(x - 5 * joystickX, y - 5 * joystickY) {
		x -= 5 * joystickX;
		y -= 5 * joystickY;
	}
}