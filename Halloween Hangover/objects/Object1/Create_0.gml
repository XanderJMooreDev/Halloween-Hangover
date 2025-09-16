hasVampire = false;
hasWerewolf = false;
hasZombie = false;
hasKey = false;

state = "Idle";

joystickX = 0;
joystickY = 0;
facingDir = 1;

image_xscale = 2;
image_yscale = 2;

currentMonster = "Zombie";
actionJoystickX = 0;
actionJoystickY = 0;
action = "None";
actionTime = 0;
pushingTime = 0;
animationFrame = 0;

start_monster_abilities = function() {
	if actionTime > -1 {
		return;
	}
	
	if currentMonster == "Vampire" {
		actionJoystickX = joystickX * 3;
		actionJoystickY = joystickY * 3;
		
		action = "Vampire Dash";
		actionTime = .4;
	}
	else if currentMonster == "Werewolf" {
		
	}
}

apply_monster_joystick = function() {
	if actionTime > -1 {
		actionTime -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if pushingTime > 0 {
		state = "Zombie Push";
		pushingTime -= 1 / game_get_speed(gamespeed_fps);
	}
	
	animationFrame -= 1 / game_get_speed(gamespeed_fps);
	
	if actionTime > 0 {
		if action == "Vampire Dash" || action == "Werewolf Slash" {
			joystickX = actionJoystickX;
			joystickY = actionJoystickY;
			
			state = action;
		}
	}
	else if action != "None" {
		action = "None";
	}
}

death = function() {
	show_debug_message("Died");
}

transform = function(form) {
	if actionTime > 0 || form == currentMonster {
		return;
	}
}

attempt_move = function(moveX, moveY) {
	if place_meeting(moveX, moveY, obj_gap) && action != "Vampire Dash" {
		death();
	}
	return !place_meeting(moveX, moveY, obj_terrain) 
		&& (hasKey || !place_meeting(moveX, moveY, obj_door));
}

animate = function(animation) {
	draw_sprite_ext(
			animation,
			floor(animationFrame % sprite_get_number(animation)),
			x,
			y,
			facingDir * 2,
			2,
			0,
			make_color_rgb(255,255,255),
			1
		);
}