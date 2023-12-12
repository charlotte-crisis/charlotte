/// @description Draw and piece together player's various sprites.
// You can write your code in this editor

var _move = key_right - key_left;
	
// right
if (_move > 0) {
	facing_direction = -1;	
// left
} else if (_move < 0) {
	facing_direction = 1;	
}

var _frame = ++img_frame/10 % 8

if (_move != 0) {
	draw_sprite_ext(spr_mc_male_walking_legs, _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(spr_mc_male_walking_torso, _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(spr_mc_male_walking_shorts, _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(spr_mc_male_walking_head, _frame, x, y, facing_direction, 1, 0, c_white, 1);	
} else {
	draw_sprite_ext(spr_mc_male_idle_legs, -1, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(spr_mc_male_idle_torso, -1, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(spr_mc_male_idle_shorts, -1, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(spr_mc_male_idle_head, -1, x, y, facing_direction, 1, 0, c_white, 1);
}