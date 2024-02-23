/// @description Menu Navigation
// You can write your code in this editor

// Row 0: Name
// Row 1, 2, 3: Clothes
// Row 4: Confirm
select_row = 1; // Set to 1 so when player interacts, it moves up to 0.
MAX_ROW = 4;

// Top, Bottom, Shoes
// Currently 3 each
MAX_CLOTHES = 3;
current_clothes = [1, 1, 1];

// 0: male
// 1: female
current_gender = 1;
//current_clothes = get_current_clothes();

clothing_top = [ // Layer 3
	[
		spr_male_top_1,
		spr_male_top_2,
		spr_male_top_3
	],
	[
		spr_female_top_1,
		spr_female_top_2,
		spr_female_top_3
	]
];

clothing_bottoms = [ // Layer 1
	[
		spr_male_bottoms_1,
		spr_male_bottoms_2,
		spr_male_bottoms_3,
	],
	[
		spr_female_bottoms_1,
		spr_female_bottoms_2,
		spr_female_bottoms_3,
	]
];

clothing_shoes = [ // Layer 4
	[
		spr_male_shoes_1,
		spr_male_shoes_2,
		spr_male_shoes_3,
	],	
	[
		spr_female_shoes_1,
		spr_female_shoes_2,
		spr_female_shoes_3,
	]
];