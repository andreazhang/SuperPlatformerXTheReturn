/// @description Insert description here
// You can write your code in this editor

if hp <= 0 {
	with instance_create_layer(x, y, "Enemy", object_enemy_dead){
		direction = other.hit_direction
		
		horizontal_speed = lengthdir_x(3, direction)
		vertical_speed = lengthdir_y(3, direction)
		if sign(horizontal_speed != 0) image_xscale = sign(horizontal_speed)
	}
	
	instance_destroy()
}