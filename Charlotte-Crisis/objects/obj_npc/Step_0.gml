/// @description Insert description here
// You can write your code in this editor
if (!obj_player.is_talking) {
	if (place_meeting(x,y,obj_player)) {
		indicator.visible = true;
	} else {
		indicator.visible = false;	
	}
}






