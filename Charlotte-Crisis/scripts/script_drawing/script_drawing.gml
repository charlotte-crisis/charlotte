/// @description Scripts relating to DRAWING SPRITES on GUI

/// For very simple drawing without interaction.
function draw_text_box(_speech){
	draw_set_font(fnt_body);
	draw_set_halign(fa_center); // Text center-aligned
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	var _margin_text = view_wport[0] * 0.1;
	var _xx = view_wport[0] / 2; //middle of the screen
	var _margin_char = 200;
	var _linesep = 25;
	var _yy = view_hport[0] - (_margin_text / 2);
	var _text_yy = view_hport[0] - (_margin_text) - 16;

	draw_rectangle_center(view_wport[0] / 2, _yy, view_wport[0], _margin_text * 2, false, c_dkgray, 1);

	draw_text_ext(_xx, _text_yy, _speech, _linesep, view_wport[0] - 2 * _margin_text);	
}


/// @function fade_room(_room, _duration, _colour)
/// @param _room The target room to move to
function fade_room(_room) {
	// Create fade object at top left corner at highest depth
	var _inst = instance_create_depth(0, 0, 0, obj_fade);
	_inst.target_room = _room;
}