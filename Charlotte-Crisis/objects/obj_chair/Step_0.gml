/// @description Insert description here
// You can write your code in this editor

// interact with vera
if (!obj_player.is_talking) {
	
if (keyboard_check_pressed(vk_space) && place_meeting(x,y,obj_player)) {
	obj_chatterbox_control.chatterbox_set("5");
}
}




