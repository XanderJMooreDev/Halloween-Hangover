instance_destroy(other);
effect_create_layer("Instances", ef_smoke, x + 32, y, 20, c_red);

hp--;
moving = false;
sprite_index = spr_vampire_boss_stun;

alarm[0] = 150;