/// @description Controls
// You can write your code in this editor

// cancel
if (keyboard_check_pressed(vk_escape)) {
	obj_player.set_is_interacting(false);
	instance_destroy(self);
}

// confirm choices
if ((select_row == MAX_ROW) && (keyboard_check_pressed(vk_space))) {
	obj_player.set_player_sprites(current_gender,
			current_clothes[0], current_clothes[1], current_clothes[2]);
	obj_player.set_is_interacting(false);
	instance_destroy(self);
}

var _up_down_key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
select_row = wrap(select_row + _up_down_key, 0, MAX_ROW); // from 0 to 4

var _left_right_key = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

if ((select_row > 0) && (select_row < MAX_ROW)) {
	// change outfit
	var _current_selected = current_clothes[select_row - 1]; //offset one as rows 1:3 -> [0:2]
	_current_selected = wrap(_current_selected + _left_right_key, 0, MAX_CLOTHES - 1); // offset index
	current_clothes[select_row - 1] = _current_selected;
} else if (select_row == 0) {
	// name choose
	current_gender = wrap(current_gender + _left_right_key, 0, 1); //
}
