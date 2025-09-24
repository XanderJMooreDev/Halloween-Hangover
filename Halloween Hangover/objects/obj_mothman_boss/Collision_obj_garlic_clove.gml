hp -= 10;
stunType = "Confused";
stunTimer = 3;

instance_destroy(other);

audio_play_sound(sfx_enemy_hurt, 1, false);

sprite_index = spr_mothman_boss_burning;