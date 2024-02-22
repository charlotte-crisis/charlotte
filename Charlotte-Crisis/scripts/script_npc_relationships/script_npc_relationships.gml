// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @description To be called by ChatterBox
/// @param {Array} _parameters {Name, amount}
function change_npc_relationship(_parameters) {
	var _name = _parameters[0];
	var _amount = real(_parameters[1]);
	return obj_npc_relationships.change_relationship(_name, _amount);
}
	
function get_npc_relationship(_parameters) {
	var _name = _parameters[0];
	return obj_npc_relationships.get_relationship(_name);
}