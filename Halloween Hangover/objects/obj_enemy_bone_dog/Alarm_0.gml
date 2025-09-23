if stunType == "None" {
	bone = instance_create_layer(x, y, "Instances", obj_bone);
	bone.angleX = (obj_player.x - x) / 20;
	bone.angleY = (obj_player.y - y) / 20;
}

alarm[0] = 300;