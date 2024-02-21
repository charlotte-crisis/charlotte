/// @description Initialise and destroy multiple instances
// If there is more than 1 of this persistent object,
// Destroy it!
if instance_number(object_index) > 1{
    instance_destroy();
    exit;
}

// Confidence works like health
confidence = 50;

// Priamry stats
intelligence = 2;
charisma = 2;
empathy = 2;

// XP
experience = 150;
// amount of XP needed to level up
level_up_amount = 50;

// Gender Meter
// lets say its a scale from 1 to 100.
gender = 50;

#region SETTERS AND GETTERS
/// @return ARRAY
get_stats = function() {
	return [intelligence, charisma, empathy]	
}

get_number_of_levels = function() {
	return floor(experience/level_up_amount);	
}

set_stats = function(_stat_array) {
	intelligence = _stat_array[0];	
	charisma = _stat_array[1];
	empathy = _stat_array[2];
}

subtract_experience = function(_levels) {
	experience -= _levels * level_up_amount;	
}
#endregion