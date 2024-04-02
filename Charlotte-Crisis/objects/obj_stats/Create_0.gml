/// @description Initialise and destroy multiple instances
// If there is more than 1 of this persistent object,
// Destroy it!
if instance_number(object_index) > 1{
    instance_destroy();
    exit;
}

// Confidence works like health
confidence = 50;
threshold = 30; // Below this, considered unconfident

// Priamry stats
intelligence = 2;
charisma = 2;
empathy = 2;

// XP
experience = 150;
// amount of XP needed to level up
level_up_amount = 50;

// Gender Meter
// lets say its a scale from 0 to 100.
gender_meter = 50;

//					  Week 1   Week 2   Week 3
// The current stage (0 1 2 3, 4 5 6 7, 8 9 10 11)
stage = 0;

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
	
	is_low_confidence = function() {
		return (confidence < threshold);	
	}
	
	// Returns the value of the stat if debuffed or not
	stat_after_debuff = function(_stat) {
		// If zero then all stats are set to 1
		if (confidence <= 0) {
			return 1;	
		}
		return (confidence < threshold) ? _stat / 2 : _stat;	
	}
	
	get_stage = function() {
		return stage;	
	}
	
	increment_stage = function() {
		return ++stage;	
	}
#endregion