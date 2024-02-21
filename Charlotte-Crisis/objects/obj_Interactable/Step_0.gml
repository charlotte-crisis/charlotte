/// @description Jump to node
// Chatterbox will jump to node if the player interacts.
// See variable definitions.

if (obj_player.can_move()) {
	if (place_meeting(x,y,obj_player)) {
		indicator.visible = true;
	} else {
		indicator.visible = false;	
	}
}

