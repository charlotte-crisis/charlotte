// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function get_npc
/// @return NPC object
function get_npc(_name) {
		switch(_name) {
			case "CJ":
				return obj_cj;
			case "J":
				return obj_joanne;
			case "S":
				return obj_sage;
			case "A":
				return obj_anthony;
			case "N":
				return obj_nadia;
			case "V":
				return obj_vera;
		}
}