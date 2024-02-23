/// @description Open menu
// You can write your code in this editor

if (obj_player.can_move()) {
	if (keyboard_check_pressed(vk_up) && place_meeting(x,y,obj_player)) {
		instance_create_layer(x, y, "Helpers", obj_clothing_menu);
		obj_player.set_is_interacting(true);
		indicator.visible = false;
	}
}

