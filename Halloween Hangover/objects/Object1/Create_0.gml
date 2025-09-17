hasVampire = false;
hasWerewolf = false;
hasZombie = false;
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

start_monster_abilities = function() {
	if actionTime > -1 {
		return;
	}
	
	if currentMonster == "Vampire" {
		actionJoystickX = joystickX * 3;
		actionJoystickY = joystickY * 3;
		
		effect_create_layer("Instances_1", ef_smoke, x, y, 10, c_white);
		
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
	
	animationFrame += 4 / game_get_speed(gamespeed_fps);
	
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
			facingDir * 1.5,
			1.5,
			0,
			make_color_rgb(255,255,255),
			1
		);
}