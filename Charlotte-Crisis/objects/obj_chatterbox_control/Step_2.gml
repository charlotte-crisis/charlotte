/// @description Insert description here
// You can write your code in this editor

// End conversation.
// Put in end step so that player won't accidentally start conversation while ending.
if (ChatterboxIsStopped(chatterbox)) {
	obj_player.set_is_talking(false);
	previous_dialogue = "";
//	instance_destroy();
}




