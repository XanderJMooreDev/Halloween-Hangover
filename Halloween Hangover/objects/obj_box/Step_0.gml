// Makes a move ONLY IF the move is valid. velocityX and velocityY are set by the player.
if (attempt_move(x + velocityX, y + velocityY)) {
	x += velocityX;
	y += velocityY;
}

velocityX = 0;
velocityY = 0;