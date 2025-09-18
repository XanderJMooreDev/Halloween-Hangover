velocityX = 0;
velocityY = 0;

// Defines a function that returns whether the attempted move would push the box into a wall. Also
// deletes the box if it falls into a pit.
attempt_move = function(moveX, moveY) {
	if place_meeting(moveX, moveY, obj_gap) {
		instance_destroy();
	}
	
	return !place_meeting(moveX, moveY, obj_terrain)
	&& !place_meeting(moveX, moveY, obj_door)
	&& !place_meeting(moveX, moveY, obj_enemy_default);
}