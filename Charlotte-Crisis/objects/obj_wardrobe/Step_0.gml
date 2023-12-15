/// @description Insert description here
// You can write your code in this editor

// interact with vera
if (obj_player.can_move()) {
	if (keyboard_check_pressed(vk_space) && place_meeting(x,y,obj_player)) {
		clothes_selection = true;
		// set it so player can't move
		obj_player.set_is_interacting(true);
	}
}

// exit out of menu
if (clothes_selection == true && keyboard_check_pressed(vk_escape)) {
	clothes_selection = false;
	obj_player.set_is_interacting(false);
}

// navigate menu
if (clothes_selection == true) {
	if (keyboard_check_pressed(vk_up)) {
		select_row = wrap(select_row - 1, 0, 2)	
	}
	
	if (keyboard_check_pressed(vk_down)) {
		select_row = wrap(select_row + 1, 0, 2)	
	}
	
	if (keyboard_check_pressed(vk_left)) {
		select_col = wrap(select_col - 1, 0, 2)	
	}
	
	if (keyboard_check_pressed(vk_right)) {
		select_col = wrap(select_col + 1, 0, 2)	
	}
}





