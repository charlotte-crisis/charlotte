/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape)) {
	if(relationships_menu_open) {
		obj_player.set_is_interacting(false);
		relationships_menu_open = false;
	} else {
		obj_player.set_is_interacting(true);
		relationships_menu_open = true;
	}
}