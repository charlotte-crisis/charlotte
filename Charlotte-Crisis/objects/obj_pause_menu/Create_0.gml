/// @description Insert description here
// You can write your code in this editor
is_open = false;

// 2 rows
// 3 cols
characters = [
	["CJ", "S", "J"],
	["A", "V", "N"]
];

character_sprites = [
	[spr_cj_portrait, spr_s_portrait, spr_j_portrait],
	[spr_a_portrait, spr_v_portrait, spr_n_portrait]
]

/// @return {Real} 2 if good, 1 if neutral, 0 if bad\
/// 0 - 30 Bad
/// 31 - 69 Neutral
/// 70 - 100 Good
function get_relationship_threshold(_rs) {
	if (_rs >= 70) {
		return 2;	
	} else if (_rs > 30) {
		return 1;	
	} else {
		return 0;	
	}
}