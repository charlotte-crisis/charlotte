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


if (is_open) {
	var _up_down_key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	select_row = wrap(select_row + _up_down_key, 0, MAX_ROW);
	
	if (keyboard_check_pressed(vk_space)) {
		if (select_row == 0) {
			obj_player.set_is_interacting(false);
			is_open = false;	
		} else if (select_row == 2) { //exit
			save_game();
			obj_player.set_is_interacting(false);
			is_open = false;
			fade_room(rm_main_menu,,, function() {
				// get rid of EVERYTHING
				instance_destroy(obj_chatterbox_control);
				obj_player.visible = false;
				instance_destroy(obj_stats);
				instance_destroy(); // self	
			});
		}
	}
}