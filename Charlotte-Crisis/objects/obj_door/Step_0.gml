/// @description Insert description here
// You can write your code in this editor


// If player is not talking and presses up
if (!obj_player.is_talking) {
	if (place_meeting(x,y,obj_player) && keyboard_check_pressed(vk_up)) {
			obj_chatterbox_control.chatterbox_set("2");
	}
}








