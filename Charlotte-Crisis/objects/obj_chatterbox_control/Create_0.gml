/// @description Insert description here
// You can write your code in this editor
if instance_number(object_index) > 1 {
    instance_destroy();
    exit;
}

ChatterboxLoadFromFile("menu.yarn");
chatterbox = ChatterboxCreate();

option_index = 0;

size = [0.7, 0.75];
colour = [c_ltgray, c_white];

speaker_and_speech = "";
speaker = "";
speech = "";
previous_dialogue = "";

#region Functions
	///@description Jump to a node and update.
	///		To be used when the player is
	///		starting a new dialogue
	function chatterbox_set(_node_name) {
		ChatterboxJump(chatterbox, _node_name);
		chatterbox_update();
		obj_player.set_is_talking(true);
	}
#endregion

#region ChatterboxAddFunction defined here
	ChatterboxAddFunction("skillCheck", skill_check);
	ChatterboxAddFunction("diceRoll", dice_roll);
	ChatterboxAddFunction("calculateOdds", calculate_odds);
	
	ChatterboxAddFunction("setGender", set_player_gender);
	
	ChatterboxAddFunction("getIntelligence", get_intelligence);
	ChatterboxAddFunction("getCharisma", get_charisma);
	ChatterboxAddFunction("getEmpathy", get_empathy);
	ChatterboxAddFunction("getName", get_name);

	ChatterboxAddFunction("changeRelationship", change_npc_relationship);
	ChatterboxAddFunction("getRelationship", get_npc_relationship);
	ChatterboxAddFunction("setNPCKnows", set_npc_knows);
	ChatterboxAddFunction("getNPCKnows", get_npc_knows);
	
	ChatterboxAddFunction("changeConfidence", change_confidence);
	ChatterboxAddFunction("addExperience", add_experience);
	
	/// Door Functions here
	ChatterboxAddFunction("goto_room_class_1", goto_room_class_1);
	ChatterboxAddFunction("goto_room_class_1_seated", goto_room_class_1_seated);
	ChatterboxAddFunction("goto_room_class_1_discussion", goto_room_class_1_discussion);
	ChatterboxAddFunction("goto_room_bus_cj", goto_room_bus_cj);
	ChatterboxAddFunction("goto_room_bus_s", goto_room_bus_s);
	ChatterboxAddFunction("goto_room_bus_j", goto_room_bus_j);
	ChatterboxAddFunction("goto_room_bus", goto_room_bus);
	
	/// Bedroom
	ChatterboxAddFunction("goto_room_bedroom", goto_room_bedroom);
	ChatterboxAddFunction("goto_room_bedroom_after_cca", goto_room_bedroom_after_cca);
	ChatterboxAddFunction("goto_room_bedroom_frombed", goto_room_bedroom_frombed);
	
	ChatterboxAddFunction("goto_room_cca_1", goto_room_cca_1);
	ChatterboxAddFunction("goto_room_cca_1_seated", goto_room_cca_1_seated);
	ChatterboxAddFunction("goto_room_cca_1_seated_18", goto_room_cca_1_seated_18);
	ChatterboxAddFunction("goto_room_cca_1_seated_11", goto_room_cca_1_seated_11);
	
	/// Hangouts
	ChatterboxAddFunction("goto_room_hangout_a", goto_room_hangout_a);
	ChatterboxAddFunction("goto_room_hangout_v", goto_room_hangout_v);
	ChatterboxAddFunction("goto_room_hangout_n", goto_room_hangout_n);
#endregion

#region constants
// Draw step
BG_ALPHA = 0.9;
#endregion

