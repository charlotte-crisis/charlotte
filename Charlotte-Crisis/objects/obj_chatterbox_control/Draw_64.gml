/// @description Draw text from Chatterbox.

draw_set_font(fnt_body);
draw_set_valign(fa_top); // text aligned from top to bottom

// speaker_and_speech != undefined 
if (IsChatterbox(chatterbox) && obj_player.is_talking) {
	var _is_narrator = speaker_is_narrator();
	var _dialogue = "";
	
	if (_is_narrator) {
		_dialogue = speech;
	} else {
		_dialogue = speaker + ": " + speech;	
	}
	
	// Draw dialogue box and speech
	draw_dialogue(_dialogue, _is_narrator);
	draw_speaker_portrait(speaker);
	
	// Check if it has metadata
	var _content_metadata = ChatterboxGetContentMetadata(chatterbox, 0);
	if (array_length(_content_metadata) > 0) {
		if (_content_metadata[0] == "dice_outcome") {
			var _stat = ChatterboxVariableGet(_content_metadata[1]);
			var _diceroll = ChatterboxVariableGet("diceroll");
			var _dice_value = get_dice_roll_outcome([_stat, _diceroll]);
			
			var _threshold = _content_metadata[2];
			_dialogue += (_diceroll >= _threshold) ? " (Success)" : " (Failure)";
			
			draw_dialogue(_dialogue, _is_narrator);
			draw_diceroll_portrait(_dice_value);
		}
	}
	
	
	// If it is diceroll
	
	// Options
	var _xx = view_wport[0] / 2;
	var _width = view_wport[0] * 0.5;
	var _linesep = 18;
	// If there are options
	if (ChatterboxGetOptionCount(chatterbox)) {
		draw_set_valign(fa_middle); // Set text align middle
		draw_set_halign(fa_center);
		
		// Text box width and height
		draw_set_font(fnt_body_small);
		var _row = 0;
		var _yy;
		
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if (ChatterboxGetOptionConditionBool(chatterbox, i)) {
				_yy = (view_hport[0] / 10) * (_row + 2); 
				// Increment row ONLY if an option was displayed
				// Prevent gaps
				var _metadata = ChatterboxGetOptionMetadata(chatterbox, i);
				var _red = false; // Red option
				
				// any additional text to add to option string
				var _prefix = "";
				var _suffix = "";
				
				if (array_length(_metadata) > 0) {
					if (_metadata[0] == "skillcheck") {
						_red = true;
						_prefix = format_skillcheck_indicator(_metadata[1], _metadata[2]);
						_suffix = format_odds_string(_metadata[1], _metadata[2]);
					} else if (_metadata[0] == "continue"){
						_red = true;
					}
				}
				
				// Highlight option being selected
				var _selected = (option_index == i);
				draw_option_box(_xx, _yy, _selected, _red);
				
				var _option = ChatterboxGetOption(chatterbox, i);
				_option = _prefix + _option + _suffix;	
				
				draw_text_ext(_xx, _yy, _option, _linesep, _width);
				_row++;
				
			}
		}
	}
}






