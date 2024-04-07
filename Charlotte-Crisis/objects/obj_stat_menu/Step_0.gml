/// @description Insert description here
// You can write your code in this editor

// cancel
if (keyboard_check_pressed(vk_escape)) {
	io_clear(); // disallow escape to trigger anything else
	obj_player.set_is_interacting(false);
	instance_destroy(self);
}

// confirm choices
if ((current_option == 3) && (keyboard_check_pressed(vk_space))) {
	obj_stats.set_stats(stats_array);
	obj_stats.subtract_experience(levels_used);
	obj_player.set_is_interacting(false);
	set_chatterbox_stats();
	instance_destroy(self);
}

var _up_down_key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

current_option = wrap(current_option + _up_down_key, 0, 3); // from 0 to 3

// Left pressed only: -1
// Right pressed only: 1
var _left_right_key = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

// 0 to 2
if (current_option < 3) {
	// Left key pressed. Reduce the stat
	if (_left_right_key == -1) {
		var _stat_amount = stats_array[current_option];
		
		// Do not go into negative stats
		if (_stat_amount > 0) {
			stats_array[current_option] -= 1;
			levels += 1;
			levels_used -= 1;
		}
	}
	
	// Right key pressed
	if (_left_right_key == 1) {
		// only allow level up if enough levels and stat isn't maxed out alr
		if (levels > 0) && (stats_array[current_option] < 9) {
			stats_array[current_option] += 1;
			levels -= 1;
			levels_used += 1;
		}
	}

}