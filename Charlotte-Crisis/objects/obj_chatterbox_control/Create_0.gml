/// @description Insert description here
// You can write your code in this editor

ChatterboxLoadFromFile("cca1.yarn");
chatterbox = ChatterboxCreate();
ChatterboxJump(chatterbox, "1");
chatterbox_update();

option_index = 0;

size = [0.7, 0.75];
colour = [c_ltgray, c_white];


obj_Player.set_is_talking(true);

function chatterbox_set(_node_name) {
	ChatterboxJump(chatterbox, _node_name);
	chatterbox_update();
	obj_Player.set_is_talking(true);
}