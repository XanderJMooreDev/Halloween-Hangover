// This event triggers if we collide with the wolf scratch hitbox. We get destroyed if we're stunned and destroy
// the hitbox either way. 

instance_destroy(other);

if stunType != "None" {
	instance_destroy();
}