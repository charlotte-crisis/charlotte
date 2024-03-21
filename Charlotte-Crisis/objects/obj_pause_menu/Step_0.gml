// close
if (keyboard_check_pressed(vk_escape)) {
	if (is_open) {
		obj_player.set_is_interacting(false);
		is_open = false;
		
	// Only if not interacting with anything else
	// But OK to pause while chatting.
	} else if !(obj_player.is_interacting) {
		obj_player.set_is_interacting(true);
		is_open = true;	
	}
}