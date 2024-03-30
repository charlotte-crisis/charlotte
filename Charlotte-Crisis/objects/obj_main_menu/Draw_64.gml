/// @description Draw Menu
// You can write your code in this editor

var _x = view_wport[0]/2;		// Middle
var _y_start = view_hport[0]/2 + 32; // Middle
var _y_margin = view_hport[0]/16;

var _y;

#region Menu Buttons
draw_set_font(fnt_body);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < MAX_ROW; i++) {
	if (select_row == i) {
		draw_set_color(c_white);	
	} else {
		draw_set_color(c_gray);	
	}
	
	_y = _y_start + (i * _y_margin);
	var _width_of_text = string_width(BUTTON_LABELS[i]);
	draw_text(_x, _y, BUTTON_LABELS[i]);
	if (select_row == i) {
		draw_sprite_ext(spr_ui_right, 0, _x - _width_of_text/2 - 25, _y - 15, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	}
	draw_set_color(c_white);
}
#endregion

/// Overlay AFTER the menu buttons
if (showing_credits || showing_help) {
	draw_set_alpha(0.5); //Set rect to half transparent
	draw_set_color(c_black);
	draw_rectangle(0, 0, view_wport[0], view_hport[0], false)
	draw_set_alpha(1);
	draw_set_color(c_white);
}

#region Bottom Right instructions
/// Bottom Right graphics as Instructions
draw_set_halign(fa_left);
var _instructions_x = view_wport[0] - 160;
var _instructions_y = view_hport[0];

draw_sprite_ext(spr_key_space_strip4, _pressed_spacebar,
		_instructions_x, _instructions_y, 2, 2, 0, c_white, 1);

if (showing_help || showing_credits) {
	draw_text(_instructions_x + 64 - 5, _instructions_y - 32, "BACK");
} else {
	draw_text(_instructions_x + 64 - 5, _instructions_y - 32, "CONFIRM");
}

// Keys
if !(showing_help || showing_credits) {
	_instructions_x -= 160;
	draw_sprite_ext(spr_key_up_strip4, 0,
			_instructions_x, _instructions_y - 26, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spr_key_up_strip4, 0,
			_instructions_x, _instructions_y, 2, 2, 0, c_white, 1);
	draw_text(_instructions_x + 32 - 5, _instructions_y - 32, "SELECT");
}
#endregion