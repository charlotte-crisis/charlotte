///@description return array of sprites
/// in order [idle, sit, walk]
	
function get_head_sprites(_gender) {
	male_sprites = [
		spr_mc_male_idle_2_1,
		spr_mc_male_sit_2_1,
		spr_mc_male_walking_2_1
	];
	
	female_sprites = [
		spr_mc_female_idle_2_1,
		spr_mc_female_sit_2_1,
		spr_mc_female_walking_2_1
	];

	return (_gender) ? female_sprites : male_sprites;
}

function get_top_sprites(_gender, _top) {
	male_top_sprite_sets = [
		[spr_mc_male_idle_3_1, spr_mc_male_sit_3_1, spr_mc_male_walking_3_1],
		[spr_mc_male_idle_3_2, spr_mc_male_sit_3_2, spr_mc_male_walking_3_2],
		[spr_mc_male_idle_3_3, spr_mc_male_sit_3_3, spr_mc_male_walking_3_3],
	];

	female_top_sprite_sets = [
		[spr_mc_female_idle_3_1, spr_mc_female_sit_3_1, spr_mc_female_walking_3_1],
		[spr_mc_female_idle_3_2, spr_mc_female_sit_3_2, spr_mc_female_walking_3_2],
		[spr_mc_female_idle_3_3, spr_mc_female_sit_3_3, spr_mc_female_walking_3_3],
	];

	return (_gender) ? female_top_sprite_sets[_top] : male_top_sprite_sets[_top];
}

function get_bottom_sprites(_gender, _bottom) {
	male_bottom_sprite_sets = [
		[spr_mc_male_idle_1_1, spr_mc_male_sit_1_1, spr_mc_male_walking_1_1],
		[spr_mc_male_idle_1_2, spr_mc_male_sit_1_2, spr_mc_male_walking_1_2],
		[spr_mc_male_idle_1_3, spr_mc_male_sit_1_3, spr_mc_male_walking_1_3],
	];

	female_bottom_sprite_sets = [
		[spr_mc_female_idle_1_1, spr_mc_female_sit_1_1, spr_mc_female_walking_1_1],
		[spr_mc_female_idle_1_2, spr_mc_female_sit_1_2, spr_mc_female_walking_1_2],
		[spr_mc_female_idle_1_3, spr_mc_female_sit_1_3, spr_mc_female_walking_1_3],
	];

	return (_gender) ? female_bottom_sprite_sets[_bottom] : male_bottom_sprite_sets[_bottom];
}

function get_leg_sprites(_gender, _leg) {
	male_leg_sprite_sets = [
		[spr_mc_male_idle_4_1, spr_mc_male_sit_4_1, spr_mc_male_walking_4_1],
		[spr_mc_male_idle_4_2, spr_mc_male_sit_4_2, spr_mc_male_walking_4_2],
		[spr_mc_male_idle_4_3, spr_mc_male_sit_4_3, spr_mc_male_walking_4_3],
	];

	female_leg_sprite_sets = [
		[spr_mc_female_idle_4_1, spr_mc_female_sit_4_1, spr_mc_female_walking_4_1],
		[spr_mc_female_idle_4_2, spr_mc_female_sit_4_2, spr_mc_female_walking_4_2],
		[spr_mc_female_idle_4_3, spr_mc_female_sit_4_3, spr_mc_female_walking_4_3],
	];

	return (_gender) ? female_leg_sprite_sets[_leg] : male_leg_sprite_sets[_leg];
}