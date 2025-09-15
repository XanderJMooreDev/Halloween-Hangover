var pressed_up = keyboard_check(vk_up);
var pressed_left = keyboard_check(vk_left);
var pressed_right = keyboard_check(vk_right);
var pressed_down = keyboard_check(vk_down);

if(pressed_up)
{
	y=y-1
}
if(pressed_left)
{
	x=x-1
}
if(pressed_right)
{
	x=x+1
}
if(pressed_down)
{
	y=y+1
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

//move camera
#region

halfViewWidth = camera_get_view_width(view_camera[0])/2;
halfViewHeight = camera_get_view_height(view_camera[0])/2;
camera_set_view_pos(view_camera[0], x - halfViewWidth, y - halfViewHeight);

#endregion
if (y >= 600){
	y = 600;
}
else if (y <= 0){
	y = 0;
}

if (x >= 600){
	x = 600;
}
else if (x <= 0){
	x = 0;
}