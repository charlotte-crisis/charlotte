/// @description Insert description here
// You can write your code in this editor

// If showing clothes, draw the clothing menu
var _alpha = 1;
var _row = 0;
if (clothes_selection) {
	//let's try a scuffed loop for now
	for (var _i = 0; _i < array_length(tops); _i++) {
		if (select_row == 0) {
			_alpha = 1;
		} else {
			_alpha = 0.5;	
		}
		draw_sprite_ext(spr_selection_button_2, -1, 0 + _i*64, _row*64, 1.5, 1.5, 0, c_white, _alpha);
		draw_sprite_ext(tops[_i], -1, 0 + _i*64, _row*64, 1, 1, 0, c_white, _alpha);
	}
	_row += 1;
	
	for (var _i = 0; _i < array_length(bottoms); _i++) {
		if (select_row == 1) {
			_alpha = 1;
		} else {
			_alpha = 0.5;	
		}
		draw_sprite_ext(spr_selection_button_2, -1, 0 + _i*64, _row*64, 1.5, 1.5, 0, c_white, _alpha);
		draw_sprite_ext(bottoms[_i], -1, 0 + _i*64, _row*64, 1.5, 1.5, 0, c_white, _alpha);
	}
	
	_row += 1;
	
	for (var _i = 0; _i < array_length(shoes); _i++) {
		if (select_row == 2) {
			_alpha = 1;
		} else {
			_alpha = 0.5;	
		}
		draw_sprite_ext(spr_selection_button_2, -1, 0 + _i*64, _row*64, 1.5, 1.5, 0, c_white, _alpha);
		draw_sprite_ext(shoes[_i], -1, 0 + _i*64, _row*64, 1.5, 1.5, 0, c_white, _alpha);
	}
}








