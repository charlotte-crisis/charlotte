/// @description Check for player spacebar.

// interact with vera
if (!obj_player.is_talking) {
	if (keyboard_check_pressed(vk_up) && place_meeting(x,y,obj_player)) {
		obj_chatterbox_control.chatterbox_set(node);
		indicator.visible = false;
	}
}












