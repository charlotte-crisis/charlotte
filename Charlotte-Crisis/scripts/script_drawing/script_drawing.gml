/// @description Scripts relating to DRAWING SPRITES on GUI
#macro VIEWPORT_SCALE 3.75

// Left aligned dialogue
// includes dialogue box and speech
function draw_dialogue(_speech, _is_italic=false) {
	draw_dialogue_box();
	
	if (_is_italic) {
		draw_set_font(fnt_body_italic);
	} else {
		draw_set_font(fnt_body);
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	var _padding_horizontal = view_wport[0] * 0.1875; // very specific binary number
	var _linesep = 25;
	
	// width of text box. based on paddding so just change padding to change this.
	var _width = view_wport[0] - (2 * _padding_horizontal);
	
	var _text_yy = view_hport[0] - (sprite_get_height(spr_dialogue_box) - 10) * VIEWPORT_SCALE; 
	//32px from the top of box scaled
		
	draw_text_ext(_padding_horizontal, _text_yy, _speech, _linesep, _width);
	
	draw_set_font(fnt_body); // Clean up
}

/// For very simple drawing without interaction.
function draw_text_box(_speech){
	draw_set_font(fnt_body);
	draw_set_halign(fa_center); // Text center-aligned
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	var _margin_text = view_wport[0] * 0.1;
	var _xx = view_wport[0] / 2; //middle of the screen
	var _margin_char = 200;
	var _linesep = 25;
	var _yy = view_hport[0] - (_margin_text / 2);
	var _text_yy = view_hport[0] - (_margin_text) - 16;

	draw_dialogue_box();
	//draw_rectangle_center(view_wport[0] / 2, _yy, view_wport[0], _margin_text * 2, false, c_dkgray, 1);

	draw_text_ext(_xx, _text_yy, _speech, _linesep, view_wport[0] - 2 * _margin_text);	
}

/// @function get_mc_sprite(_gender, _layer, _outfit)
function get_mc_sprite(_gender, _layer, _outfit) {
	return spr_mc_0_idle_0_1;	
}

/// Note that dialogue box and option box are centered as well.
/// So co-ordinates are same as draw_rectangle_center
function draw_dialogue_box() {
	draw_sprite_ext(spr_dialogue_box, 0, view_wport[0]/2, view_hport[0],
			VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
}

/// Skillcheck false by default
/// Selected 0 (frame 0) or 1 (frame 1)
function draw_option_box(_x, _y, _selected, _skillcheck=false) {
	if (_skillcheck) {
		draw_sprite_ext(spr_option_red, _selected, _x, _y, 3.75, 3.75, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_option_blue, _selected, _x, _y, 3.75, 3.75, 0, c_white, 1);
	}
}

/// @function draw_speaker_portrait(String name)
/// @param name {String} Name of speaker
/// @description Draw a portrait if it's a valid speaker.
function draw_speaker_portrait(name) {
	var sprite_x = 8 * VIEWPORT_SCALE;
	var sprite_y = view_hport[0] - (sprite_get_height(spr_dialogue_box) + 4) * VIEWPORT_SCALE;
	// Do comparisons only in uppercase.
	name = string_upper(name);
	// Do not draw if narrator
	var _can_draw = true // (name != "YOU") && (name != ""); 
	var _sprite_to_draw;
	switch (name) {
		case "DEBUG":
		case "TIP":
		case "TUTORIAL":
			_sprite_to_draw = spr_tutorial_portrait;
			break;
		case "ANTHONY":
			_sprite_to_draw = spr_a_portrait;
			break;
		case "CHENJIE":
			_sprite_to_draw = spr_cj_portrait;
			break;
		case "ELEANOR":
		case "NEW GIRL":
			_sprite_to_draw = spr_e_portrait;
			break;
		case "HELEN":
			_sprite_to_draw = spr_h_portrait;
			break;
		case "JOANNE":
			_sprite_to_draw = spr_j_portrait;
			break;
		case "PROF LIM":
			_sprite_to_draw = spr_l_portrait;
			break;
		case "NADIA":
			_sprite_to_draw = spr_n_portrait;
			break;
		case "SAGE":
			_sprite_to_draw = spr_s_portrait;
			break;
		case "SISTER":
			_sprite_to_draw = spr_si_portrait;
			break;
		case "VERA":
			_sprite_to_draw = spr_v_portrait;
			break;
		case "CHARLOTTE":
			_sprite_to_draw = spr_charlotte_portrait;
			break;			
		case "MOTHER":
			_sprite_to_draw = spr_m_portrait;
			break;
		default:
			_can_draw = false; // If it's none of the above, means no sprite, don't draw.
	}
	
	
	if (_can_draw) {
		// Background
		draw_sprite_ext(spr_portrait_bg, 0, sprite_x, sprite_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
		// The sprite itself
		draw_sprite_ext(_sprite_to_draw, 0, sprite_x, sprite_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
		// Overlay
		draw_sprite_ext(spr_portrait_bg, 1, sprite_x, sprite_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	}
}

/// @description Draw the diceroll sprite as a portrait.
/// @param _value Should be a dice value ranging from 1 to 6.
function draw_diceroll_portrait(_value) {
	var sprite_x = 8 * VIEWPORT_SCALE;
	var sprite_y = view_hport[0] - (sprite_get_height(spr_dialogue_box) + 4) * VIEWPORT_SCALE;
	
	draw_sprite_ext(spr_portrait_bg, 0, sprite_x, sprite_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	// The sprite itself
	draw_sprite_ext(spr_dice, _value - 1, sprite_x, sprite_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	// Overlay
	draw_sprite_ext(spr_portrait_bg, 1, sprite_x, sprite_y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
}

#region Stat menu
	/// @description Draw a singular stat bar
	/// To be used in draw step, not Draw GUI
	/// 
	/// @param _xx
	/// @param _yy
	/// @param _selected		Whether this bar is currently being selected (highlighted)
	/// @param _amount_filled	The amount of stats filled in the bar (max 9)
	function draw_stat_bar(_xx, _yy, _selected, _amount_filled) {
		// draw the background bar
		draw_sprite(spr_stat_bar, _selected, _xx, _yy);
	
		// draw as many filled in squares as needed
		for (var i = 0; i < _amount_filled; i++) {
			var _xx_current = _xx + (sprite_get_width(spr_stat_filled) * i); // Increment X based on stat bar size
			if (i == 8) { //ninth element
				draw_sprite(spr_stat_filled_end, _selected, _xx_current, _yy);
			} else {
				draw_sprite(spr_stat_filled, _selected, _xx_current, _yy);
			}
		}
	}

#endregion

/// All relative to x and y, which are top centre of the menu
function draw_help_menu(_x, _y) {
	var _pad = 45;
	var _bg_width = 615; // 164 * 3.75
	// Draw BG
	draw_sprite_ext(spr_relationship_menu_bg, -1, _x, _y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	
	var _inst_controls = "Controls:\n Arrow keys to move/select\n Up to interact\n Space to advance dialogue\n Esc to pause";
	var _inst_relation = "Relationships:\n Choose wisely when you talk to NPCs. You may have a Good, Neutral, or Bad relationship.";
	var _inst_skills   = "Skill Checks:\n Some dialogue (in red) are skill checks. The stat needed and threshold to beat are prefixed, for e.g., [CHA 8]\n";
	_inst_skills += "You will roll a 6-sided die and its result will be added to your CHA stat. The sum, if equal or greater than 8, will succeed."
	
	draw_set_font(fnt_body);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	var _yy = _y + _pad;
	var _sep = 25;
	var _width = _bg_width/2 - _pad;
	
	var _x_topleft = _x - _bg_width/2 + _pad;
	
	// Draw top left corner
	draw_text_ext(_x_topleft, _yy, _inst_controls, _sep, _width);
	
	draw_set_color(c_yellow);
	draw_text_ext(_x_topleft, _yy, "Controls:", _sep, _width);
	draw_set_color(c_white);
	
	var _x_topright = _x;
	// Draw top right corner
	draw_text_ext(_x_topright, _yy, _inst_relation, _sep, _width);
	
	draw_set_color(c_yellow);
	draw_text_ext(_x_topright, _yy, "Relationships:", _sep, _width);
	draw_set_color(c_white);
	
	// Draw bottom
	_width = _bg_width - (2*_pad);
	var _y_bottom = _yy + _pad/2 + string_height(_inst_controls);
	draw_text_ext(_x_topleft, _y_bottom, _inst_skills, _sep, _width);
	
	draw_set_color(c_yellow);
	draw_text_ext(_x_topleft, _y_bottom, "Skill Checks:", _sep, _width);
	draw_set_color(c_white);
}

/// All relative to x and y, which are top centre of the menu
function draw_credits(_x, _y) {
	var _pad = 70;
	var _bg_width = 615; // 164 * 3.75
	// Draw BG
	draw_sprite_ext(spr_relationship_menu_bg, -1, _x, _y, VIEWPORT_SCALE, VIEWPORT_SCALE, 0, c_white, 1);
	
	var _credits = "The Charlotte Crisis is a game done for a Communications and New Media practice-based honours thesis.\n";
	_credits += "\n";
	_credits += "Writer, Designer, Producer: Jiayu\n";
	_credits += "Artist, Writer: Nicole\n";
	_credits += "Designer, Programmer: Zhan Hong\n";
	_credits += "Supervisor: Tan Kai En\n";
	
	
	var _yy = _y + _pad;
	var _sep = 25;
	var _width = _bg_width - (_pad * 2);
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_ext(_x, _y + _pad, _credits, _sep, _width);	
}