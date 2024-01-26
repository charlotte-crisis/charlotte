/// @description Draw text from Chatterbox.



// Margin of text from left and right. 
// Base it off of room width.
var _margin_text = view_wport[0] * 0.1;
var _margin_char = 200;
var _linesep = 15;

draw_set_font(fnt_body);
draw_set_valign(fa_middle);

if (IsChatterbox(chatterbox) && speaker_and_speech != undefined) {
	// draw_sprite_ext(characters, 0, _margin_char,				 room_height, size[_me], size[_me], 0, colour[_me], 1);
	// draw_sprite_ext(characters, 1, view_wport[0] - _margin_char, room_height, size[!_me], size[!_me], 0, colour[!_me], 1);
	
	var _yy = view_hport[0] - (_margin_text / 2);
	var _xx; // to be set below.
	
	draw_rectangle_center(view_wport[0] / 2, _yy, view_wport[0], _margin_text, false, c_black, BG_ALPHA);
	
	// Align text left if speaker is Player, Narrator, or Inner Monologue
	// Align right otherwise
	var _player = speaker_is_player();
	var _narrator = speaker_is_narrator();

	// Left align and left margin if it's player, narrator, or monologue
	// right algin otherwise.
	if (_player || _narrator) {
		draw_set_halign(fa_left);
		_xx = _margin_text;
	} else {
		draw_set_halign(fa_right);
		_xx = view_wport[0] - _margin_text;
	}
	
	// Draw the text.
	// If inner monologue: Set italic and do not print speaker, only speech
	if (_narrator) {
		draw_set_font(fnt_body_italic);
		draw_text_ext(_xx, _yy, speech, _linesep, view_wport[0] - 2 * _margin_text);	
		draw_set_font(fnt_body);
		
	} else {
		draw_text_ext(_xx, _yy, speaker + ": " + speech, _linesep, view_wport[0] - 2 * _margin_text);	
	}
	
	if (ChatterboxGetOptionCount(chatterbox)) {
		draw_set_halign(fa_center);
		
		// Text box width and height
		var _width = view_wport[0] * 0.6;
		var _height = 50;
		
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if (ChatterboxGetOptionConditionBool(chatterbox, i)) {
				_xx = view_wport[0] / 2;
				_yy = (view_hport[0] / 8) * (i + 3);
				var _icon = "";
				// Highlight option being selected
				if (option_index == i) {
					_icon = "> ";
					draw_rectangle_center(_xx, _yy, _width, _height, false, c_blue, BG_ALPHA);
				} else {
					draw_rectangle_center(_xx, _yy, _width, _height, false, c_black, BG_ALPHA);	
				}
				
				var _option = ChatterboxGetOption(chatterbox, i);
				
				draw_text_ext(_xx, _yy, _icon + _option, _linesep, _width - 2  *_margin_text);
				
			}
		}
	}
}






