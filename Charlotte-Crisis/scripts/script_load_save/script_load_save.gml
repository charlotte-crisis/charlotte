///@description Load and Save functions
#macro SAVE_FILE "TheCharlotteCrisis_SaveFile.ini"
#macro FILE_CHATTERBOX_VARIABLES "TheCharlotteCrisis_ChatterboxVariables.txt"

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
		ini_write_real("stats", "stage", stage);
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
		// ini_write_real("player", "is_interacting", is_interacting);
		ini_write_real("player", "is_sitting", is_sitting);
	}
	
	/// NPC Relationships
	with (obj_npc_relationships) {
		var keys = variable_struct_get_names(npc_relationships);
		for (var i = array_length(keys)-1; i >= 0; --i) {
		    var k = keys[i];
		    var v = npc_relationships[$ k];
		    /* Use k and v here */
			// write key (name) = value (relationship)
			ini_write_real("npc_relationships", k, v);
		}
		
		keys = variable_struct_get_names(npc_knows);
		for (var i = array_length(keys)-1; i >= 0; --i) {
		    var k = keys[i];
		    var v = (npc_knows[$ k]) ? 1 : 0; //map true/false to 1/0
		    /* Use k and v here */
			// write key (name) = value (relationship)
			ini_write_real("npc_knows", k, v);
		}
	}
	
	// Camera
	ini_write_real("camera", "x", view_get_xport(0));
	ini_write_real("camera", "y", view_get_yport(0));
	
	/// Level
	ini_write_string("level", "room", room_get_name(room)); // room name as string
	ini_write_string("level", "chatterbox_source", ChatterboxGetCurrentSource(obj_chatterbox_control.chatterbox));
	
	if (obj_player.is_talking) {
		ini_write_string("level", "chatterbox_node", ChatterboxGetCurrent(obj_chatterbox_control.chatterbox));	
	} else { // Overwrite
		ini_write_string("level", "chatterbox_node", "");	
	}
	
	ini_close();
	
	// Export chatterbox variables
	// store in a separate txt file as it does not interact well with ini
	var _file = file_text_open_write(FILE_CHATTERBOX_VARIABLES);
	var _var_string = ChatterboxVariablesExport();
	show_debug_message(_var_string);
	file_text_write_string(_file, _var_string);
	file_text_close(_file);
}

function load_game() {
	ini_open(SAVE_FILE);
	
	/// Room and Chatterbox =================================================
	/// Go to room. Defaults to first level
	var _rm_name = ini_read_string("level", "room", "rm_bedroom_menu"); 
	room_goto(asset_get_index(_rm_name)); // Do not use fade_room
	
	/// Player ==============================================================
	/// Destroy existing player object to create a new one
	instance_destroy(obj_player);
	// create obj_player and set variables. Defaults are following rm_bedroom_menu
	// These variables are set before its Create event runs
	var _player = instance_create_layer(0, 0, "Player", obj_player, {
		x: ini_read_real("player", "x", 74),
		y: ini_read_real("player", "y", 74),
		visible: true,
	});
	
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
	
	
	with (_player) {
		gender = ini_read_real("player", "gender", 1);
		facing_direction = ini_read_real("player", "facing_direction", facing_direction);
		current_clothes[0] = ini_read_real("player", "current_clothes_0", current_clothes[0]);
		current_clothes[1] = ini_read_real("player", "current_clothes_1", current_clothes[1]);
		current_clothes[2] = ini_read_real("player", "current_clothes_2", current_clothes[2]);
		is_talking = ini_read_real("player", "is_talking", is_talking);
		// is_interacting = ini_read_real("player", "is_interacting", is_interacting);
		is_sitting = ini_read_real("player", "is_sitting", is_sitting);
	}
	
	// Camera ================================================================
	camera_set_view_pos(view_camera[0],
			ini_read_real("camera", "x", 0),
			ini_read_real("camera", "y", 0)
		);
	
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
		stage = ini_read_real("stats", "stage", stage);
	}
	
	/// Create other objects =================================================
	instance_destroy(obj_npc_relationships);
	var _npc_relationships = instance_create_layer(0, 0, "Helpers", obj_npc_relationships);
	with (_npc_relationships) {
		var keys = variable_struct_get_names(npc_relationships);
		for (var i = array_length(keys)-1; i >= 0; --i) {
		    var k = keys[i];
			var v = ini_read_real("npc_relationships", k, 50);
		    npc_relationships[$ k] = v;
		}
		
		keys = variable_struct_get_names(npc_knows);
		for (var i = array_length(keys)-1; i >= 0; --i) {
		    var k = keys[i];
			var v = (ini_read_real("npc_knows", k, 0)) ? true : false; // map 1/0 to true/false
		    npc_knows[$ k] = v;
		}
	}
	
	instance_create_layer(0, 0, "Helpers", obj_pause_menu);
	
	ini_close();
	
	// Read chatterbox variables
	var _file = file_text_open_read(FILE_CHATTERBOX_VARIABLES);
	var _var_json = file_text_readln(_file);
	show_debug_message(_var_json);
	ChatterboxVariablesImport(_var_json);
	
}