/// @description Skip to the end of a given yarn file. For debug purposes only.

/// Wont do anything if you are not in a skippable location
if (ChatterboxSourceNodeExists(ChatterboxGetCurrentSource(chatterbox),"debug_end")) {
	chatterbox_set("debug_end");	
}

