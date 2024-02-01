// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goto_room_class_1(){
	room_goto(rm_class_1);
	obj_player.x = 296;
	obj_player.y = 74;
	ChatterboxLoadFromFile("class_1.yarn");
	ChatterboxJump(chatterbox, "0");
}