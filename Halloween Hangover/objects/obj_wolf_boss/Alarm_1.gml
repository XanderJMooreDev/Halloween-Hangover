sprite_index = spr_wolf_boss_pre_scratch;

originX = x;
originY = y;

angleX = .7 * (obj_player.x - x);
angleY = .7 * (obj_player.y - y);

moving = true;
alarm[0] = 60;