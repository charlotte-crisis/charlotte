/// @description Movement and Gravity
// You can write your code in this editor



key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

var _move = key_right - key_left;
horizontal_speed = _move * walk_speed;
vertical_speed += grav;

if (place_meeting(x, y + 1, obj_wall)) && (key_jump) {
	vertical_speed = -jump_speed;
}

// Horizontal collision and movement
if (place_meeting(x + horizontal_speed, y, obj_wall)) {
	while (!place_meeting(x + sign(horizontal_speed), y, obj_wall)) {
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}
x += horizontal_speed;

// Vertical collision and movement
if (place_meeting(x, y + vertical_speed, obj_wall)) {
	while (!place_meeting(x, y + sign(vertical_speed), obj_wall)) {
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
}
y += vertical_speed;