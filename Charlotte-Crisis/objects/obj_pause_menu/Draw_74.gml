/// @description Overlay over everything else
/// To indicate pause

if (is_open) {
	draw_set_alpha(0.5); //Set rect to half transparent
	draw_set_color(c_black);
	draw_rectangle(0, 0, view_wport[0], view_hport[0], false)
	draw_set_alpha(1);
	draw_set_color(c_white);
}
	
