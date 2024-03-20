/// @description Draw the stat menu

// This is where the stat menu background will be printed. Everything else is relative
var _x_origin = room_width/2;
var _y_origin = 32;

draw_sprite(spr_stat_menu_bg, -1, _x_origin, _y_origin);

// Draw the three bars
var _x_bar_starting = _x_origin - 8;
var _y_bar_starting = _y_origin + 22;
var _y_bar_margin = 16;

// Repeat for each row (0: INT, 1: CHA, 2: EMP)
for (var i = 0; i < 3; i++) {
	var _y_bar_current = _y_bar_starting + (i * _y_bar_margin);
	draw_stat_bar(_x_bar_starting, _y_bar_current, (current_option == i), stats_array[i]);
}

// Draw the confirmation button
var _x_confirm = _x_origin - 15;
var _y_confirm = _y_bar_starting + (3 * _y_bar_margin);
draw_sprite(spr_confirm_button, (current_option == 3), _x_confirm, _y_confirm);