// Updates the animationFrame every frame and updates the sprite's image accordingly using math. 
animationFrame += 4 / game_get_speed(gamespeed_fps);
image_index = floor(animationFrame % 2);