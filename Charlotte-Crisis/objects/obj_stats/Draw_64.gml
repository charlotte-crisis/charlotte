/// @description Draw Stats on Screen

var _viewport_width = view_wport[0];
var _viewport_height = view_hport[0];

// Variables to set icon location
var _x_margin = 150;
var _y_margin = 32;
var _y_starting_margin = 16;

// Variables to assist in positioning the text just right.
var _x_text_margin = 32;
var _y_text_margin = 5;

draw_set_font(fnt_body);	// TODO: Can change to UI font
draw_set_valign(fa_top);	// Align text to top left (x,y) (Same as sprites)
draw_set_halign(fa_left);	// Left-align text

// Draw the three stats
draw_sprite(spr_ui_int, image_index, _viewport_width - _x_margin, _y_starting_margin);
draw_text(_viewport_width - _x_margin + _x_text_margin,
		_y_starting_margin + _y_text_margin, 
		string("INT: {0}", intelligence));
		
draw_sprite(spr_ui_cha, image_index, _viewport_width - _x_margin, _y_starting_margin + _y_margin);
draw_text(_viewport_width - _x_margin + _x_text_margin,
		_y_starting_margin + _y_margin + _y_text_margin, 
		string("CHA: {0}", charisma));
		
draw_sprite(spr_ui_emp, image_index, _viewport_width - _x_margin, _y_starting_margin + _y_margin*2);
draw_text(_viewport_width - _x_margin + _x_text_margin,
		_y_starting_margin + _y_margin*2 + _y_text_margin, 
		string("EMP: {0}", empathy));





