/// @description Draw and piece together player's various sprites.
// You can write your code in this editor
var _move = 0;
if (can_move()) {
	_move = key_right - key_left;
}

// right
if (_move > 0) {
	facing_direction = 1;	
// left
} else if (_move < 0) {
	facing_direction = -1;	
}

var _frame = ++img_frame/10 % num_of_frames;

var _mode = 0;
if (is_sitting) {
	_mode = 1;	
} else if (_move != 0) {
	_mode = 2;	
}

// draw character
// legs first
draw_sprite_ext(leg_sprites[_mode], _frame, x, y, facing_direction, 1, 0, c_white, 1);
// torso
draw_sprite_ext(top_sprites[_mode], _frame, x, y, facing_direction, 1, 0, c_white, 1);
// head
draw_sprite_ext(head_sprites[_mode], _frame, x, y, facing_direction, 1, 0, c_white, 1);
// bottoms
draw_sprite_ext(bottom_sprites[_mode], _frame, x, y, facing_direction, 1, 0, c_white, 1);

