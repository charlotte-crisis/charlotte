/// @description Draw Stat Menu
// You can write your code in this editor

draw_set_valign(fa_middle); // Set text align middle
draw_set_halign(fa_center);
draw_set_font(fnt_mono);

var _yy = (view_hport[0] / 8); // Split options into 1/8 of the screen
var _xx = (view_wport[0] / 2); // draw in the middle of the screen

var _rect_width = 300;
var _rect_height = 65;

draw_text(_xx, view_hport[0] - _yy, string("Points allocateable: {0}", levels));

if (current_option < 3) {
	draw_rectangle_center(_xx, _yy + _yy * current_option, _rect_width, _rect_height, false, c_blue, 1);
	if (stats_array[current_option] <= 0) {
		draw_text(_xx, _yy + _yy * current_option, "                          -->");	
	} else if ((levels <= 0) || (stats_array[current_option] >= 9)) {
		draw_text(_xx, _yy + _yy * current_option, "<--                          ");	
	} else {
		draw_text(_xx, _yy + _yy * current_option, "<--                       -->");	
	}
} else {
	draw_rectangle_center(_xx, _yy + _yy * current_option, _rect_width, _rect_height, false, c_green, 1);
}

draw_text(_xx, _yy, string("Intelligence: {0}", stats_array[0]));
draw_text(_xx, _yy*2, string("Charisma: {0}", stats_array[1]));
draw_text(_xx, _yy*3, string("Empathy: {0}", stats_array[2]));

draw_rectangle_center(_xx, _yy*4, _rect_width, _rect_height, true, c_white, 1);	
draw_text(_xx, _yy*4, "Confirm Allocation");




