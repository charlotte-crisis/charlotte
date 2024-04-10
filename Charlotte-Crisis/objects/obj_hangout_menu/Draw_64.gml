/// @description Draw the gui itself
// You can write your code in this editor
#macro PORTRAIT_SCALE 3

draw_set_font(fnt_body);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _x_origin = view_wport[0]/2; // Draw it a little to the right
var _y_origin = 120; // 32 * 3.75

draw_sprite_ext(spr_relationship_menu_bg, 0, _x_origin, _y_origin, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);

// Draw the char portrait
var _y_start = _y_origin + 70;
var _y_portrait = _y_start + 25;
var _y_relationship_offset = 50;

var _y_margin = 140;

var _x_start = _x_origin - 306 + 60; // half width of the menu + padding of 45
var _x_margin = 130;
var _x_relationship_offset = 50;

for (var row = 0; row < MAX_ROW; row++) {
	var _y_row = _y_start + (_y_margin * row);
	for (var col = 0; col < MAX_COL - 1; col++) {
		var _color = c_dkgray;
		if ((select_col == col) && (select_row == row)) {
			
			if (obj_npc_relationships.get_relationship(characters[select_row][select_col]) < rs_threshold)
			or (ChatterboxGetVisited("0", yarn_files[select_row][select_col])) {
				_color = c_dkgray;
			} else {
				_color = c_white;
			}
		}
		var _x_col = _x_start + (_x_margin * col);
		
		var current_portrait_alpha = 1;
		if (row == select_row) && (col == select_col) {
			current_portrait_alpha = portrait_alpha	
		}
		
		draw_sprite_ext(npc_sprites[row][col], 0, 
				_x_col, _y_row, 
				PORTRAIT_SCALE, PORTRAIT_SCALE, 
				0, _color, current_portrait_alpha);		
		draw_sprite_ext(spr_portrait_bg, 1, _x_col, _y_row, PORTRAIT_SCALE, PORTRAIT_SCALE, 0, c_white, 1);		
		
		var _rs = obj_npc_relationships.get_relationship_level(characters[row][col]);
		draw_sprite_ext(spr_relationship_level, _rs, _x_col + _x_relationship_offset,
				_y_row + _y_relationship_offset,
				2, 2, 0, c_white, 1);
	}
}

// Draw the right buttons
var _x_col = _x_start + (_x_margin * 3);
var _y_row = _y_start;
draw_sprite_ext(spr_button_icon_blue, (select_col == MAX_COL - 1 && select_row == 0), _x_col, _y_row, PORTRAIT_SCALE, PORTRAIT_SCALE, 0, c_white, 1);		

_y_row = _y_start + _y_margin;
draw_sprite_ext(spr_button_icon_red, (select_col == MAX_COL - 1 && select_row == 1), _x_col, _y_row, PORTRAIT_SCALE, PORTRAIT_SCALE, 0, c_white, 1);		

var _speech = "";

if (select_col == MAX_COL - 1) {
	_speech = select_row ? "Do not hang out with anyone this week. (continue to next scene)"
			: "Cancel selection. (go back to room)";
} else {
	var _rs = obj_npc_relationships.get_relationship(characters[select_row][select_col]);
	if (_rs < rs_threshold) {
		_speech = string("Not on good terms with {0}. (Relationship level: {1}%)",
				npc_names[select_row][select_col],
				_rs);
	} else if (ChatterboxGetVisited("0", yarn_files[select_row][select_col])) {
		_speech = string("You have already hung out with {0}.", npc_names[select_row][select_col]);
	} else { // Good enough relationship
		_speech = string("Ask {0} to hang out? (Relationship level: {1}%)",
				npc_names[select_row][select_col],
				_rs);
	}
}
draw_dialogue(_speech);



