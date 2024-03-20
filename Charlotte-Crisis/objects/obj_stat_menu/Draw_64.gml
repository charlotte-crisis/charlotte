/// <-- Everything below this is old -->
//draw_set_valign(fa_middle); // Set text align middle
//draw_set_halign(fa_center);
//draw_set_font(fnt_mono);

//var _yy = (view_hport[0] / 8); // Split options into 1/8 of the screen
//var _xx = (view_wport[0] / 2); // draw in the middle of the screen
//var _y_offset = 96;

//var _rect_width = 300;
//var _rect_height = 65;

//for (var _i = 1; _i <= 4; _i++) {
//	draw_rectangle_center(_xx, _y_offset + _yy * _i, _rect_width, _rect_height, false, c_black, 1);	
//}


//if (current_option < 3) {
//	draw_rectangle_center(_xx, _y_offset + _yy * (current_option + 1), _rect_width, _rect_height, false, c_blue, 1);
//	if (stats_array[current_option] <= 0) {
//		draw_text(_xx, _y_offset + _yy * (current_option + 1), "                          -->");	
//	} else if ((levels <= 0) || (stats_array[current_option] >= 9)) {
//		draw_text(_xx, _y_offset + _yy * (current_option + 1), "<--                          ");	
//	} else {
//		draw_text(_xx, _y_offset + _yy * (current_option + 1), "<--                       -->");	
//	}
//} else {
//	draw_rectangle_center(_xx, _y_offset + _yy * (current_option + 1), _rect_width, _rect_height, false, c_green, 1);
//}

//draw_text(_xx, _y_offset + _yy, string("Intelligence: {0}", stats_array[0]));
//draw_text(_xx, _y_offset + _yy*2, string("Charisma: {0}", stats_array[1]));
//draw_text(_xx, _y_offset + _yy*3, string("Empathy: {0}", stats_array[2]));

//draw_rectangle_center(_xx, _y_offset + _yy*4, _rect_width, _rect_height, true, c_white, 1);	
//draw_text(_xx, _y_offset + _yy*4, "Confirm Allocation");

//draw_text(_xx, _yy-16, string("Points available: {0}", levels));