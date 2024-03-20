/// @description Insert description here
// You can write your code in this editor

// Draw the amount left
// Has to be in Draw GUI because of the font size
draw_set_valign(fa_top); // Set text align middle
draw_set_halign(fa_center);
draw_set_font(fnt_mono);
var _x_origin = view_wport[0]/2;
var _y_text = 160; // Roughly (32 + 12)*3.75
draw_text(_x_origin, _y_text, string("Points available: {0}", levels));

// Put this here because somehow something is drawing over it.
// draw description

var _description = "";
switch (current_option) {
	case 0:
		_description = "Intellect. Helps you become (or appear to be) knowledgeable and logical.";
		break;
	case 1:
		_description = "Charisma. Enhances your ability to read the room and charm people accordingly.";
		break;
	case 2:
		_description = "Empathy. Truly understand what people feel and connect to them on a deeper level.";
		break;
	case 3:
		_description = "Press Spacebar to confirm your stat allocations. Escape to cancel and discard changes.";
		break;
}

draw_text_box(_description);