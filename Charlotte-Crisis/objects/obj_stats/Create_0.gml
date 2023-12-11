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
charisma = 3;
intelligence = 3;
empathy = 3;

// XP
experience = 0;

// Gender Meter
// lets say its a scale from 1 to 100.
gender = 50;

// instance method or script better?
// TODO: create script or something
add_empathy = function() {
	empathy += 1;
	return;
}