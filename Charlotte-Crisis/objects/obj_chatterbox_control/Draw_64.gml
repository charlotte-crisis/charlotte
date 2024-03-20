/// @description Draw text from Chatterbox.

// Margin of text from left and right. 
// Base it off of room width.
var _margin_text = view_wport[0] * 0.1;
var _margin_char = 200;
var _linesep = 25;

draw_set_font(fnt_body);
draw_set_valign(fa_top); // text aligned from top to bottom

if (IsChatterbox(chatterbox) && speaker_and_speech != undefined) {
	
	// Draw dialogue box and speech
	draw_dialogue(speech, speaker_is_narrator());
	draw_speaker_portrait(speaker);
	
	//var _yy = view_hport[0] - 48;
	var _text_yy = view_hport[0] - (_margin_text) - 16;
	var _xx = view_wport[0] * 0.2;

	
	// If there are options
	if (ChatterboxGetOptionCount(chatterbox)) {
		draw_set_valign(fa_middle); // Set text align middle
		draw_set_halign(fa_center);
		
		// Text box width and height
		var _width = view_wport[0] * 0.6;
		var _height = 50;
		draw_set_font(fnt_body_small);
		var _row = 0;
		var _yy;
		
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if (ChatterboxGetOptionConditionBool(chatterbox, i)) {
				_xx = view_wport[0] / 2;
				_yy = (view_hport[0] / 8) * (_row + 2); 
				// Increment row ONLY if an option was displayed
				// Prevent gaps
				var _metadata = ChatterboxGetOptionMetadata(chatterbox, i);
				var _skillcheck = false;
				
				// any additional text to add to option string
				var _prefix = "";
				var _suffix = "";
				
				if (array_length(_metadata) > 0) {
					if (_metadata[0] == "skillcheck") {
						_skillcheck = true;
						_prefix = format_skillcheck_indicator(_metadata[1], _metadata[2]);
						_suffix = format_odds_string(_metadata[1], _metadata[2]);
					}
				}
				
				// Highlight option being selected
				var _selected = (option_index == i);
				draw_option_box(_xx, _yy, _selected, _skillcheck);
				
				var _option = ChatterboxGetOption(chatterbox, i);
				_option = _prefix + _option + _suffix;	
				
				draw_text_ext(_xx, _yy, _option, _linesep - 10, _width - _margin_text);
				_row++;
				
			}
		}
	}
}






