/// @description Insert description here
// You can write your code in this editor

speech = "Rise and shine. Time to go to class.\n";
speech += "Left and Right arrow keys to move. ";
speech += "Press Up arrow key to interact with objects, "
speech += "and Spacebar to interact with dialogue. "
speech += "Press Escape to open the pause menu."

select_row = 0;
MAX_ROW = 4;

BUTTON_LABELS = ["NEW GAME", "CONTINUE", "INSTRUCTIONS", "CREDITS"];

showing_help = false;
showing_credits = false;

_pressed_spacebar = 3;
_timer_spacebar = 0;

_pressed_up = 3;
_timer_up = 0;

_pressed_down = 3;
_timer_down = 0;