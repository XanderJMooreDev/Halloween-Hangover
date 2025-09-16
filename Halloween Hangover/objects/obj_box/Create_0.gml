velocityX = 0;
velocityY = 0;

attempt_move = function(moveX, moveY) {
	if place_meeting(moveX, moveY, obj_gap) {
		instance_destroy();
	}
	
	return !place_meeting(moveX, moveY, obj_terrain);
}