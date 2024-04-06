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

/// @description Used to draw dialogue and option boxes
/// Draws at the center
/// Unused now.
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
	_stat_amt = obj_stats.stat_after_debuff(_stat_amt)
	var _percent = calculate_odds([_stat_amt, real(_threshold)]);
	return string(" ({0}% chance success)", _percent);
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

/// @params _params [Diceroll, Stat]
/// @return "[You rolled {roll} + {stat} = {diceroll}]"
function format_diceroll_outcome(_params) {
	var _roll = _params[0] - _params[1];
	return string("[You rolled {0} + {1} = {2}]", _roll, _params[1], _params[0]);	
}

function open_stat_menu() {
	obj_player.set_is_interacting(true);
	instance_create_layer(x, y, "Helpers", obj_stat_menu);	
}
function open_wardrobe_menu() {
	instance_create_layer(x, y, "Helpers", obj_clothing_menu);
	obj_player.set_is_interacting(true);
}

function open_hangout_menu() {
	instance_create_layer(x, y, "Helpers", obj_hangout_menu);
	obj_player.set_is_interacting(true);
}

function load_yarn_files() {
	// TODO: Load all the chatterbox yarn source files at one go.
	// Use file_find_first(working_directory + "*.yarn", fa_none);
	// https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/File_Handling/File_System/file_find_first.htm
}

function visited_node(_node, _source) {
	if (is_undefined(_source)) {
		return ChatterboxGetVisited(_node);
	}
	return ChatterboxGetVisited(_node, _source);
}