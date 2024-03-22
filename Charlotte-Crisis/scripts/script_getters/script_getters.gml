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

function get_room_name() {
	switch(room) {
		case rm_bedroom_menu:
			return "Bedroom (Menu)";
		case rm_class_1:
		case rm_class_1_discussion:
		case rm_class_1_seated:	
			return "Week 1 - Class";
		case rm_cca_1:
		case rm_cca_1_seated:
		case rm_cca_1_seated_11:
		case rm_cca_1_seated_18:
			return "Week 1 - Art Club";
		case rm_bedroom_1:
		case rm_bedroom_after_cca1:
		case rm_bedroom_after_class1:
			return "Week 1 - Bedroom";
		case rm_bus:
		case rm_bus_cj:
		case rm_bus_j:
		case rm_bus_s:
			return "Week 1 - Bus Stop";
		case rm_house_sister:
			return "Week 1 - Confrontation";
		case rm_hangout_a:
		case rm_hangout_n:
		case rm_hangout_v:
			return "Hangout";
	}
}