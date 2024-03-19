/// @description Scripts relating to DRAWING SPRITES on GUI

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
	draw_sprite_ext(spr_dialogue_box, 0, view_wport[0]/2, view_hport[0], 3.75, 3.75, 0, c_white, 1);
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

/// @function get_speaker_sprite(String name)
/// @param name {String} Name of speaker
/// @return {Asset.GMSprite} Sprite
function draw_speaker_portrait(name) {
	var sprite_x = 32;
	var sprite_y = view_hport[0] - 128;
	var sprite_xscale = 3;
	var sprite_yscale = 3;
	// Do comparisons only in uppercase.
	name = string_upper(name);
	if (name != "YOU") && (name != "") {
		draw_rectangle(32, view_hport[0] - 128, 128, view_hport[0] - 33, false);
	}
	switch (name) {
		case "TUTORIAL":
			draw_sprite_ext(spr_tutorial_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "ANTHONY":
			draw_sprite_ext(spr_a_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "CHENJIE":
			draw_sprite_ext(spr_cj_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);			
			break;
		case "ELEANOR":
			draw_sprite_ext(spr_e_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "HELEN":
			draw_sprite_ext(spr_h_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "JOANNE":
			draw_sprite_ext(spr_j_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "PROF LIM":
			draw_sprite_ext(spr_l_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "NADIA":
			draw_sprite_ext(spr_n_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "SAGE":
			draw_sprite_ext(spr_s_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "SISTER":
			draw_sprite_ext(spr_si_portrait, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
		case "VERA":
			draw_sprite_ext(V_Portraits, 0, sprite_x, sprite_y, sprite_xscale, sprite_yscale, 0, c_white, 1);
			break;
	}
}