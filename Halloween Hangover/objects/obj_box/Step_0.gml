if (attempt_move(x + velocityX, y + velocityY)) {
	x += velocityX;
	y += velocityY;
}

velocityX = 0;
velocityY = 0;