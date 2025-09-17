stunType = "None";
joystickX = 0;
joystickY = 0;

velocityX = 0;
velocityY = 0;

stunTimer = 0;

enemy_joystick = function(target) {
	if stunType != "None" {
		joystickX = 0;
		joystickY = 0;
		return;
	}
	
	if target.x > x + 10 {
		joystickX = 1;
	}
	else if target.x < x - 10 {
		joystickX = -1;
	}
	else {
		joystickX = 0;
	}
	
	if target.y > y + 10 {
		joystickY = 1;
	}
	else if target.y < y - 10 {
		joystickY = -1;
	}
	else {
		joystickY = 0;
	}
}

attempt_move = function(moveX, moveY) {
	
	return !place_meeting(moveX, moveY, obj_terrain) 
		&& !place_meeting(moveX, moveY, obj_door)
		&& !place_meeting(moveX, moveY, obj_box)
		&& !place_meeting(moveX, moveY, obj_gap);
}

attempt_move_push = function(moveX, moveY) {
	if place_meeting(moveX, moveY, obj_gap) {
		instance_destroy();
	}
	
	return !place_meeting(moveX, moveY, obj_terrain)
		&& !place_meeting(moveX, moveY, obj_door)
		&& !place_meeting(moveX, moveY, obj_box);
}