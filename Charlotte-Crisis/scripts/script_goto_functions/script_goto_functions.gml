// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goto_room_class_1(){
	room_goto(rm_class_1);
	obj_player.x = 296;
	obj_player.y = 74;
	
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