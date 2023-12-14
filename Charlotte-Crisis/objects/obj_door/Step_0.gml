/// @description Insert description here
// You can write your code in this editor


// If player is not talking and presses up
if (!obj_player.is_talking) {
	if (place_meeting(x,y,obj_player) && keyboard_check(vk_up)) {
		
		
		switch(room) {
			case rm_bedroom:
				room_goto(rm_class);
				obj_player.x = 69;
				obj_player.y = 36;
			break;
			
			case rm_class:
				room_goto(rm_bedroom);
				obj_player.x = 181;
				obj_player.y = 38;
			break;
		}
	}
}








