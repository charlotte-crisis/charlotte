/// @description Draw the stat menu
/// It is placed in Draw end to put over everything else.

// This is where the stat menu background will be printed. Everything else is relative
var _x_origin = room_width/2;
var _y_origin = 32;

draw_sprite(spr_stat_menu_bg, -1, _x_origin, _y_origin);

// Draw the three bars
var _x_bar_starting = _x_origin - 8;
var _y_bar_starting = _y_origin + 22;
var _y_bar_margin = 16;

// x coordinates for left and right arrow.
var _x_bar_left_arrow = _x_bar_starting - 8;
var _x_bar_right_arrow = _x_bar_starting + 41;

var _x_stat_icons = _x_origin - 44;
var _y_stat_icons_starting = _y_origin + 12;

// Repeat for each row (0: INT, 1: CHA, 2: EMP)
for (var i = 0; i < 3; i++) {
	var _y_bar_current = _y_bar_starting + (i * _y_bar_margin);
	draw_stat_bar(_x_bar_starting, _y_bar_current, (current_option == i), stats_array[i]);
	
	// Draw arrow for selected row
	// and draw the icon
	if (current_option == i) {
		// Arrows
		if (stats_array[i] > 0) {
			draw_sprite(spr_ui_left, -1, _x_bar_left_arrow, _y_bar_current);
		}
		if !((levels <= 0) || (stats_array[i] >= 9)) {
			draw_sprite(spr_ui_right, -1, _x_bar_right_arrow, _y_bar_current);	
		}
		
		// Icon
		var _y_stat_icon_current = _y_stat_icons_starting + (i * _y_bar_margin);
		draw_sprite(spr_stat_icons, i, _x_stat_icons, _y_stat_icon_current);
	}
}

// Draw the confirmation button
var _x_confirm = _x_origin - 15;
var _y_confirm = _y_bar_starting + (3 * _y_bar_margin);
draw_sprite(spr_confirm_button, (current_option == 3), _x_confirm, _y_confirm);