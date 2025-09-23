draw_sprite_ext(
	spr_wasd_indicator,
	0,
	32,
	480,
	2,
	2,
	0,
	c_white,
	.75
);

if obj_player.has_ability[0] {
	draw_sprite_ext(
		spr_idle_human,
		0,
		128,
		608,
		1,
		1,
		0,
		c_white,
		.75
	);
}

if obj_player.has_ability[1] {
	draw_sprite_ext(
		spr_dash_vampire,
		0,
		64,
		688,
		1,
		1,
		0,
		c_white,
		.75
	);
}

if obj_player.has_ability[2] {
	draw_sprite_ext(
		spr_scratch_wolf,
		0,
		128,
		672,
		1,
		1,
		0,
		c_white,
		.75
	);
}

if obj_player.has_ability[3] {
	draw_sprite_ext(
		spr_push_zombie,
		0,
		192,
		672,
		1,
		1,
		0,
		c_white,
		.75
	);
}

if !instance_exists(obj_player) {
	return;
}

if obj_player.hp >= 1 {
	draw_sprite_ext(
		spr_heart,
		0,
		0,
		0,
		3,
		3,
		0,
		c_white,
		1
	);
}

if obj_player.hp >= 2 {
	draw_sprite_ext(
		spr_heart,
		0,
		64,
		0,
		3,
		3,
		0,
		c_white,
		1
	);
}

if obj_player.hp >= 3 {
	draw_sprite_ext(
		spr_heart,
		0,
		128,
		0,
		3,
		3,
		0,
		c_white,
		1
	);
}