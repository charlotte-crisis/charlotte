/// @description Initialise variables
// You can write your code in this editor
if instance_number(object_index) > 1 {
    instance_destroy();
    exit;
}

horizontal_speed = 0;
vertical_speed = 0;
grav = 0; //Using grv instead of built-in gravity variable
walk_speed = 2;
jump_speed = 2;

key_left = 0;
key_right = 0;
key_jump = 0;

is_talking = false;
is_interacting = false;
is_sitting = false;

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

get_player_clothes = function() {
	return current_clothes;	
}

get_player_gender = function() {
	return gender;
}

// Return true only if not talking and not interacting.
can_move = function() {
	return !(is_talking || is_interacting || instance_exists(obj_fade));	
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
gender = 1;

// Top bottom shoes
current_clothes = [1, 0, 2] // zero indexed

// 0: Idle, 1: Sit, 2: Walk
// In order of drawing layer

leg_sprites = [
	spr_mc_female_idle_4_3,
	spr_mc_female_sit_4_3,
	spr_mc_female_walking_4_3,
];
top_sprites = [
	spr_mc_female_idle_3_2,
	spr_mc_female_sit_3_2,
	spr_mc_female_walking_3_2,
];
head_sprites = [
	spr_mc_female_idle_2_1,
	spr_mc_female_sit_2_1,
	spr_mc_female_walking_2_1,
];
bottom_sprites = [
	spr_mc_female_idle_1_1,
	spr_mc_female_sit_1_1,
	spr_mc_female_walking_1_1,
];

/// @function set_player_sprites(_gender, _top, _bottom, _shoes);
/// @description Change the player's sprites based on the outfit and gender.
/// @param {Real} _gender	The player's gender presentation (Affects head)
/// @param {Real} _top		Top outfit
/// @param {Real} _bottom	Pants outfit
/// @param {Real} _shoes	Shoes outfit
set_player_sprites = function(_gender, _top, _bottom, _shoes) {
	head_sprites = get_head_sprites(_gender);
	top_sprites = get_top_sprites(_gender, _top);
	bottom_sprites = get_bottom_sprites(_gender, _bottom);
	leg_sprites = get_leg_sprites(_gender, _shoes);
	gender = _gender;
	
	// set it in chatterbox itself
	ChatterboxVariableSet("name", (_gender?"Charlotte":"Charles"));
}

#endregion