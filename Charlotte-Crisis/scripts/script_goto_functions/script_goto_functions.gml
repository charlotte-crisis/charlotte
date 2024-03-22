/// @description Door functions

#region Helpers
	#macro X_CLASS_DOOR 296
	#macro X_BUS_DOOR 223
	#macro X_CCA_DOOR 46
	#macro X_CCA_SEATED 114
	#macro X_BEDROOM_DOOR 230
	#macro X_HANGOUT_DOOR 159
	#macro X_HOUSE_DOOR 30
	#macro Y_HEIGHT 74
	#macro Y_HEIGHT_NOTEXT 69 // Set this as the height if you enter a room without text.
							  // For some reason when you enter a room without chatterbox text at
							  // the start, you will be set about 5 pixels lower. I dont get it either

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
	function fade_room(_room, _change_room = true) {
		// Create fade object at top left corner at highest depth
		var _inst = instance_create_depth(0, 0, 0, obj_fade);
		_inst.target_room = _room;
		_inst.change_room = _change_room;
}
#endregion

#region Classroom Gotos
	function goto_room_class_1(){
		fade_room(rm_class_1);
		
		set_player_position(X_CLASS_DOOR, Y_HEIGHT, -1);
	
		// Need to load then create.
		ChatterboxLoadFromFile("class_1.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("class_1.yarn");
		ChatterboxJump(chatterbox, "1");
	}
	
	function goto_room_class_2(){
		fade_room(rm_class_1);
		
		set_player_position(X_CLASS_DOOR, Y_HEIGHT, -1);
	
		// Need to load then create.
		ChatterboxLoadFromFile("class_2.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("class_2.yarn");
		ChatterboxJump(chatterbox, "1");
	}

	function goto_room_class_1_seated(){
		fade_room(rm_class_1_seated);
	
		obj_player.x = 223;
		obj_player.y = 74;
		obj_player.facing_direction = 1;
		obj_player.is_sitting = true;
	
		ChatterboxJump(chatterbox, "5");
	}

	function goto_room_class_1_discussion() {
		fade_room(rm_class_1_discussion);
		obj_player.x = 203;
		obj_player.y = 75;
		obj_player.facing_direction = -1;
		obj_player.is_sitting = true;
	}

#endregion

#region Bus Stop
	function goto_room_bus(){
		fade_room(rm_bus);
		set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
	
		ChatterboxJump(chatterbox, "12_alone");
	}

	function goto_room_bus_cj(){
		fade_room(rm_bus_cj);
		set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
	}

	function goto_room_bus_j(){
		fade_room(rm_bus_j);
		set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
	}

	function goto_room_bus_s(){
		fade_room(rm_bus_s);
		set_player_position(X_BUS_DOOR, Y_HEIGHT, -1);
	}
#endregion

#region Bedrooms

function goto_room_bedroom(){
	fade_room(rm_bedroom_after_class1);
	set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);

	ChatterboxLoadFromFile("room_1.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1.yarn");
	ChatterboxJump(chatterbox, "after_class1");
	
	// Change background to night
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id, spr_hostelnight_bars);
}

function goto_room_bedroom_after_class2(){
	fade_room(rm_bedroom_after_class1);
	set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);

	ChatterboxLoadFromFile("room_2_after_class2.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("room_2_after_class2.yarn");
	ChatterboxJump(chatterbox, "after_class2");
	
	// Change background to night
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id, spr_hostelnight_bars);
}

function goto_room_bedroom_after_cca(){
	fade_room(rm_bedroom_after_cca1);
	set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);
	
	ChatterboxLoadFromFile("room_1_after_cca.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1_after_cca.yarn");
	ChatterboxJump(chatterbox, "0");
}

function goto_room_bedroom_frombed() {
	fade_room(room, false);
	obj_player.x = 30;
	obj_player.y = 74;
	obj_player.facing_direction = 1;
	ChatterboxJump(chatterbox, "0");
	
	// Change background to day
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id, spr_hostel_bars);
}

function goto_room_bedroom_afterHangout(){
	fade_room(rm_bedroom_after_class1);
	set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);

	ChatterboxLoadFromFile("room_1_after_hangout.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1_after_hangout.yarn");
	ChatterboxJump(chatterbox, "1");
}
#endregion

#region CCA1
	function goto_room_cca_1(){
		fade_room(rm_cca_1);
		set_player_position(X_CCA_DOOR, Y_HEIGHT, 1)
	
		ChatterboxLoadFromFile("cca_1.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("cca_1.yarn");
		ChatterboxJump(chatterbox, "1");
	}

	function goto_room_cca_1_seated(){
		fade_room(rm_cca_1_seated);
		obj_player.x = X_CCA_SEATED;
		obj_player.y = Y_HEIGHT;
		obj_player.facing_direction = 1;
		obj_player.is_sitting = true;
	
		ChatterboxJump(chatterbox, "5");
	}

	function goto_room_cca_1_seated_18() {
		fade_room(rm_cca_1_seated_18);
	}

	function goto_room_cca_1_seated_11() {
		fade_room(rm_cca_1_seated_11);
	}
	
	function goto_room_cca_2(){
		fade_room(rm_cca_1);
		set_player_position(X_CCA_DOOR, Y_HEIGHT, 1)
	
		ChatterboxLoadFromFile("cca_2.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("cca_2.yarn");
		ChatterboxJump(chatterbox, "1");
	}
#endregion

#region Hangouts
	function goto_room_hangout_a() {
		fade_room(rm_hangout_a);
		set_player_position(X_HANGOUT_DOOR, Y_HEIGHT, 1);
	
		ChatterboxLoadFromFile("hangout_anthony.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_anthony.yarn");
		ChatterboxJump(chatterbox, "0");
	}
	
	function goto_room_hangout_n() {
		fade_room(rm_hangout_n);
		set_player_position(X_HANGOUT_DOOR, Y_HEIGHT, 1);
	
		ChatterboxLoadFromFile("hangout_nadia.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_nadia.yarn");
		ChatterboxJump(chatterbox, "0");
	}
	
	function goto_room_hangout_v() {
		fade_room(rm_hangout_v);
		set_player_position(X_HANGOUT_DOOR, Y_HEIGHT, 1);
	
		ChatterboxLoadFromFile("hangout_vera.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_vera.yarn");
		ChatterboxJump(chatterbox, "0");
	}

#endregion

#region Boss
	function goto_room_boss_1() {
		fade_room(rm_house_sister);
		set_player_position(X_HOUSE_DOOR, Y_HEIGHT_NOTEXT, 1);
		
		ChatterboxLoadFromFile("boss_1.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("boss_1.yarn");
		ChatterboxJump(chatterbox, "0");
	}
	
	// More like pan the camera
	function set_camera_boss1() {
		// TODO: Animate a pan somehow... I dont know why it doesnt work
		camera_set_view_pos(view_camera[0], 144, 0);
	}
	
	function goto_black_room() {
		fade_room(rm_black_screen);	
	}
	
	function goto_room_bedroom_after_boss1(){
	fade_room(rm_bedroom_after_cca1);
	set_player_position(X_BEDROOM_DOOR, Y_HEIGHT, -1);
	
	ChatterboxLoadFromFile("room_2.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("room_2.yarn");
	ChatterboxJump(chatterbox, "0");
}
#endregion
