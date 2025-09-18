has_ability = [true, true, true, true];

hasKey = false;

state = "Idle";

joystickX = 0;
joystickY = 0;
facingDir = 1;

image_xscale = 1.5;
image_yscale = 1.5;

currentMonster = "Vampire";
actionJoystickX = 0;
actionJoystickY = 0;
action = "None";
actionTime = 0;
pushingTime = 0;
animationFrame = 0;

monster_list = ["Human", "Vampire", "Wolf", "Zombie"];

idle_poses = [spr_idle_human, spr_idle_vampire, spr_idle_wolf, spr_idle_zombie];
walk_poses = [spr_walk_human, spr_walk_vampire, spr_walk_wolf, spr_walk_zombie];
transform_poses = [spr_transform_human, spr_transform_vampire, spr_transform_wolf, spr_transform_zombie];

start_monster_abilities = function() {
	if actionTime > -.3 {
		return;
	}
	
	if currentMonster == "Vampire" {
		actionJoystickX = joystickX * 3;
		actionJoystickY = joystickY * 3;
		
		effect_create_layer("Instances", ef_smoke, x, y, 10, c_white);
		
		action = "Vampire Dash";
		actionTime = .35;
	}
	else if currentMonster == "Wolf" {
		actionJoystickX = joystickX * .5;
		actionJoystickY = joystickY * .5;
		
		instance_create_layer(x, y, "Instances", obj_wolf_scratch);
		
		action = "Wolf Slash";
		actionTime = .35;
	}
	else if currentMonster == "Zombie" {
		actionJoystickX = 0;
		actionJoystickY = 0;
		
		instance_create_layer(x, y, "Instances", obj_shield);
		
		state = "Zombie Shield";
		actionTime = .7;
	}
}

apply_monster_joystick = function() {
	if actionTime > -.3 {
		actionTime -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if pushingTime > 0 {
		action = "Zombie Push";
		pushingTime -= 1 / game_get_speed(gamespeed_fps);
	}
	
	animationFrame += 4 / game_get_speed(gamespeed_fps);
	
	if actionTime > 0 {
		if state == "Zombie Shield" {
			joystickX = 0;
			joystickY = 0;
		}
		
		if action == "Vampire Dash" || action == "Wolf Slash" {
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
	if actionTime > 0 || form == currentMonster || !has_ability[array_get_index(monster_list, form)] {
		return;
	}
	else {
		actionTime = .3;
		action = "Transform";
		currentMonster = form;
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
			facingDir * 1.5,
			1.5,
			0,
			make_color_rgb(255,255,255),
			1
		);
}