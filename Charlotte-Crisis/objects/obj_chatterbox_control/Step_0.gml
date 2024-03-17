/// @description Insert description here
// You can write your code in this editor
if (obj_player.is_talking) {
	var _count = ChatterboxGetOptionCount(chatterbox);

	if (ChatterboxIsWaiting(chatterbox) && keyboard_check_pressed(vk_space)) {
		chatterbox_store_previous_speech();
		ChatterboxContinue(chatterbox);
		chatterbox_update();
	} else if (_count) {
		var _key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
		// TODO: This only repeats up to two times. Means if you have
		// 2 unavailable options it will not select it. Thx.
		repeat(1 + 
				(ChatterboxGetOptionConditionBool(
				chatterbox, wrap(option_index + _key, 0, _count - 1)) == false)) {
			option_index = wrap(option_index + _key, 0, _count - 1);
		}
	
		if keyboard_check_pressed(vk_space) {
			ChatterboxSelect(chatterbox, option_index);
			option_index = 0;
			chatterbox_update();
		}
		
	// only debug
	} else if (ChatterboxIsWaiting(chatterbox) && keyboard_check_pressed(vk_enter)) {
		ChatterboxFastForward(chatterbox);
		chatterbox_update();
	}
}