/// @description Destroy multiple instances
// If there is more than 1 of this persistent object,
// Destroy it!
if instance_number(object_index) > 1{
    instance_destroy();
    exit;
}


// Create stats
charisma = 0;
intelligence = 0;

