/// @description Door functions

#region Helpers
	#macro X_CLASS_DOOR 296
	#macro X_BUS_DOOR 223
	#macro X_CCA_DOOR 46
	#macro X_CCA_SEATED 114
	#macro X_BEDROOM_DOOR 230
	#macro X_HANGOUT_DOOR 159
	#macro X_HOUSE_DOOR 30 // This is also the location of the bed
	#macro X_BEDROOM_BED 30 // This is also the location of the bed
 	#macro Y_HEIGHT 74
	#macro X_CAFE_SEATED 292
	#macro Y_CAFE_SEATED 73

	/// @function set_player_position(_x, _y, _facing, _sitting)
	/// @description Sets player's x, y, facing direction, sitting sprite
	/// @param {Real} _x 		x pos		
	/// @param {Real} _y 		y pos
	/// @param {Real} _facing 	1: right -1: left
	/// @param {Bool} _sitting 	true if sitting
	function set_player_position(_x, _y, _facing = 1, _sitting = false) {
		obj_player.x = _x;
		obj_player.y = _y;
		obj_player.facing_direction = _facing;
		obj_player.is_sitting = _sitting;
	}

	/// @function fade_room(_room)
	/// @param _room				The target room to move to
	/// @param {Bool} _change_room	true if there is a room to change to
	function fade_room(_room, _change_room = true, _colour = c_black, _callback) {
		// Create fade object at top left corner at highest depth
		var _inst = instance_create_depth(0, 0, 0, obj_fade);
		_inst.FADE_COLOUR = _colour;
		_inst.target_room = _room;
		_inst.change_room = _change_room;
		if !(is_undefined(_callback)) {
			_inst.callback = _callback;
		}
	
	/// @description Change yarn file, start a new node.
	function change_node(_sourcefile, _node) {
		if !(is_undefined(_sourcefile)) {
			ChatterboxLoadFromFile(_sourcefile);
			obj_chatterbox_control.chatterbox = ChatterboxCreate(_sourcefile);	
			obj_chatterbox_control.chatterbox_set(_node);
		} else {
			ChatterboxJump(chatterbox, _node)	
		}
		
	}
}
#endregion

#region Splash Rooms
	// To be used as long as you want to transition to a black room
	function goto_black_room() {
		fade_room(rm_black_screen);	
	}
	
	function goto_splash_1() {
		fade_room(rm_splash_1);	
	}
	
	function goto_splash_boss1(_num) {
		if (_num == 1) {
			fade_room(rm_splash_boss1_1);	
		} else if (_num == 2) {
			fade_room(rm_splash_boss1_2);	
		} else {
			fade_room(rm_splash_boss1_3);	
		}
	}
	
	function goto_splash_boss2(_num) {
		if (_num == 1) {
			fade_room(rm_splash_boss2_1_1);	
		} else {
			room_goto(rm_splash_boss2_1_2);	 // Instant
		}
	}
	
	function goto_splash_boss2_2() {
		room_goto(rm_splash_boss2_2_cutscene); // Instant
	}
#endregion

#region Classroom Gotos
	function goto_room_class_1(){
		fade_room(rm_class_1,,,function(){
			set_player_position(X_CLASS_DOOR, Y_HEIGHT, -1);
			change_node("class_1.yarn", "1");
			//// Need to load then create.
			//ChatterboxLoadFromFile("class_1.yarn");
			//obj_chatterbox_control.chatterbox = ChatterboxCreate("class_1.yarn");
			//obj_chatterbox_control.chatterbox_set("1");
		});
	}
	
	function goto_room_class_2(){
		fade_room(rm_class_1,,,function() {
			set_player_position(X_CLASS_DOOR, Y_HEIGHT, -1);
			change_node("class_2.yarn", "1");
		});
		//// Need to load then create.
		//ChatterboxLoadFromFile("class_2.yarn");
		//obj_chatterbox_control.chatterbox = ChatterboxCreate("class_2.yarn");
		//ChatterboxJump(chatterbox, "1");
	}
	
	// Auxillary functions. Can be reused
	function goto_room_class_1_seated(){
		fade_room(rm_class_1_seated,,, function(){
			set_player_position(223, Y_HEIGHT, 1, true);
			//obj_player.x = 223;
			//obj_player.y = 74;
			//obj_player.facing_direction = 1;
			//obj_player.is_sitting = true;
	
			ChatterboxJump(chatterbox, "5");
		});
	}

	function goto_room_class_1_discussion() {
		fade_room(rm_class_1_discussion,,, function() {
			set_player_position(203, 75, -1, true);
		});
		//obj_player.x = 203;
		//obj_player.y = 75;
		//obj_player.facing_direction = -1;
		//obj_player.is_sitting = true;
	}
	
	function goto_room_class_1_discussion_sageleft() {
		fade_room(rm_class_1_discussion_sageleft);
		//obj_player.x = 203;
		//obj_player.y = 75;
		//obj_player.facing_direction = -1;
		//obj_player.is_sitting = true;
	}

	
	function goto_room_class_1_discussion_nosage() {
		fade_room(rm_class_1_discussion_nosage);
		//obj_player.x = 203;
		//obj_player.y = 75;
		//obj_player.facing_direction = -1;
		//obj_player.is_sitting = true;
	}

#endregion

#region Bus Stop
	function goto_room_bus(){
		fade_room(rm_bus,,, function() {
			set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
			// change_node(chatterbox, "12_alone");	
		});
	}

	function goto_room_bus_cj(){
		fade_room(rm_bus_cj,,,function() {
			set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
		});		
	}

	function goto_room_bus_j(){
		fade_room(rm_bus_j,,,function(){
			set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
		});
		
	}

	function goto_room_bus_s(){
		fade_room(rm_bus_s,,,function() {
			set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
		});
		
	}
#endregion

#region Bedrooms

/// @description Usable at any time to transition to day.
function goto_room_bedroom_day() {
	fade_room(rm_bedroom_day, ,c_white, function() {
		set_player_position(X_HOUSE_DOOR, Y_HEIGHT, 1)	
	});
}

function goto_room_bedroom(){
	fade_room(rm_bedroom_night,,, function() {
		set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);

		ChatterboxLoadFromFile("room_1_after_class.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1_after_class.yarn");
		ChatterboxJump(chatterbox, "after");	
	});
}

// THIS FUNCTION SHOULD BE DEPRECATED.
function goto_room_bedroom_frombed() {
	fade_room(rm_bedroom_day, ,c_white);
	obj_player.x = 30;
	obj_player.y = 74;
	obj_player.facing_direction = 1;
	ChatterboxJump(chatterbox, "0");
}

function goto_room_bedroom_after_class2(){
	fade_room(rm_bedroom_night,,,function() {
		set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);

		ChatterboxLoadFromFile("room_2_after_class2.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("room_2_after_class2.yarn");
		ChatterboxJump(chatterbox, "after");	
	});
}

function goto_room_bedroom_after_cca(){
	fade_room(rm_bedroom_night,,, function() {
		set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);
	
		ChatterboxLoadFromFile("room_1_after_cca.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1_after_cca.yarn");
		ChatterboxJump(chatterbox, "after");	
	});
}

function goto_room_bedroom_after_cca2(){
	fade_room(rm_bedroom_night, function() {
		set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);
	
		ChatterboxLoadFromFile("room_1_after_cca2.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1_after_cca2.yarn");
		ChatterboxJump(chatterbox, "after");	
	});
}

function goto_room_bedroom_afterHangout(){
	// TODO: Find a way to automate going to the correct yarn file which leads to the correct boss fight
	var _source = "room_1_after_hangout.yarn";
	var _node = "after";
	if (obj_stats.get_week() == 2) {
		_source = "room_2_after_hangout.yarn";
	} else if (obj_stats.get_week() == 3) {
		_source = "room_3_after_hangout.yarn";
	}
	
	fade_room(rm_bedroom_night,,,function() {
		set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);
		change_node(_source, _node);
		//ChatterboxLoadFromFile("room_1_after_hangout.yarn");
		//obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1_after_hangout.yarn");
		//ChatterboxJump(chatterbox, "after");	
	});
}
#endregion

#region CCA1
	function goto_room_cca_1(){
		fade_room(rm_cca_1,,, function() {
			set_player_position(X_CCA_DOOR, Y_HEIGHT, 1)
			change_node("cca_1.yarn", "1");
			//ChatterboxLoadFromFile("cca_1.yarn");
			//obj_chatterbox_control.chatterbox = ChatterboxCreate("cca_1.yarn");
			//ChatterboxJump(chatterbox, "1");	
		});
		
	}

	function goto_room_cca_1_seated(){
		fade_room(rm_cca_1_seated,,, function() {
			set_player_position(X_CCA_SEATED, Y_HEIGHT, 1, true);
			//obj_player.x = X_CCA_SEATED;
			//obj_player.y = Y_HEIGHT;
			//obj_player.facing_direction = 1;
			//obj_player.is_sitting = true;
	
			ChatterboxJump(chatterbox, "5");
		});
	}

	function goto_room_cca_1_seated_18() {
		fade_room(rm_cca_1_seated_18);
	}

	function goto_room_cca_1_seated_11() {
		fade_room(rm_cca_1_seated_11);
	}
	
	function goto_room_cca_2(){
		fade_room(rm_cca_2,,, function() {
			set_player_position(X_CCA_DOOR, Y_HEIGHT, 1);
			change_node("cca_2.yarn", "1");
			//ChatterboxLoadFromFile("cca_2.yarn");
			//obj_chatterbox_control.chatterbox = ChatterboxCreate("cca_2.yarn");
			//ChatterboxJump(chatterbox, "1");
		});
	}
	
	function goto_room_cca_2_seated(){
		fade_room(rm_cca_2_seated,,,function() {
			set_player_position(X_CCA_SEATED, Y_HEIGHT, 1, true);
			//obj_player.x = X_CCA_SEATED;
			//obj_player.y = Y_HEIGHT;
			//obj_player.facing_direction = 1;
			//obj_player.is_sitting = true;
	
			ChatterboxJump(chatterbox, "2");	
		});
	}
	
	function goto_room_cca_2_end(){
		fade_room(rm_cca_2_end,,, function() {
			set_player_position(X_CCA_SEATED, Y_HEIGHT, 1, false);
		});
	}
#endregion

#region Hangouts
	function goto_room_hangout_a() {
		fade_room(rm_hangout_a,,, function() {
			set_player_position(X_HANGOUT_DOOR, Y_HEIGHT, 1);
			change_node("hangout_anthony.yarn", "0");
	
			//ChatterboxLoadFromFile("hangout_anthony.yarn");
			//obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_anthony.yarn");
			//ChatterboxJump(chatterbox, "0");	
		});
	}
	
	function goto_room_hangout_n() {
		fade_room(rm_hangout_n,,, function() {
			set_player_position(X_HANGOUT_DOOR, Y_HEIGHT, 1);
			change_node("hangout_nadia.yarn", "0");	
		});
		
		//ChatterboxLoadFromFile("hangout_nadia.yarn");
		//obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_nadia.yarn");
		//ChatterboxJump(chatterbox, "0");
	}
	
	function goto_room_hangout_v() {
		fade_room(rm_hangout_v,,, function() {
			set_player_position(X_HANGOUT_DOOR, Y_HEIGHT, 1);
			change_node("hangout_vera.yarn", "0");	
		});
	
		//ChatterboxLoadFromFile("hangout_vera.yarn");
		//obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_vera.yarn");
		//ChatterboxJump(chatterbox, "0");
	}

#endregion

#region Boss
	function goto_room_boss_1() {
		fade_room(rm_house_sister);
		set_player_position(X_HOUSE_DOOR, Y_HEIGHT, 1);
		
		ChatterboxLoadFromFile("boss_1.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("boss_1.yarn");
		ChatterboxJump(chatterbox, "0");
	}
	
	// More like pan the camera
	function set_camera_boss1() {
		// TODO: Animate a pan somehow... I dont know why it doesnt work
		camera_set_view_pos(view_camera[0], 144, 0);
	}
	
	function goto_room_bedroom_after_boss1(){
		fade_room(rm_bedroom_day,,, function() {
			set_player_position(X_BEDROOM_BED, Y_HEIGHT, 1);
			change_node("room_2.yarn", "after");
			//ChatterboxLoadFromFile("room_2.yarn");
			//obj_chatterbox_control.chatterbox = ChatterboxCreate("room_2.yarn");
			//ChatterboxJump(chatterbox, "after");	
		});
	}
	
	function goto_room_bedroom_after_boss2() {
		fade_room(rm_bedroom_day,,, function() {
			set_player_position(X_BEDROOM_BED, Y_HEIGHT, 1);
			change_node("room_3.yarn", "after");
		});	
	}
	
	function goto_room_boss_2_1() {
		fade_room(rm_boss_2_1,,, function() {
			set_player_position(X_HANGOUT_DOOR, Y_HEIGHT, 1);
			change_node("boss_2_1.yarn", "0");
		});
	}
	
	function goto_room_boss_2_1_seated() {
		fade_room(rm_boss_2_1, false,, function() {
			set_player_position(X_CAFE_SEATED, Y_CAFE_SEATED, 1);
			camera_set_view_pos(view_camera[0], 124, 0);
		});
	}
	
	function goto_room_boss_2_2() {
		fade_room(rm_boss_2_2,,, function() {
			change_node("boss_2_2.yarn", "start");
		});
	}
#endregion
