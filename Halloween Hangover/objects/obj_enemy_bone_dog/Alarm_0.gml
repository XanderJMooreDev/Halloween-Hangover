if stunType == "None" {
	bone = instance_create_layer(x, y, "Instances", obj_bone);
	bone.angleX = (obj_player.x - x) / 30;
	bone.angleY = (obj_player.y - y) / 30;
}

alarm[0] = 300;