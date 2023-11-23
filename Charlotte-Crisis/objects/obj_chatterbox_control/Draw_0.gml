/// @description Draw text from Chatterbox.

// Margin of text from left and right. 
// Base it off of room width.
var _margin_text = room_width * 0.1;
var _margin_char = 200;



draw_set_font(font_body);
draw_set_valign(fa_middle);

if (IsChatterbox(chatterbox) && text != undefined) {
	var _me = (speaker == "Player");
	var _narrator = (speaker == "Narrator");
	// draw_sprite_ext(characters, 0, _margin_char,				 room_height, size[_me], size[_me], 0, colour[_me], 1);
	// draw_sprite_ext(characters, 1, room_width - _margin_char, room_height, size[!_me], size[!_me], 0, colour[!_me], 1);
	
	var _yy = room_height - (_margin_text / 2);
	
	draw_rectangle_center(room_width / 2, _yy, room_width, _margin_text, false, c_black, 0.5);
	
	draw_set_halign((_me || _narrator) ? fa_left : fa_right);
	var _xx = (_me || _narrator) ? _margin_text : room_width - _margin_text;
	
	draw_text_ext(_xx, _yy, text, 15, room_width - 2 * _margin_text);
	
	if (ChatterboxGetOptionCount(chatterbox)) {
		draw_set_halign(fa_center);
		
		// Text box width and height
		var _width = room_width * 0.6;
		var _height = 50;
		
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if (ChatterboxGetOptionConditionBool(chatterbox, i)) {
				_xx = room_width / 2;
				_yy = (room_height / 8) * (i + 3);
				
				draw_rectangle_center(_xx, _yy, _width, _height, false, c_black, 0.5);
				
				var _icon = "";
				if (option_index == i) {
					_icon = "> ";	
				}
				var _option = ChatterboxGetOption(chatterbox, i);
				
				draw_text(_xx, _yy, _icon + _option);
				
			}
		}
	}
}






