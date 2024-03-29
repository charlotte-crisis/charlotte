/// @description Draw Menu
// You can write your code in this editor

var _x = view_wport[0]/2;		// Middle
var _y_start = view_hport[0]/2; // Middle
var _y_margin = view_hport[0]/10;

var _y;

draw_set_font(fnt_body);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < MAX_ROW; i++) {
	var _spr = (i == 0) ? spr_option_red : spr_option_blue;
	_y = _y_start + (_y_margin * i);
	draw_sprite_ext(_spr, (select_row == i),
			_x, _y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	draw_text(_x, _y, BUTTON_LABELS[i]);
}

/// Bottom Right graphics as Instructions
draw_set_halign(fa_left);
var _instructions_x = view_wport[0] - 160;
var _instructions_y = view_hport[0];
draw_sprite_ext(spr_key_space_strip4, 0,
		_instructions_x, _instructions_y, 2, 2, 0, c_white, 1);
		
draw_text(_instructions_x + 64 - 5, _instructions_y - 32, "CONFIRM");

_instructions_x -= 160;
draw_sprite_ext(spr_key_up_strip4, 0,
		_instructions_x, _instructions_y - 26, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_key_up_strip4, 0,
		_instructions_x, _instructions_y, 2, 2, 0, c_white, 1);
draw_text(_instructions_x + 32 - 5, _instructions_y - 32, "SELECT");
