/// @description Initialise variables
// You can write your code in this editor

horizontal_speed = 0;
vertical_speed = 0;
grav = 0.1; //Using grv instead of built-in gravity variable
walk_speed = 2;
jump_speed = 2;

key_left = 0;
key_right = 0;
key_jump = 0;

is_talking = false;

set_is_talking = function(_is_talk) {
	is_talking = _is_talk;
}

// keep track of the direction the player is facing, or last moved towards.
facing_direction = 1;

img_frame = 0;