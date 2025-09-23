blinks++;

visible = !visible;	

if blinks == 8 {
	instance_create_layer(random_range(416, 544), random_range(32, 160), "Instances", obj_enemy_default);
	instance_create_layer(random_range(416, 544), random_range(32, 160), "Instances", obj_enemy_default);
	instance_create_layer(random_range(416, 544), random_range(32, 160), "Instances", obj_enemy_default);
	instance_create_layer(random_range(416, 544), random_range(32, 160), "Instances", obj_enemy_default);
	instance_create_layer(random_range(416, 544), random_range(32, 160), "Instances", obj_enemy_default);
	instance_destroy();
}
else {
	alarm[0] = 20;
}