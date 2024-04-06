/// @description Insert description here
// You can write your code in this editor
if instance_number(object_index) > 1 {
    instance_destroy();
    exit;
}

ChatterboxLoadFromFile("room_1.yarn");
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
	chatterbox_set = function(_node_name) {
		ChatterboxJump(chatterbox, _node_name);
		chatterbox_update();
		obj_player.set_is_talking(true);
	}
#endregion
// Go to node zero
chatterbox_set("0");

#region constants
// Draw step
BG_ALPHA = 0.9;
#endregion


#region ChatterboxAddFunction defined here
	ChatterboxAddFunction("skillCheck", skill_check);
	ChatterboxAddFunction("diceRoll", dice_roll);
	ChatterboxAddFunction("calculateOdds", calculate_odds);
	ChatterboxAddFunction("visitedNode", ChatterboxGetVisited);
	
	ChatterboxAddFunction("setGender", set_player_gender);
	ChatterboxAddFunction("getIntelligence", get_intelligence);
	ChatterboxAddFunction("getCharisma", get_charisma);
	ChatterboxAddFunction("getEmpathy", get_empathy);
	ChatterboxAddFunction("getName", get_name);
	ChatterboxAddFunction("incrementStage", increment_stage);
	ChatterboxAddFunction("getStage", get_stage);
	
	ChatterboxAddFunction("changeGenderMeter", change_gender_meter);
	ChatterboxAddFunction("getGenderMeter", get_gender_meter);
	
	ChatterboxAddFunction("changeRelationship", change_npc_relationship);
	ChatterboxAddFunction("getRelationship", get_npc_relationship);
	ChatterboxAddFunction("setNPCKnows", set_npc_knows);
	ChatterboxAddFunction("getNPCKnows", get_npc_knows);
	
	ChatterboxAddFunction("changeConfidence", change_confidence);
	ChatterboxAddFunction("getConfidence", get_confidence);
	ChatterboxAddFunction("addExperience", add_experience);
	
	ChatterboxAddFunction("openStatMenu", open_stat_menu);
	ChatterboxAddFunction("openHangoutMenu", open_hangout_menu);
	ChatterboxAddFunction("openWardrobeMenu", open_wardrobe_menu);
	
	/// Door Functions here
	ChatterboxAddFunction("goto_black_room", goto_black_room);
	ChatterboxAddFunction("goto_splash_1", goto_splash_1);
	ChatterboxAddFunction("goto_splash_boss1", goto_splash_boss1);
	ChatterboxAddFunction("goto_splash_boss2", goto_splash_boss2);
	ChatterboxAddFunction("goto_room_bedroom_day", goto_room_bedroom_day);
	
	ChatterboxAddFunction("goto_room_class_1", goto_room_class_1);
	ChatterboxAddFunction("goto_room_class_1_seated", goto_room_class_1_seated);
	ChatterboxAddFunction("goto_room_class_1_discussion", goto_room_class_1_discussion);
	ChatterboxAddFunction("goto_room_class_1_discussion_nosage", goto_room_class_1_discussion_nosage);
	ChatterboxAddFunction("goto_room_class_1_discussion_sageleft", goto_room_class_1_discussion_sageleft);
	ChatterboxAddFunction("goto_room_bus_cj", goto_room_bus_cj);
	ChatterboxAddFunction("goto_room_bus_s", goto_room_bus_s);
	ChatterboxAddFunction("goto_room_bus_j", goto_room_bus_j);
	ChatterboxAddFunction("goto_room_bus", goto_room_bus);
	
	ChatterboxAddFunction("goto_room_class_2", goto_room_class_2);
	ChatterboxAddFunction("goto_room_class_3", goto_room_class_3);
	
	/// Bedroom
	ChatterboxAddFunction("goto_room_bedroom", goto_room_bedroom);
	ChatterboxAddFunction("goto_room_bedroom_after_cca", goto_room_bedroom_after_cca);
	ChatterboxAddFunction("goto_room_bedroom_after_cca2", goto_room_bedroom_after_cca2);
	ChatterboxAddFunction("goto_room_bedroom_frombed", goto_room_bedroom_frombed);
	ChatterboxAddFunction("goto_room_bedroom_afterHangout", goto_room_bedroom_afterHangout);
	ChatterboxAddFunction("goto_room_bedroom_after_class2", goto_room_bedroom_after_class2);
	ChatterboxAddFunction("goto_room_bedroom_after_class3", goto_room_bedroom_after_class3);
	
	ChatterboxAddFunction("goto_room_cca_1", goto_room_cca_1);
	ChatterboxAddFunction("goto_room_cca_1_seated", goto_room_cca_1_seated);
	ChatterboxAddFunction("goto_room_cca_1_seated_18", goto_room_cca_1_seated_18);
	ChatterboxAddFunction("goto_room_cca_1_seated_11", goto_room_cca_1_seated_11);
	ChatterboxAddFunction("goto_room_cca_2", goto_room_cca_2);
	ChatterboxAddFunction("goto_room_cca_2_end", goto_room_cca_2_end);
	ChatterboxAddFunction("goto_room_cca_2_seated", goto_room_cca_2_seated);
	ChatterboxAddFunction("goto_room_cca_3", goto_room_cca_3);
	ChatterboxAddFunction("goto_room_cca_3_end", goto_room_cca_3_end);
	
	/// Hangouts
	ChatterboxAddFunction("goto_room_hangout_a", goto_room_hangout_a);
	ChatterboxAddFunction("goto_room_hangout_v", goto_room_hangout_v);
	ChatterboxAddFunction("goto_room_hangout_n", goto_room_hangout_n);
	
	// BOSS
	ChatterboxAddFunction("goto_room_boss_1", goto_room_boss_1);
	ChatterboxAddFunction("set_camera_boss1", set_camera_boss1);
	ChatterboxAddFunction("goto_room_bedroom_after_boss1", goto_room_bedroom_after_boss1);
	
	ChatterboxAddFunction("goto_room_boss_2_1", goto_room_boss_2_1);
	ChatterboxAddFunction("goto_room_boss_2_1_seated", goto_room_boss_2_1_seated);
	ChatterboxAddFunction("goto_room_boss_2_2", goto_room_boss_2_2);
	ChatterboxAddFunction("goto_splash_boss2_2", goto_splash_boss2_2);
	
	ChatterboxAddFunction("goto_room_boss_3_1", goto_room_boss_3_1);
	ChatterboxAddFunction("goto_room_boss_3_2", goto_room_boss_3_2);
	ChatterboxAddFunction("set_camera_boss3_1", set_camera_boss3_1);
#endregion



