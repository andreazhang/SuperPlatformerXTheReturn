/// @description enemy movement

vertical_speed += enemy_gravity

//Check horizontal collision with walls
if place_meeting(x+horizontal_speed, y, object_wall){
	while !place_meeting(x+sign(horizontal_speed), y, object_wall) {
		x += sign(horizontal_speed)
	}
	horizontal_speed = -horizontal_speed
}

//Check vertical collision with ground (wall)
if place_meeting(x, y+vertical_speed, object_wall){
	while !place_meeting(x, y+sign(vertical_speed), object_wall) {
		y += sign(vertical_speed)
	}
	vertical_speed = 0
}

//enemy movement
x += horizontal_speed
y += vertical_speed

//Animation
if !place_meeting(x, y+1, object_wall) {
	sprite_index = sprite_enemy_jump_right
	image_speed = 0
	if (sign(vertical_speed)) image_index = 16 else image_index = 11
} else {
	image_speed = 1
	if (horizontal_speed == 0) {
		sprite_index = sprite_enemy
	} else {
		sprite_index = sprite_enemy_walk_right
	}
}

if (horizontal_speed != 0) image_xscale = sign(horizontal_speed)
