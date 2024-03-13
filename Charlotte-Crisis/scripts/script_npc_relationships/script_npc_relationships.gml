/// @description To be called by ChatterBox
/// @param {Array} _parameters {Name, amount}
function change_npc_relationship(_parameters) {
	var _name = _parameters[0];
	var _amount = real(_parameters[1]);
	return obj_npc_relationships.change_relationship(_name, _amount);
}

/// @function get_npc_relationship(_parameters)
/// @description return relationship of name supplied e.g. "CJ"
/// @param {Array} _parameters {Name}
/// @return {Real} Relationship of character
function get_npc_relationship(_parameters) {
	var _name = _parameters[0];
	return obj_npc_relationships.get_relationship(_name);
}

/// @description To be called by ChatterBox
/// @param {Array} _parameters {Name}
function set_npc_knows(_parameters) {
	var _name = _parameters[0];
	obj_npc_relationships.set_npc_knows(_name);
}

/// @description To be called by ChatterBox
/// @param {Array} _parameters {Name}
function get_npc_knows(_parameters) {
	var _name = _parameters[0];
	return obj_npc_relationships.get_npc_knows(_name);
}