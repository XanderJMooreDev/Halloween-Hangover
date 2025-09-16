var pressed_up = keyboard_check(vk_up);
var pressed_left = keyboard_check(vk_left);
var pressed_right = keyboard_check(vk_right);
var pressed_down = keyboard_check(vk_down);

joystickX = 0;
joystickY = 0;

if(pressed_up)
{
	joystickY -= 1;
	sprite_index = Obj_PlayerspriteBack;
}
if(pressed_left)
{
	joystickX -= 1;
    sprite_index = Obj_PlayerspriteLeft; 
}
if(pressed_right)
{
	joystickX += 1;
	sprite_index = Obj_PlayerspriteRight;
}
if(pressed_down)
{
	joystickY += 1;
	sprite_index = Obj_Playersprite;
}
if keyboard_check(vk_space) {
	start_monster_abilities();
}

apply_monster_joystick();

if attempt_move(x + 5 * joystickX, y + 5 * joystickY) {
	x += 5 * joystickX;
	y += 5 * joystickY;
}
