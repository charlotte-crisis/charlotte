/// @description Draw Stats on Screen
var _viewport_width = view_wport[0];
var _viewport_height = view_hport[0];

// A little housekeeping
draw_set_color(c_white);
draw_set_font(fnt_mono);	// TODO: Can change to UI font
draw_set_valign(fa_top);	// Align text to top left (x,y) (Same as sprites)
draw_set_halign(fa_left);	// Left-align text

// Variables to set icon location
var _x_margin = 150;
var _y_margin = 32;
var _y_padding = 16; // All UI starts with this padding

// Variables to assist in positioning the text just right.
var _x_text_margin = 32;
var _y_text_margin = 5;

#region Draw the three stats
/// Draw the three stats
draw_sprite(spr_ui_int, image_index, _viewport_width - _x_margin, _y_padding);
draw_text(_viewport_width - _x_margin + _x_text_margin,
		_y_padding + _y_text_margin, 
		string("INT: {0}", intelligence));
		
draw_sprite(spr_ui_cha, image_index, _viewport_width - _x_margin, _y_padding + _y_margin);
draw_text(_viewport_width - _x_margin + _x_text_margin,
		_y_padding + _y_margin + _y_text_margin, 
		string("CHA: {0}", charisma));
		
draw_sprite(spr_ui_emp, image_index, _viewport_width - _x_margin, _y_padding + _y_margin*2);
draw_text(_viewport_width - _x_margin + _x_text_margin,
		_y_padding + _y_margin*2 + _y_text_margin, 
		string("EMP: {0}", empathy));
#endregion

#region Confidence Bar
var _bar_length = 180;
var _bar_height = 16;
var _rect_offset = 32;

draw_set_color(c_white);
draw_text(_x_text_margin, _y_padding, string("CONFIDENCE: {0}/100", confidence));

// Outline rectangle
draw_rectangle(_x_text_margin,
			   _y_padding + _rect_offset,
			   _x_text_margin + _bar_length,
			   _y_padding + _rect_offset + _bar_height,
			   true) // true as white outline

var _rectangle_color = c_green;
if (confidence < 30) {
	_rectangle_color = c_red;	
} else if (confidence < 70) {
	_rectangle_color = c_yellow;	
}

draw_set_color(_rectangle_color);

var _fill_length = confidence/100 * _bar_length;
// Fill rectangle
draw_rectangle(_x_text_margin,
			   _y_padding + _rect_offset,
			   _x_text_margin + _fill_length, 
			   _y_padding + _rect_offset + _bar_height,
			   false);

// Set it back to white just in case.
draw_set_color(c_white);
#endregion