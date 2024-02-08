// To be used in Chatterbox.
// Note that Yarn/Chatterbox values are given as an array.
function set_player_gender(_gender) {
	obj_player.set_gender(_gender[0]);
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

#endregion

#region Skill checks, Diceroll

/// @function					skill_check(_skill, _required)
/// @description				Checks if Skill + Dice roll outcome is greater than or equal to required.
///	@param {Array} _parameters	{Skill, Threshold}
///	@return {Bool}				True if succeed (>=)
function skill_check(_parameters) {
	// Currently using 6-sided dice
	var _score = _parameters[0] + irandom(6);
	show_debug_message(_parameters);
	return (_score >= _parameters[1]);
}

#endregion

#region Player Relationship

	/// @param {Array} _parameters {Name, amount}
	function change_npc_relationship(_parameters) {
		var _name = _parameters[0];
		var _amount = real(_parameters[1]);
		
		switch(_name) {
			case "CJ":
				obj_cj.change_relationship(_amount);
				break;
		}
	}

#endregion