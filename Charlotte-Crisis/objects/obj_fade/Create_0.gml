/// @description Insert description here
// You can write your code in this editor

FADE_DURATION = 10;     // 60 steps = 1 sec or so
FADE_COLOUR = c_black;  // colour of fade

change_room = true;		// set to false if there is no room change needed
target_room = room;		// To be set by function call
callback = function() {
	// do nothing
	show_debug_message("Callback");
	return;
};

// variables
timer = 0;
alpha = 0;
state = 0;

