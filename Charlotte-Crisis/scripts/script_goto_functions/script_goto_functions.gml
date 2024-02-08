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
	obj_player.y = 73;
	obj_player.facing_direction = 1;
	obj_player.is_sitting = true;
	
	ChatterboxJump(chatterbox, "5");
}

function goto_room_bus_cj(){
	room_goto(rm_bus_cj);
	obj_player.x = 223;
	obj_player.y = 73;
	obj_player.facing_direction = -1;
	obj_player.is_sitting = false;
	
	ChatterboxJump(chatterbox, "13");
}