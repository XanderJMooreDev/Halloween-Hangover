stunType = "None";
joystickX = 0;
joystickY = 0;

n = 0;

hp = 30;

alarm[0] = 120;

velocityX = 0;
velocityY = 0;

stunTimer = 0;

// Updates the enemy's movement command based on several factors.
enemy_joystick = function(target) {
	// If the enemy is stunned, it doesn't move and skips the rest of the code with "return". 
	if stunType != "None" {
		joystickX = 0;
		joystickY = 0;
		return;
	}
	
	// We check horizontal movement by seeing if the player is left or right of it. 
	if target.x > x + 10 {
		joystickX = 1;
	}
	else if target.x < x - 10 {
		joystickX = -1;
	}
	// If they're roughly in-line with the player, we don't move horizontally. 
	else {
		joystickX = 0;
	}
	
	// Almost identical to horizontal code. 
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

// Returns whether an attempted move will put us in an impossible spot. 
attempt_move = function(moveX, moveY) {
	
	return !place_meeting(moveX, moveY, obj_terrain) 
		&& !place_meeting(moveX, moveY, obj_door)
		&& !place_meeting(moveX, moveY, obj_box)
		&& !place_meeting(moveX, moveY, obj_garlic_clove);
}

// The same as attempt_move(), but we allow it to be pushed into a gap, destroying it if we do. 
attempt_move_push = function(moveX, moveY) {
	return !place_meeting(moveX, moveY, obj_terrain)
		&& !place_meeting(moveX, moveY, obj_door)
		&& !place_meeting(moveX, moveY, obj_box);
}