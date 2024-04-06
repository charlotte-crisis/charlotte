/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape)) {
	obj_player.set_is_interacting(false);
	instance_destroy(self);	
}

var _up_down_key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
select_row = wrap(select_row + _up_down_key, 0, MAX_ROW - 1);

var _left_right_key = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
select_col = wrap(select_col + _left_right_key, 0, MAX_COL - 1);

if (keyboard_check_pressed(vk_space)) {
	if (select_col == MAX_COL - 1) {
		if (select_row == 0) {
			// cancel
			obj_player.set_is_interacting(false);
			instance_destroy(self);
		} else if (select_row == 1) {
			// skip to next scene
		}
	} else {
		obj_player.set_is_interacting(false);
		script_execute(goto_functions[select_row][select_col]);
		instance_destroy(self); // might not be needed as it's not persistent.
	}
}