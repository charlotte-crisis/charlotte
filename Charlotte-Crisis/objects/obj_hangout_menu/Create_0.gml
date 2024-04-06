/// @description Insert description here
// You can write your code in this editor
select_row = 0;
select_col = 0;

// 1-indexed
MAX_ROW = 2;
MAX_COL = 4;

npc_sprites =
[
	[spr_cj_portrait, spr_s_portrait, spr_j_portrait],
	[spr_a_portrait,  spr_v_portrait, spr_n_portrait]
]

npc_names = 
[
	["Chenjie", "Sage", "Joanne"],
	["Anthony", "Vera", "Nadia"],
]

characters = 
[
	["CJ", "S", "J"],
	["A", "V", "N"]
];

goto_functions = 
[
	[goto_room_hangout_cj, goto_room_hangout_s, goto_room_hangout_j],
	[goto_room_hangout_a,  goto_room_hangout_v, goto_room_hangout_n]
]