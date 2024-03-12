/// @description Insert description here
// You can write your code in this editor

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