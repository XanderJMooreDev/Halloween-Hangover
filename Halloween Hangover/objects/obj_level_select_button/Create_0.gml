hovering = false;
	sprite_index = spr_level_select_button;

if x == 192 {
	image_index = 0;
	room_assigned = room_vampire_unlock;
}
else if x == 608 {
	image_index = 1;
	room_assigned = room_wolf_unlock;
}
else {
	image_index = 2;
	room_assigned = room_zombie_unlock;
}