if state == "Idle" {
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
else if state == "Vampire Dash" {
		animate(spr_dash_vampire);
}