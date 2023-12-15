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
is_interacting = false;

#region Functions to alter stats and other stuff
set_is_talking = function(_is_talk) {
	is_talking = _is_talk;
}

set_is_interacting = function(_is_interact) {
	is_interacting = _is_interact;
}

set_gender = function(_gender) {
	gender = _gender;
}

// Return true only if not talking and not interacting.
can_move = function() {
	return !(is_talking || is_interacting);	
}

#endregion

#region Sprite and Gender presentation related.

/*
	Direction the player is facing, or last moved towards.	
	img_frame: The current frame the sprite is on.
	num_of_frames: to wrap img_frame around based on number of total frames.
*/
facing_direction = 1;
img_frame        = 0;
num_of_frames    = 8;

/*
	The clothings being chosen will be reflected here.
	Gender Binary
	0: Male
	1: Female
*/
gender = 0;

idle_torso     = [spr_mc_male_idle_torso,     spr_mc_female_idle_torso];
idle_legs      = [spr_mc_male_idle_legs,      spr_mc_female_idle_legs];
idle_shorts    = [spr_mc_male_idle_shorts,    spr_mc_female_idle_shorts];
idle_head      = [spr_mc_male_idle_head,      spr_mc_female_idle_head];

walking_torso  = [spr_mc_male_walking_torso,  spr_mc_female_walking_torso];
walking_legs   = [spr_mc_male_walking_legs,   spr_mc_female_walking_legs];
walking_shorts = [spr_mc_male_walking_shorts, spr_mc_female_walking_shorts];
walking_head   = [spr_mc_male_walking_head,   spr_mc_female_walking_head];

#endregion