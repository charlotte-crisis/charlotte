/// @description Draw Menu
// You can write your code in this editor

draw_set_font(fnt_body);
draw_set_halign(fa_center); // Text center-aligned
draw_set_color(c_white);

var _margin_text = view_wport[0] * 0.1;
var _xx = view_wport[0] / 2; //middle of the screen
var _margin_char = 200;
var _linesep = 25;
var _yy = view_hport[0] - (_margin_text / 2);
var _text_yy = view_hport[0] - (_margin_text) - 16;

draw_rectangle_center(view_wport[0] / 2, _yy, view_wport[0], _margin_text * 2, false, c_dkgray, 1);

var speech = "Rise and shine. Time to go to class. (Left and Right arrow keys to move)"
draw_text_ext(_xx, _text_yy, speech, _linesep, view_wport[0] - 2 * _margin_text);	