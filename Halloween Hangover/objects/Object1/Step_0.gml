var pressed_up = keyboard_check(vk_up);
var pressed_left = keyboard_check(vk_left);
var pressed_right = keyboard_check(vk_right);
var pressed_down = keyboard_check(vk_down);

state = "Idle";

joystickX = 0;
joystickY = 0;

if(pressed_up)
{
	joystickY -= 1;
}
if(pressed_left)
{
	joystickX -= 1;
}
if(pressed_right)
{
	joystickX += 1;
}
if(pressed_down)
{
	joystickY += 1;
}
if keyboard_check(vk_space) {
	start_monster_abilities();
}

if joystickX != 0 {
	facingDir = joystickX;
}

apply_monster_joystick();

if attempt_move(x + 5 * joystickX, y) {
	x += 5 * joystickX;
}

if attempt_move(x, y + 5 * joystickY) {
	y += 5 * joystickY;
}

show_debug_message(state);
if y >= 750{
	y = 750
}
else if y<=0{
	y = 40;
}
if x>= 1310{
	x = 1310;
}
else if x <= 0{
	x = 40;
}