// close
if (keyboard_check_pressed(vk_escape)) {
	if (is_open) {
		obj_player.set_is_interacting(false);
		is_open = false;
	} else {
		obj_player.set_is_interacting(true);
		is_open = true;	
	}
}