/// @description Insert description here
// You can write your code in this editor
if instance_number(object_index) > 1 {
    instance_destroy();
    exit;
}
ChatterboxLoadFromFile("class_1.yarn");
chatterbox = ChatterboxCreate();
ChatterboxJump(chatterbox, "1");
chatterbox_update();

option_index = 0;

size = [0.7, 0.75];
colour = [c_ltgray, c_white];


obj_player.set_is_talking(true);

function chatterbox_set(_node_name) {
	ChatterboxJump(chatterbox, _node_name);
	chatterbox_update();
	obj_player.set_is_talking(true);
}

#region ChatterboxAddFunction defined here
	ChatterboxAddFunction("skillCheck", skill_check);
	ChatterboxAddFunction("diceRoll", dice_roll);

	ChatterboxAddFunction("setGender", set_player_gender);
	
	/// Door Functions here
	ChatterboxAddFunction("goto_room_class_1", goto_room_class_1);
	ChatterboxAddFunction("goto_room_class_1_seated", goto_room_class_1_seated);
	ChatterboxAddFunction("goto_room_bus_cj", goto_room_bus_cj);
	ChatterboxAddFunction("goto_room_bus_s", goto_room_bus_s);
	ChatterboxAddFunction("goto_room_bus_j", goto_room_bus_j);
	ChatterboxAddFunction("goto_room_bus", goto_room_bus);
	ChatterboxAddFunction("goto_room_bedroom", goto_room_bedroom);
	ChatterboxAddFunction("goto_room_bedroom_frombed", goto_room_bedroom_frombed);
	
	ChatterboxAddFunction("goto_room_cca_1", goto_room_cca_1);
	ChatterboxAddFunction("goto_room_cca_1_seated", goto_room_cca_1_seated);
	
	ChatterboxAddFunction("changeRelationship", change_npc_relationship);
	ChatterboxAddFunction("getRelationship", get_npc_relationship);
	
	ChatterboxAddFunction("changeConfidence", change_confidence);
	ChatterboxAddFunction("addExperience", add_experience);
	
	/// Hangouts
	ChatterboxAddFunction("goto_room_hangout_a", goto_room_hangout_a);
	ChatterboxAddFunction("goto_room_hangout_v", goto_room_hangout_v);
	ChatterboxAddFunction("goto_room_hangout_n", goto_room_hangout_n);
#endregion

#region constants
// Draw step
BG_ALPHA = 0.9;
#endregion

