var pressed_up = keyboard_check(vk_up);
var pressed_left = keyboard_check(vk_left);
var pressed_right = keyboard_check(vk_right);
var pressed_down = keyboard_check(vk_down);

if(pressed_up)
{
	y=y-5
}
if(pressed_left)
{
	x=x-5
}
if(pressed_right)
{
	x=x+5
}
if(pressed_down)
{
	y=y+5
}
if(pressed_right)
{
	sprite_index = Obj_PlayerspriteRight;
}
if(pressed_left)
{
    sprite_index = Obj_PlayerspriteLeft; 
}
if(pressed_down)
{
	sprite_index = Obj_Playersprite;
}
if(pressed_up)
{
	sprite_index = Obj_PlayerspriteBack;
}