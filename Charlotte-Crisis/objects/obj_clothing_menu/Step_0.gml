/// @description Controls
// You can write your code in this editor

// cancel
if (keyboard_check_pressed(vk_escape)) {
	obj_player.set_is_interacting(false);
	instance_destroy(self);
}

// confirm choices
if ((select_row == 3) && (keyboard_check_pressed(vk_space))) {
	obj_player.set_is_interacting(false);
	instance_destroy(self);
}

var _up_down_key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
select_row = wrap(select_row + _up_down_key, 0, 3); // from 0 to 3

var _left_right_key = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
if (select_row < 3) {
	var _current_selected = current_clothes[select_row];
	_current_selected = wrap(_current_selected + _left_right_key, 0, 5); // from 0 to 5... number of clothes
	current_clothes[select_row] = _current_selected;
}
