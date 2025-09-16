if state == "Idle" {
	if joystickX != 0 || joystickY != 0 {
		animate(spr_walk_human);
	}
	else {
		animate(spr_idle_human);
	}
}
else if state == "Zombie Push" {
		animate(spr_push_zombie);
}