var pressed_up = keyboard_check(vk_up);
var pressed_left = keyboard_check(vk_left);
var pressed_right = keyboard_check(vk_right);
var pressed_down = keyboard_check(vk_down);

// Updates us after we shield. 
if state != "Zombie Shield" || actionTime <= 0 {
	state = "Idle";
}

joystickX = 0;
joystickY = 0;

// Debug buttons, let us switch to given rooms. 
if keyboard_check(vk_backspace) {
	room_goto(Level1);
}

if keyboard_check(vk_enter) {
	room_goto(room_combat_test);
}

// Generic controls. 
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
if keyboard_check(ord("W")) {
	transform("Human");
}
if keyboard_check(ord("A")) {
	transform("Vampire");
}
if keyboard_check(ord("S")) {
	transform("Wolf");
}
if keyboard_check(ord("D")) {
	transform("Zombie");
}

// Updates which direction the character should be facing if we're moving left or right.
if joystickX != 0 {
	facingDir = joystickX;
}

apply_monster_joystick();

// Makes moves if they're valid. 
if attempt_move(x + 5 * joystickX, y) {
	x += 5 * joystickX;
}

if attempt_move(x, y + 5 * joystickY) {
	y += 5 * joystickY;
}

// For debugging. 
show_debug_message(state);

