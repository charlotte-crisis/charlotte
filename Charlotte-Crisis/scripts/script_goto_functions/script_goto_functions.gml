/// @description Door functions

/// @function fade_room(_room, _duration, _colour)
/// @param _room The target room to move to
function fade_room(_room) {
	// Create fade object at top left corner at highest depth
	var _inst = instance_create_depth(0, 0, 0, obj_fade);
	_inst.target_room = _room;
}

#region Classroom Gotos
function goto_room_class_1(){
	fade_room(rm_class_1);
	
	// room_goto(rm_class_1);
	obj_player.x = 296;
	obj_player.y = 74;
	obj_player.facing_direction = -1;
	
	// Need to load then create.
	ChatterboxLoadFromFile("class_1.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("class_1.yarn");
	ChatterboxJump(chatterbox, "1");
}

function goto_room_class_1_seated(){
	room_goto(rm_class_1_seated);
	obj_player.x = 223;
	obj_player.y = 74;
	obj_player.facing_direction = 1;
	obj_player.is_sitting = true;
	
	ChatterboxJump(chatterbox, "5");
}

function goto_room_class_1_discussion() {
	room_goto(rm_class_1_discussion);
	obj_player.x = 203;
	obj_player.y = 75;
	obj_player.facing_direction = -1;
	obj_player.is_sitting = true;
}

#endregion

#region Bus Gotos
function goto_room_bus(){
	room_goto(rm_bus);
	obj_player.x = 223;
	obj_player.y = 74;
	obj_player.facing_direction = -1;
	obj_player.is_sitting = false;
	
	ChatterboxJump(chatterbox, "12_alone");
}

function goto_room_bus_cj(){
	room_goto(rm_bus_cj);
	obj_player.x = 223;
	obj_player.y = 74;
	obj_player.facing_direction = -1;
	obj_player.is_sitting = false;
}

function goto_room_bus_j(){
	room_goto(rm_bus_j);
	obj_player.x = 223;
	obj_player.y = 74;
	obj_player.facing_direction = -1;
	obj_player.is_sitting = false;
}

function goto_room_bus_s(){
	room_goto(rm_bus_s);
	obj_player.x = 223;
	obj_player.y = 74;
	obj_player.facing_direction = -1;
	obj_player.is_sitting = false;
}
#endregion

#region goto Bedrooms
function goto_room_bedroom(){
	room_goto(rm_bedroom_1);
	obj_player.x = 230;
	obj_player.y = 74;
	obj_player.facing_direction = -1;
	obj_player.is_sitting = false;
	
	ChatterboxLoadFromFile("room_1.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1.yarn");
	ChatterboxJump(chatterbox, "after_class1");
}

function goto_room_bedroom_after_cca(){
	room_goto(rm_bedroom_1_after_cca);
	obj_player.x = 30;
	obj_player.y = 74;
	obj_player.facing_direction = 1;
	obj_player.is_sitting = false;
	
	ChatterboxLoadFromFile("room_1_after_cca.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("room_1_after_cca.yarn");
	ChatterboxJump(chatterbox, "0");
}

function goto_room_bedroom_frombed() {
	obj_player.x = 30;
	obj_player.y = 74;
	obj_player.facing_direction = 1;
	ChatterboxJump(chatterbox, "0");
}
#endregion

#region CCA1
function goto_room_cca_1(){
	room_goto(rm_cca_1);
	obj_player.x = 46;
	obj_player.y = 74;
	obj_player.facing_direction = 1;
	obj_player.is_sitting = false;
	
	ChatterboxLoadFromFile("cca_1.yarn");
	obj_chatterbox_control.chatterbox = ChatterboxCreate("cca_1.yarn");
	ChatterboxJump(chatterbox, "1");
}


function goto_room_cca_1_seated(){
	room_goto(rm_cca_1_seated);
	obj_player.x = 112;
	obj_player.y = 74;
	obj_player.facing_direction = 1;
	obj_player.is_sitting = true;
	
	ChatterboxJump(chatterbox, "5");
}

function goto_room_cca_1_seated_18() {
	room_goto(rm_cca_1_seated_18);
}

function goto_room_cca_1_seated_11() {
	room_goto(rm_cca_1_seated_11);
}

#endregion

#region hangouts
	function goto_room_hangout_a() {
		room_goto(rm_hangout_a);
		obj_player.x = 159;
		obj_player.y = 74;
		obj_player.facing_direction = 1;
		obj_player.is_sitting = false;
	
		ChatterboxLoadFromFile("hangout_anthony.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_anthony.yarn");
		ChatterboxJump(chatterbox, "0");
	}
	
	function goto_room_hangout_n() {
		room_goto(rm_hangout_n);
		obj_player.x = 159;
		obj_player.y = 74;
		obj_player.facing_direction = 1;
		obj_player.is_sitting = false;
	
		ChatterboxLoadFromFile("hangout_nadia.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_nadia.yarn");
		ChatterboxJump(chatterbox, "0");
	}
	
	function goto_room_hangout_v() {
		room_goto(rm_hangout_v);
		obj_player.x = 159;
		obj_player.y = 74;
		obj_player.facing_direction = 1;
		obj_player.is_sitting = false;
	
		ChatterboxLoadFromFile("hangout_vera.yarn");
		obj_chatterbox_control.chatterbox = ChatterboxCreate("hangout_vera.yarn");
		ChatterboxJump(chatterbox, "0");
	}

#endregion