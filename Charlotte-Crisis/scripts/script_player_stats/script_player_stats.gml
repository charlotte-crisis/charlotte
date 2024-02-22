// To be used in Chatterbox.
// Note that Yarn/Chatterbox values are given as an array.
function set_player_gender(_gender) {
	obj_player.gender = _gender[0];
}

#region stats,confidence, and experience
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

#endregion

#region Skill checks, Diceroll

/// @function				skill_check(_skill, _required)
/// @description			Checks if Skill + Dice roll outcome is greater than or equal to required.
///	@param _parameters		{Skill, Threshold}
///	@return {Bool}			True if succeed (>=)
function skill_check(_parameters) {
	// Currently using 6-sided dice
	var _score = _parameters[0] + irandom(6);
	show_debug_message(_parameters);
	return (_score >= _parameters[1]);
}

/// @function				skill_check(_skill, _required)
/// @description			Checks if Skill + Dice roll outcome is greater than or equal to required.
///	@param _parameters		{Skill, Threshold}
///	@return {Real}			The outcome
function dice_roll(_parameters) {
	// Currently using 6-sided dice
	return _parameters[0] + irandom(6);
	
}

#endregion

#region Confidence
/// @function change_confidence(_amount);
/// @description	 Adds amount of relationship. Limit at 0 or 100.
/// @param {Real} _amount
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
#endregion
