/// @description Draw menu
// You can write your code in this editor
var _x_origin = view_wport[0]/2 + 128; // Draw it a little to the right
var _y_origin = 120; // 32 * 3.75

/// Left Hand and HEADER variables
var _x_text_starting = _x_origin - 250; // 60 * 3.75
var _y_text_starting = _y_origin + 45;  // 12 * 3.75

var _y_gender_meter = _y_origin + 240;  // MASSIVE agaration

/// Right Hand Side variables
var _x_row_starting = _x_origin - 20; // 8px * 3.75 // Make it between 22 to 30
var _y_row_starting = _y_origin + 110; // 32 * 3.75

var _x_colsize = 90; // Roughly 23 * 3.75
var _y_rowsize = 120; // 32 * 3.75

var portrait_scale = 2.25;	// Scale smaller rather than 3.75
var _emote_offset = 27;		// 12 * 3.75
var _text_y_offset = -25;   // This is for character portraits btw

var _left_menu_x = _x_text_starting - 125;
var _left_menu_y = _y_text_starting;
var _left_menu_margin = 25;
var selected = [c_gray, c_white];

if (is_open) {
	
	/// Draw the left menu
	draw_set_color(selected[select_row == 0]);
	draw_text(_left_menu_x, _left_menu_y, "CONTINUE");
	draw_set_color(selected[select_row == 1]);
	draw_text(_left_menu_x, _left_menu_y + _left_menu_margin, "HELP");
	draw_set_color(selected[select_row == 2]);
	draw_text(_left_menu_x, _left_menu_y + _left_menu_margin * 2, "EXIT");
	draw_set_color(c_white);
	
	if (select_row == 1) { // Help
		draw_help_menu(_x_origin, _y_origin);
	} else if (select_row == 2) { // Exit
		draw_sprite_ext(spr_relationship_menu_bg, -1, _x_origin, _y_origin, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
		draw_text(_x_text_starting, _y_text_starting, "Press SPACE to save and quit to menu.");
	} else {
		draw_set_font(fnt_mono);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
	
		// Draw background
		draw_sprite_ext(spr_relationship_menu_bg, -1, _x_origin, _y_origin, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	
		///=== LEFT HAND SIDE ===///
		// Using the script from script_player_stats
		draw_text(_x_text_starting, _y_text_starting, "NAME \n" + get_name());
	
		var _room = get_room_name(get_stage());
		draw_text(_x_text_starting, _y_text_starting + 64, "STAGE \n" + _room);
	
		draw_text(_x_text_starting, _y_text_starting + 128, "GENDER METER \n" + string("{0}%", get_gender_meter()));
	
		draw_sprite_ext(spr_UI_gendermeter, 0, _x_text_starting, _y_gender_meter, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
		var _offset = (get_gender_meter() / 100) * 50 * VIEWPORT_SCALE;
		draw_sprite_ext(spr_UI_gendermeter_point, 0, _x_text_starting + _offset, _y_gender_meter, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	
		///=== RIGHT HAND SIDE ===///
		draw_text(_x_row_starting, _y_text_starting, "RELATIONSHIPS");
		// Draw the characters
		for (var row = 0; row < 2; row++) {
			for (var col = 0; col < 3; col++) {
				var curr_x = _x_row_starting + (col * _x_colsize);
				var curr_y = _y_row_starting + (row * _y_rowsize);
		
				// Person
				draw_sprite_ext(character_sprites[row][col], -1, curr_x, curr_y,
						portrait_scale, portrait_scale, 0, c_white, 1);
				
				// Names
				draw_text(curr_x, curr_y + _text_y_offset, character_names[row][col]);
					
				// Foreground Frame
				draw_sprite_ext(spr_portrait_bg, 1, curr_x, curr_y,
						portrait_scale, portrait_scale, 0, c_white, 1);
			
				// Get character relationship
				var _rs = obj_npc_relationships.get_relationship_level(characters[row][col]);
				// Emote
				draw_sprite_ext(spr_relationship_level, _rs, curr_x + _emote_offset, curr_y + _emote_offset,
						portrait_scale, portrait_scale, 0, c_white, 1);		
			}
		}

		}
}