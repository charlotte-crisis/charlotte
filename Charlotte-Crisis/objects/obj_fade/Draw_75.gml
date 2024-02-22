/// @description Insert description here
// You can write your code in this editor

var gui_width = view_wport[0];
var gui_height = view_hport[0];

// Draw fade
draw_set_alpha(alpha);
draw_set_color(FADE_COLOUR);

draw_rectangle(0, 0, gui_width, gui_height, false);

// Reset it to normal
draw_set_alpha(1);
draw_set_color(c_white);










