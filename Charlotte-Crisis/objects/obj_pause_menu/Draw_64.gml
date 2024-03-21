/// @description Draw menu
// You can write your code in this editor
var _x_origin = view_wport[0]/2;
var _y_origin = 32;

var _x_row_starting = _x_origin - 72 + 12;
var _y_row_starting = _y_origin + 11;

var _x_colsize = 42;
var _y_rowsize = 42;
var _emote_offset = 14;

if (relationships_menu_open) {
	// Draw background
	draw_sprite(spr_relationship_menu_bg, -1, _x_origin, _y_origin);
	
	// Draw the characters
	for (var row = 0; row < 2; row++) {
		for (var col = 0; col < 3; col++) {
			var curr_x = _x_row_starting + (col * _x_colsize);
			var curr_y = _y_row_starting + (row * _y_rowsize);
			draw_sprite(spr_portrait_bg, 0, curr_x, curr_y);
			draw_sprite(spr_relationship_level, 0, curr_x + _emote_offset, curr_y + _emote_offset/2);
		}
	}
}