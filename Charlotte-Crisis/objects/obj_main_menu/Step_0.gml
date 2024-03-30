/// @description Insert description here
// You can write your code in this editor

// Select
if (keyboard_check_pressed(vk_space)) {
	_pressed_spacebar = 0;
	timer=0;
	
	if (select_row == 0) {
		fade_room(rm_bedroom_menu);	
	}
	
	// Open/Close help
	if (showing_help) {
		showing_help = false;	
	} else if (select_row == 2) {
		showing_help = true;	
	}
	
	// Open/Close credits 
	if (showing_credits) {
		showing_credits = false;	
	} else if (select_row == 3) {
		showing_credits = true;	
	}
}

var _up_down_key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
if !(showing_help || showing_credits) {
	select_row = wrap(select_row + _up_down_key, 0, MAX_ROW - 1);
}

if (_pressed_spacebar < 3) {
	timer++;
	_pressed_spacebar += timer/10;
}
