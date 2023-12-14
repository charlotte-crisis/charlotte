/// @description Insert description here
// You can write your code in this editor
if instance_number(object_index) > 1{
    instance_destroy();
    exit;
}
ChatterboxLoadFromFile("cca1.yarn");
chatterbox = ChatterboxCreate();
ChatterboxJump(chatterbox, "1");
chatterbox_update();

ChatterboxAddFunction("setGender", set_player_gender); 

option_index = 0;

size = [0.7, 0.75];
colour = [c_ltgray, c_white];


obj_player.set_is_talking(true);

function chatterbox_set(_node_name) {
	ChatterboxJump(chatterbox, _node_name);
	chatterbox_update();
	obj_player.set_is_talking(true);
}