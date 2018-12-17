/// @description enemy hit

with other {
	hp--
	flash = 3
	hit_direction = other.direction
}

instance_destroy()
