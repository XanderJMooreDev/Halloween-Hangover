hasKey = false;

state = "Idle";

joystickX = 0;
joystickY = 0;
facingDir = 1;

walkSpeed = 5;

image_xscale = 1.5;
image_yscale = 1.5;

currentMonster = "Vampire";
actionJoystickX = 0;
actionJoystickY = 0;
action = "None";
actionTime = 0;
pushingTime = 0;
animationFrame = 0;

// All other arrays reference this to know which sprite to use based on currentMonster. 
monster_list = ["Human", "Vampire", "Wolf", "Zombie"];

idle_poses = [spr_idle_human, spr_idle_vampire, spr_idle_wolf, spr_idle_zombie];
walk_poses = [spr_walk_human, spr_walk_vampire, spr_walk_wolf, spr_walk_zombie];
transform_poses = [spr_transform_human, spr_transform_vampire, spr_transform_wolf, spr_transform_zombie];
// Initializing the array that stores whether each ability is unlocked. 

if room == Level1 || room == room_vampire_fight {
	has_ability = [true, true, false, false];
}
else if room == Level2 || room == room_wolf_fight {
	has_ability = [true, true, true, false];
}

start_monster_abilities = function() {
	// Only lets us use a monster ability if the cooldown is up. 
	if actionTime > -.3 {
		return;
	}
	
	// Activates the Vampire Dash
	if currentMonster == "Vampire" {
		// Sets our movement to be faster, stops us from redirecting. 
		actionJoystickX = joystickX * 3;
		actionJoystickY = joystickY * 3;
		
		// Causes a puff of smoke when we turn into a bat. 
		effect_create_layer("Instances", ef_smoke, x, y, 10, c_white);
		
		// Sets the action and cooldown. 
		action = "Vampire Dash";
		actionTime = .35;
	}
	else if currentMonster == "Wolf" {
		actionJoystickX = joystickX * .5;
		actionJoystickY = joystickY * .5;
		
		// Creates the attack's hitbox. 
		instance_create_layer(x, y, "Instances", obj_wolf_scratch);
		
		action = "Wolf Slash";
		actionTime = .35;
	}
	else if currentMonster == "Zombie" {
		actionJoystickX = 0;
		actionJoystickY = 0;
		
		// Creates the shield object. 
		instance_create_layer(x, y, "Instances", obj_shield);
		
		state = "Zombie Shield";
		actionTime = .7;
	}
}

apply_monster_joystick = function() {
	// Updates all the cooldowns
	if actionTime > -.3 {
		actionTime -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if pushingTime > 0 {
		action = "Zombie Push";
		pushingTime -= 1 / game_get_speed(gamespeed_fps);
	}
	
	animationFrame += 4 / game_get_speed(gamespeed_fps);
	
	if actionTime > 0 || pushingTime > 0 {
		// The next 2 if statements make certain attacks prevent inputs.
		if state == "Zombie Shield" {
			joystickX = 0;
			joystickY = 0;
		}
		
		if action == "Vampire Dash" || action == "Wolf Slash" {
			joystickX = actionJoystickX;
			joystickY = actionJoystickY;
			
			state = action;
		}
		
		if action == "Zombie Push" {
			state = action;
		}
	}
	// If we're done doing an action, we set it to none. 
	else if action != "None" {
		action = "None";
	}
}

// Placeholder "Death" function. 
death = function() {
	room_goto(room);
}

// Allows us to transform into the specified transformation. 
transform = function(form) {
	if actionTime > 0 || form == currentMonster || !has_ability[array_get_index(monster_list, form)] {
		return;
	}
	else {
		actionTime = .3;
		action = "Transform";
		currentMonster = form;
	}
}

// Returns whether we can move into a spot, and kills us if we walk into a pit. 
attempt_move = function(moveX, moveY) {
	if place_meeting(moveX, moveY, obj_gap) && action != "Vampire Dash" {
		death();
	}
	return !place_meeting(moveX, moveY, obj_terrain) 
		&& (hasKey || !place_meeting(moveX, moveY, obj_door)
		&& !place_meeting(moveX, moveY, obj_garlic_clove));
}

// This function is called in Draw. 
animate = function(animation) {
	draw_sprite_ext(
			animation,
			floor(animationFrame % sprite_get_number(animation)),
			x,
			y,
			facingDir * 1.5,
			1.5,
			0,
			make_color_rgb(255,255,255),
			1
		);
}