if action == "Transform" {
		animate(transform_poses[array_get_index(monster_list, currentMonster)]);
}
else if state == "Idle" {
	if joystickX != 0 || joystickY != 0 {
		animate(walk_poses[array_get_index(monster_list, currentMonster)]);
	}
	else {
		animate(idle_poses[array_get_index(monster_list, currentMonster)]);
	}
}
else if state == "Zombie Push" {
		animate(spr_push_zombie);
}
else if state == "Zombie Shield" {
		animate(spr_shield_zombie);
}
else if state == "Vampire Dash" {
		animate(spr_dash_vampire);
}
else if state == "Wolf Slash" {
	if actionTime > .15 {
		animate(spr_pre_scratch_wolf);
	}
	else {
		animate(spr_scratch_wolf);
	}
}