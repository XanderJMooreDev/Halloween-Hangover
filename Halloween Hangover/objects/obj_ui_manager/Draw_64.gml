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

if instance_exists(obj_mothman_boss) {
	bossHealth = floor(obj_mothman_boss.hp / 40 * 5);
}
else if instance_exists(obj_vampire_boss) {
	bossHealth = floor(obj_vampire_boss.hp / 6 * 5);
}
else if instance_exists(obj_wolf_boss) {
	bossHealth = floor(obj_wolf_boss.hp / 8 * 5);
}
else {
	bossHealth = 0;
}

if bossHealth != 0 {
	draw_sprite_ext(
		spr_boss_bar,
		bossHealth,
		1120,
		-64,
		3.5,
		3.5,
		0,
		c_white,
		1
	);
}