/// @description Draw the gui itself
// You can write your code in this editor
#macro PORTRAIT_SCALE 2

draw_set_font(fnt_body);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _x_origin = view_wport[0]/2 + 128; // Draw it a little to the right
var _y_origin = 120; // 32 * 3.75

draw_sprite_ext(spr_relationship_menu_bg, -1, _x_origin, _y_origin, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);

