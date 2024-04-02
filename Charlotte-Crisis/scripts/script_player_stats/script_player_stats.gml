// To be used in Chatterbox.
// Note that Yarn/Chatterbox values are given as an array.
function set_player_gender(_gender) {
	obj_player.gender = _gender[0];
}

function set_chatterbox_stats() {
	ChatterboxVariableSet("int",obj_stats.intelligence);
	ChatterboxVariableSet("cha",obj_stats.charisma);
	ChatterboxVariableSet("emp",obj_stats.empathy);
}

#region stats and experience
	// TODO: Separate obj_player functions and obj_stats functions
	function add_empathy() {
		obj_stats.empathy += 1;
		return;
	}

	function add_charisma() {
		obj_stats.charisma += 1;
		return;
	}

	function add_intelligence() {
		obj_stats.intelligence += 1;
		return;
	}

	function add_experience(_amount) {
		obj_stats.experience += _amount[0];
		return;	
	}

	function get_intelligence() {
		return obj_stats.intelligence;	
	}

	function get_charisma() {
		return obj_stats.charisma;	
	}

	function get_empathy() {
		return obj_stats.empathy;	
	}

	function get_name() {
		return obj_player.get_player_gender() ? "Charlotte":"Charles";	
	}
#endregion

#region Skill checks, Diceroll for use in chatterbox

/// @function				skill_check(_parameters)
/// @description			Checks if Skill + Dice roll outcome is greater than or equal to required.
///	@param _parameters		[Skill, Threshold]
///	@return {Bool}			True if succeed (>=) against 1d6
function skill_check(_parameters) {
	// Currently using 6-sided dice
	var _stat = (obj_stats.is_low_confidence()) ? _parameters[0]/2 : _parameters[0];
	var _score = _stat + irandom(5) + 1;
	return (_score >= _parameters[1]);
}

/// @function				dice_roll(_parameters)
/// @description			Checks if Skill + Dice roll outcome is greater than or equal to required.
///	@param _parameters		[Skill]
///	@return {Real}			The outcome of diceroll against 1d6
function dice_roll(_parameters) {
	// Currently using 6-sided dice
	var _stat = obj_stats.stat_after_debuff(_parameters[0]);
	return _stat + irandom(5) + 1;
	
}

/// @function				skill_check(_skill, _required)
/// @description			Checks if static skill meets threshold
///	@param _parameters		[Skill, Threshold]
///	@return {Bool}			The outcome
function static_check(_parameters) {
	// STATIC check.
	return (_parameters[0] >= _parameters[1]);
	
}

/// @function				calculate_odds(_parameters)
/// @description			Checks if Skill + Dice roll outcome is greater than or equal to required.
///	@param _parameters		[Skill, Threshold]
///	@return {Real}			The percentage chance of success as an int
function calculate_odds(_parameters) {
	var _score = _parameters[0];
	var _threshold = _parameters[1];
	var _needed = _threshold - _score;
	_needed = max(_needed, 0); //set to zero if it is negative
	var _odds = (6 - _needed + 1)/6
	var _percentage = min(round(_odds * 100), 100); // dont let it go over 100%
	return _percentage;
	
}

#endregion

#region Confidence
	/// @function				change_confidence(_amount);
	/// @description			Adds amount of relationship. Limit at 0 or 100.
	/// @param {Array}			_parameters [amount]
	/// @return {Real}
	function change_confidence(_parameters) {
		var _total = obj_stats.confidence + real(_parameters[0]);
	
		// Ensure doesn't go past 0 or 100.
		if (_total > 100) {
			_total = 100;	
		} else if (_total < 0) {
			_total = 0;	
		}
		obj_stats.confidence = _total;	
		return _total;
	}
	
	function get_confidence() {
		return obj_stats.confidence;	
	}
#endregion

#region Gender meter
	/// @description Changes the gender meter of the player.
	/// Accepts negative values. Will limit at 0 or 100.
	function change_gender_meter(_parameters) {
		var _total = obj_stats.gender_meter + real(_parameters[0]);
	
		// Ensure doesn't go past 0 or 100.
		if (_total > 100) {
			_total = 100;
		} else if (_total < 0) {
			_total = 0;	
		}
		obj_stats.gender_meter = _total;	
		return _total;
	}

	/// @return {Real} The gender [0, 100] int
	function get_gender_meter() {
		return obj_stats.gender_meter;
	}
#endregion

function increment_stage() {
	return obj_stats.increment_stage();	
}
