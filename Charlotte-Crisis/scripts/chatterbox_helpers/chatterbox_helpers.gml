// @function wrap(_val, _min, _max)
// @description Takes in value, and wraps value around if it's under the min or over the max.
function wrap(_val, _min, _max) {
	if (_val > _max) {
		return _min;
	} else if (_val < _min) {
		return _max;
	} else {
		return _val;	
	}
}

function draw_rectangle_center(_x, _y, _width, _height, _outline, _colour, _alpha) {
	var _old_colour = draw_get_colour();
	var _old_alpha = draw_get_alpha();
	
	draw_set_colour(_colour);
	draw_set_alpha(_alpha);
	
	draw_rectangle(_x - _width / 2, _y - _height / 2, 
			_x + _width / 2, _y + _height / 2, _outline);
	
	draw_set_colour(_old_colour);
	draw_set_alpha(_old_alpha);
}

function background_set_index(_arr) {
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	
	layer_background_index(back_id, _arr[0]);
}

function chatterbox_update() {
	node = ChatterboxGetCurrent(chatterbox);
	speaker_and_speech = ChatterboxGetContent(chatterbox, 0);
	speech = ChatterboxGetContentSpeech(chatterbox, 0);
	speaker = string_upper(ChatterboxGetContentSpeaker(chatterbox, 0));
	
	// reset option to point to first item
	for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
		if (ChatterboxGetOptionConditionBool(chatterbox, i)) {
			obj_chatterbox_control.option_index = i;
			break; // stop at the first
		}
	}
}

// If you want to show dialogue history
function chatterbox_store_previous_speech() {
// 	previous_speech = ChatterboxGetContentSpeech(chatterbox, 0);
//	previous_speaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	previous_dialogue = ChatterboxGetContent(chatterbox, 0);
}

function speaker_is_player() {
	return (speaker == "YOU");
}

function speaker_is_narrator() {
	return (speaker == "" || speaker == "NARRATOR");
}

/// @function format_odds_string(_stat, _threshold)
/// @description gets a string to append at the end of your option
///				 if it's a skill check.
/// @param {String} _stat the stat variable e.g. "cha"
/// @param {String} _threshold the value to beat e.g. >= 5
/// @return {String} "(%# chance success)"
function format_odds_string(_stat, _threshold) {
	var _stat_amt = ChatterboxVariableGet(_stat); // e.g. get("cha") returns $cha 
	var _percent = calculate_odds([_stat_amt, real(_threshold)]);
	return string(" (%{0} chance success)", _percent);
}

/// @function format_skillcheck_indicator(_stat, _threshold)
/// @description gets a string to append at the beginning of your option
///				 if it's a skill check.
/// @param {String} _stat the stat variable e.g. "cha"
/// @param {String} _threshold the value to beat e.g. >= 5
/// @return {String} "(%# chance success)"
function format_skillcheck_indicator(_stat, _threshold) {
	return string("[{0} {1}] ", string_upper(_stat), _threshold);
}

/// @function get_speaker_sprite(String name)
/// @param name {String} Name of speaker
/// @return {Asset.GMSprite} Sprite
function draw_speaker_portrait(name) {
	var sprite_x = 32;
	var sprite_y = view_hport[0] - 128;
	var sprite_xscale = 3;
	var sprite_yscale = 3;
	// Do comparisons only in uppercase.
	name = string_upper(name);
	if (name != "YOU") && (name != "") {
		draw_rectangle(32, view_hport[0] - 128, 128, view_hport[0] - 33, false);
	}
	switch (name) {
		case "TUTORIAL":
			draw_sprite_ext(spr_tutorial_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "ANTHONY":
			draw_sprite_ext(A_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "CHENJIE":
			draw_sprite_ext(CJ_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);			
			break;
		case "ELEANOR":
			draw_sprite_ext(E_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "HELEN":
			draw_sprite_ext(H_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "JOANNE":
			draw_sprite_ext(J_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "PROF LIM":
			draw_sprite_ext(L_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "NADIA":
			draw_sprite_ext(N_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "SAGE":
			draw_sprite_ext(S_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "SISTER":
			draw_sprite_ext(Si_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "VERA":
			draw_sprite_ext(V_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
	}
}