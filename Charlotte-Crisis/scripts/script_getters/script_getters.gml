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

/// @param
function get_room_name(_week) {
	
	switch(room) {
		case rm_class_1:
		case rm_class_1_discussion:
		case rm_class_1_discussion_nosage:
		case rm_class_1_seated:	
			return string("Week {0} - Class", _week);
		case rm_cca_1:
		case rm_cca_1_seated:
		case rm_cca_1_seated_11:
		case rm_cca_1_seated_18:
			return string("Week {0} - Art Club", _week);
		case rm_bedroom_menu:
		case rm_bedroom_1:
		case rm_bedroom_day:
		case rm_bedroom_night:
		case rm_bedroom_parent:
		case rm_bedroom_after_cca1:
		case rm_bedroom_after_class1:
			return string("Week {0} - Bedroom", _week);
		case rm_bus:
		case rm_bus_cj:
		case rm_bus_j:
		case rm_bus_s:
			return string("Week {0} - Bus Stop", _week);
		case rm_house_sister:
			return string("Week {0} - Home", _week);
		case rm_hangout_a:
		case rm_hangout_n:
		case rm_hangout_v:
			return string("Week {0} - Hangout", _week);
	}
}

function get_stage() {
	return obj_stats.get_stage();
}

function get_week() {
	return obj_stats.get_week();	
}