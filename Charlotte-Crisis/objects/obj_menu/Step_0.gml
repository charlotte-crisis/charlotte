/// @description Insert description here
// You can write your code in this editor

// Select
if (keyboard_check_pressed(vk_space)) {
	if (select_row == 0) {
		fade_room(rm_bedroom_menu);	
	}

}

var _up_down_key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
select_row = wrap(select_row + _up_down_key, 0, MAX_ROW - 1);