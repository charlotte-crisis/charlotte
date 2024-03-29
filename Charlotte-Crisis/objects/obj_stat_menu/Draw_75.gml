/// @description Insert description here
// You can write your code in this editor

// Draw the amount left
// Has to be in Draw GUI because of the font size
draw_set_valign(fa_top); // Set text align middle
draw_set_halign(fa_center);
draw_set_font(fnt_mono);
var _x_origin = view_wport[0]/2;
var _y_origin = 120;

var _y_text = _y_origin + 40; // Roughly 10*3.75
draw_text(_x_origin, _y_text, string("Points available: {0}", levels));

// Draw labels (has to be this size instead of being scaled up, sadly

// Draw the three bars
var _x_bar_starting = _x_origin - 136; // agaration
var _y_bar_starting = _y_origin + 80; // roughly 22 * 3.75
var _y_bar_margin = 60; // roughly 16 * 3.75

draw_sprite_ext(spr_label_int, (current_option == 0), _x_bar_starting, _y_bar_starting, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_label_cha, (current_option == 1), _x_bar_starting, _y_bar_starting + _y_bar_margin, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_label_emp, (current_option == 2), _x_bar_starting, _y_bar_starting + _y_bar_margin * 2, 1, 1, 0, c_white, 1);


// Put this here because somehow something is drawing over it.
// draw description

var _instruction = "\n\nUp and Down to select. Left and Right to allocate stats.";
var _description = "";
switch (current_option) {
	case 0:
		_description = "Intellect [INT]: Helps you become (or appear to be) knowledgeable and logical." + _instruction;
		break;
	case 1:
		_description = "Charisma [CHA]: Enhances your ability to read the room and charm people accordingly." + _instruction;
		break;
	case 2:
		_description = "Empathy [EMP]: Truly understand what people feel and connect to them on a deeper level." + _instruction;
		break;
	case 3:
		_description = "Press Spacebar to confirm your stat allocations. Escape to cancel and discard changes.";
		break;
}

draw_dialogue(_description);