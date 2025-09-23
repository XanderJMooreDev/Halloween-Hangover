n = random(4);

if n == 1 {
	instance_create_layer(384, 64, "Instances", obj_zombie_horde_indicator);
}
else if n == 2 {
	instance_create_layer(1184, 64, "Instances", obj_zombie_horde_indicator);
}
else if n == 3 {
	instance_create_layer(1248, 512, "Instances", obj_zombie_horde_indicator);
}
else {
	instance_create_layer(416, 544, "Instances", obj_zombie_horde_indicator);
}