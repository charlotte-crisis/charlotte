/// @description Draw and piece together player's various sprites.
// You can write your code in this editor
var _move = 0;
if (can_move()) {
	_move = key_right - key_left;
}

// right
if (_move > 0) {
	facing_direction = -1;	
// left
} else if (_move < 0) {
	facing_direction = 1;	
}

var _frame = ++img_frame/10 % num_of_frames;

if (is_sitting) {
	draw_sprite_ext(sitting_legs[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(sitting_torso[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(sitting_shorts[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(sitting_head[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
} else if (_move != 0) {
	draw_sprite_ext(walking_legs[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(walking_torso[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(walking_shorts[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(walking_head[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);	
} else {
	draw_sprite_ext(idle_legs[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(idle_torso[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(idle_shorts[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
	draw_sprite_ext(idle_head[gender], _frame, x, y, facing_direction, 1, 0, c_white, 1);
}