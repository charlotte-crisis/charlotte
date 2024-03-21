/// @description Insert description here
// You can write your code in this editor

// When colliding with this, start the talking.
if (place_meeting(x, y, obj_player)) {
	obj_chatterbox_control.chatterbox_set("1");	
	instance_destroy();
}