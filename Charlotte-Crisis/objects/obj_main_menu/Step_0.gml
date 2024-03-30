/// @description Insert description here
// You can write your code in this editor

// Select

var _space = keyboard_check_pressed(vk_space);
var _esc = keyboard_check_pressed(vk_escape);

if (_space) {
	// Reset animation
	_pressed_spacebar = 0;
	_timer_spacebar = 0;
	
	
	if (select_row == 0) { // New game
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

if (_esc) { // Allow esc to exit these 2 menus too
	// Open/Close help
	if (showing_help) {
		showing_help = false;	
	}
	
	// Open/Close credits 
	if (showing_credits) {
		showing_credits = false;	
	}
}

var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);

// Iterate menu
var _up_down_key = _down - _up;
if !(showing_help || showing_credits) {
	select_row = wrap(select_row + _up_down_key, 0, MAX_ROW - 1);
}

if (_up) {
	_pressed_up = 0;
	_timer_up = 0;
}

if (_down) {
	_pressed_down = 0;
	_timer_down = 0;
}

#region timers
if (_pressed_spacebar < 3) {
	_timer_spacebar++;
	_pressed_spacebar += _timer_spacebar/10;
}

if (_pressed_up < 3) {
	_timer_up++;
	_pressed_up += _timer_up/10;
}

if (_pressed_down < 3) {
	_timer_down++;
	_pressed_down += _timer_down/10;
}
