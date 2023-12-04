/// @description Insert description here
// You can write your code in this editor

ChatterboxLoadFromFile("cca_1.yarn");
ChatterboxAddFunction("bg", background_set_index);
chatterbox = ChatterboxCreate();
ChatterboxJump(chatterbox, "CCA_1");
chatterbox_update();

option_index = 0;

size = [0.7, 0.75];
colour = [c_ltgray, c_white];


obj_Player.set_is_talking(true);