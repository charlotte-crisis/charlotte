/// @description Jump to node
// Chatterbox will jump to node if the player interacts.
// See variable definitions.

if (!obj_player.is_talking) {
	if (keyboard_check_pressed(vk_space) && place_meeting(x,y,obj_player)) {
		obj_chatterbox_control.chatterbox_set(node);
	}
}
