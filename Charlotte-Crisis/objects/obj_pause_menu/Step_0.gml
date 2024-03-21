// close
if (keyboard_check_pressed(vk_escape)) {
	obj_player.set_is_interacting(false);
	instance_destroy(self);
}