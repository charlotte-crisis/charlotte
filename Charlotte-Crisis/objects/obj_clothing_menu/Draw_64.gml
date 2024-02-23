/// @description Draw the Menu
// You can write your code in this editor

draw_set_valign(fa_middle); // Set text align middle
draw_set_halign(fa_center); // Center align everything

// Draw the sprite here
var _xx = (view_wport[0] / 2); // draw in the middle of the screen
var _yy = 96 + (view_hport[0] / 8); // Split options into 1/8 of the screen

// Draw background rectangle
// The 128 is offset of sprite height
var _rect_width = 160;
var _rect_height = 320;
draw_rectangle_center(_xx, _yy + 128, _rect_width, _rect_height, false, c_white, 1);

draw_rectangle_center(_xx, _yy + 320, _rect_width, _rect_height/6, false, c_black, 1);	
draw_text(_xx, _yy + 320, "Confirm");

if (select_row < 3) {
	draw_set_color(c_black);
	draw_text(_xx, _yy + 64 + 85*select_row, "<                                 >");
	draw_set_color(c_white);
} else {
	draw_rectangle_center(_xx, _yy + 320, _rect_width, _rect_height/6, false, c_green, 1);	
}

var _sprite_scale = 4;

for (var i = 0; i < array_length(current_clothes); i++) {
	draw_sprite_ext(clothing_top[current_clothes[0]],	  -1, _xx, _yy, _sprite_scale, _sprite_scale, 0, c_white, 1);
	draw_sprite_ext(clothing_bottoms[current_clothes[1]], -1, _xx, _yy, _sprite_scale, _sprite_scale, 0, c_white, 1);
	draw_sprite_ext(clothing_shoes[current_clothes[2]],   -1, _xx, _yy, _sprite_scale, _sprite_scale, 0, c_white, 1);
}
draw_text(_xx, _yy + 320, "Confirm");

var _description = "Use arrow keys to change your clothes. Clothes will affect how others see you and your stats.";

draw_text_box(_description);













