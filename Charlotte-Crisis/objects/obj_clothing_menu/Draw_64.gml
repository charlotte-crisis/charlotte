/// @description Draw the Menu
// You can write your code in this editor

draw_set_valign(fa_middle); // Set text align middle
draw_set_halign(fa_center); // Center align everything

// Draw the sprite here
var _xx = (view_wport[0] / 2); // draw in the middle of the screen
var _yy = 96 + (view_hport[0] / 8); // Split options into 1/8 of the screen
var _menu_y = 120;

// Draw background rectangle
// The 128 is offset of sprite height
var _rect_width = 160;
var _rect_height = 320;
// draw_rectangle_center(_xx, _yy + 128, _rect_width, _rect_height, false, c_ltgray, 1);
draw_sprite_ext(spr_ui_clothes_bg, 0, _xx, _menu_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);

var _name_y = _menu_y + 40;
// draw Name
draw_set_color(c_black);
draw_set_font(fnt_body_small);
draw_text(_xx, _name_y, "Name:");
draw_text(_xx, _name_y+16, (current_gender)?"Charlotte":"Charles");
draw_set_color(c_white);
draw_set_font(fnt_body);

var _confirm_x = _xx - 56
var _confirm_y = _menu_y + 350;
draw_sprite_ext(spr_confirm_button, (select_row == 4), _confirm_x, _confirm_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);

var _arrow_left_x = _xx - 30*3.75;
var _arrow_right_x = _xx + 25*3.75;
var _arrow_y_start = _name_y - 2;
var _arrow_y_margin = 80;
if (select_row < 4) {
	draw_sprite_ext(spr_ui_left, 0, _arrow_left_x, _arrow_y_start + _arrow_y_margin*select_row, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	draw_sprite_ext(spr_ui_right, 0, _arrow_right_x, _arrow_y_start + _arrow_y_margin*select_row, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
}

var _sprite_scale = 4;

for (var i = 0; i < array_length(current_clothes); i++) {
	draw_sprite_ext(clothing_top[current_gender][current_clothes[0]],	  (select_row == 1), _xx, _yy, _sprite_scale, _sprite_scale, 0, c_white, 1);
	draw_sprite_ext(clothing_shoes[current_gender][current_clothes[2]],   (select_row == 3), _xx, _yy, _sprite_scale, _sprite_scale, 0, c_white, 1);
	// Draw pants over shoes too
	draw_sprite_ext(clothing_bottoms[current_gender][current_clothes[1]], (select_row == 2), _xx, _yy, _sprite_scale, _sprite_scale, 0, c_white, 1);
}
//draw_text(_xx, _yy + 320, "Confirm");

var _description = "Use arrow keys to change clothes. Your presentation affects how others see you.";
var _name_desc = "Change your presentation. This will affect your name and clothes you can wear."
var _confirm_desc = "Press space to confirm.";
if (select_row == 0) {
	draw_dialogue(_name_desc);
} else if (select_row == 4) {
	draw_dialogue(_confirm_desc);	
} else {
	draw_dialogue(_description);
}













