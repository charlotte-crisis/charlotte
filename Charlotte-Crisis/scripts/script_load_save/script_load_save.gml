///@description Load and Save functions
#macro SAVE_FILE "TheCharlotteCrisis_SaveFile.ini"

/// @description Saves the game into an ini file.	
function save_game(){
	ini_open(SAVE_FILE);
	
	/// obj_stats variables
	with (obj_stats) {
		ini_write_real("stats", "confidence", confidence);
		ini_write_real("stats", "experience", experience);
		ini_write_real("stats", "gender_meter", gender_meter);
		ini_write_real("stats", "int", intelligence);
		ini_write_real("stats", "cha", charisma);
		ini_write_real("stats", "emp", empathy);
	}
	
	/// obj_player's variables
	with (obj_player) {
		ini_write_real("player", "x", x);
		ini_write_real("player", "y", y);
		ini_write_real("player", "gender", gender);
		ini_write_real("player", "facing_direction", facing_direction);
		ini_write_real("player", "current_clothes_0", current_clothes[0]);
		ini_write_real("player", "current_clothes_1", current_clothes[1]);
		ini_write_real("player", "current_clothes_2", current_clothes[2]);
		ini_write_real("player", "is_talking", is_talking);
		ini_write_real("player", "is_interacting", is_interacting);
		ini_write_real("player", "is_sitting", is_sitting);
	}
	
	/// NPC Relationships
	with (obj_npc_relationships) {
		// TODO
	}
	
	/// Level
	ini_write_string("level", "room", room_get_name(room)); // room name as string
	ini_write_string("level", "chatterbox_source", ChatterboxGetCurrentSource(obj_chatterbox_control.chatterbox));
	if (obj_player.is_talking) {
		ini_write_string("level", "chatterbox_node", ChatterboxGetCurrent(obj_chatterbox_control.chatterbox));	
	}
	
	// Close at the end of it
	ini_close();
}

function load_game() {
	ini_open(SAVE_FILE);
	
	/// Room and Chatterbox =================================================
	/// Go to room. Defaults to first level
	var _rm_name = ini_read_string("level", "room", "rm_bedroom_menu"); 
	room_goto(asset_get_index(_rm_name)); // Do not use fade_room
	
	instance_destroy(obj_chatterbox_control);
	var _chatterbox_control = instance_create_layer(0, 0, "Helpers", obj_chatterbox_control);
	with (_chatterbox_control) {
		var _source = ini_read_string("level", "chatterbox_source", "menu.yarn");
		var _node = ini_read_string("level", "chatterbox_node", "");
		ChatterboxLoadFromFile(_source);
		chatterbox = ChatterboxCreate(_source);
		if (_node != "") {
			chatterbox_set(_node);	
		}
	}
	
	/// Player ==============================================================
	/// Destroy existing player object to create a new one
	instance_destroy(obj_player);
	// create obj_player and set variables. Defaults are following rm_bedroom_menu
	// These variables are set before its Create event runs
	var _player = instance_create_layer(0, 0, "Player", obj_player, {
		x: ini_read_real("player", "x", 74),
		y: ini_read_real("player", "y", 74),
	});
	with (_player) {
		gender = ini_read_real("player", "gender", 1);
		facing_direction = ini_read_real("player", "facing_direction", facing_direction);
		current_clothes[0] = ini_read_real("player", "current_clothes_0", current_clothes[0]);
		current_clothes[1] = ini_read_real("player", "current_clothes_1", current_clothes[1]);
		current_clothes[2] = ini_read_real("player", "current_clothes_2", current_clothes[2]);
		is_talking = ini_read_real("player", "is_talking", is_talking);
		is_interacting = ini_read_real("player", "is_interacting", is_interacting);
		is_sitting = ini_read_real("player", "is_sitting", is_sitting);
	}
	
	/// Stats ================================================================
	instance_destroy(obj_stats);
	var _stats = instance_create_layer(0, 0, "Helpers", obj_stats);
	with (_stats) {
		confidence = ini_read_real("stats", "confidence", confidence);
		experience = ini_read_real("stats", "experience", experience);
		gender_meter = ini_read_real("stats", "gender_meter", gender_meter);
		intelligence = ini_read_real("stats", "int", intelligence);
		charisma = ini_read_real("stats", "cha", charisma);
		empathy = ini_read_real("stats", "emp", empathy);
	}
	
	/// Create other objects =================================================
	instance_create_layer(0, 0, "Helpers", obj_npc_relationships); // TODO
	instance_create_layer(0, 0, "Helpers", obj_pause_menu);
	
	ini_close();
	
}