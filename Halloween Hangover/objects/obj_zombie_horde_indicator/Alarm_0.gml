blinks++;

visible = !visible;	

if blinks == 8 {
	instance_create_layer(random_range(x - 64, x + 64), random_range(y - 64, y + 64), "Instances", obj_enemy_default);
	instance_create_layer(random_range(x - 64, x + 64), random_range(y - 64, y + 64), "Instances", obj_enemy_default);
	instance_create_layer(random_range(x - 64, x + 64), random_range(y - 64, y + 64), "Instances", obj_enemy_default);
	instance_create_layer(random_range(x - 64, x + 64), random_range(y - 64, y + 64), "Instances", obj_enemy_default);
	instance_create_layer(random_range(x - 64, x + 64), random_range(y - 64, y + 64), "Instances", obj_enemy_default);
	instance_destroy();
}
else {
	alarm[0] = 20;
}