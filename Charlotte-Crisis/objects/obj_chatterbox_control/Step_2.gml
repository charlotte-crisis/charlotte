/// @description Insert description here
// You can write your code in this editor

// End conversation.
// Put in end step so that player won't accidentally start conversation while ending.
if (ChatterboxIsStopped(chatterbox)) {
	obj_Player.set_is_talking(false);
//	instance_destroy();
}




