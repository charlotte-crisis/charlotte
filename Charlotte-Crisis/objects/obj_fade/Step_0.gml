/// @description Fade timer
// You can write your code in this editor
 
// Fade entering
if (state == 0) {
	timer++;
	
	if (timer >= FADE_DURATION) {
		if (change_room) {
			room_goto(target_room);
		}
		state = 1;
	}
// Fade exit
} else if (state == 1) {
	timer--;
	
	if (timer <= 0) {
		instance_destroy();	
	}
}

alpha = timer/FADE_DURATION;













