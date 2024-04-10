/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_body);
draw_set_color(c_white);

draw_text(view_wport[0]/2, view_hport[0]/2, CREDITS);

if (keyboard_check_pressed(vk_space)) {
	save_game();
	obj_player.set_is_interacting(false);
	fade_room(rm_main_menu,,, function() {
		// get rid of EVERYTHING
		instance_destroy(obj_chatterbox_control);
		obj_player.visible = false;
		instance_destroy(obj_stats);
		instance_destroy(); // self. Probably not needed.
	});
}