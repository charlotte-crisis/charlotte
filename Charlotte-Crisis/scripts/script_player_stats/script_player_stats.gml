// To be used in Chatterbox.
// Note that Yarn/Chatterbox values are given as an array.
function set_player_gender(_gender) {
	obj_player.set_gender(_gender[0]);
}

#region stats,confidence, and experience
// TODO: Separate obj_player functions and obj_stats functions
function add_empathy() {
	obj_stats.empathy += 1;
	return;
}

function add_charisma() {
	obj_stats.charisma += 1;
	return;
}

function add_intelligence() {
	obj_stats.intelligence += 1;
	return;
}

#endregion