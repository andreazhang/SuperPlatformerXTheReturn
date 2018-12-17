/// @description Player movement
//Player Input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"))
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"))
key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"))

//Movement calculation
var movement = key_right - key_left

horizontal_speed = movement * walk_speed

vertical_speed += player_gravity

//Check jump from ground

if place_meeting(x, y+1, object_wall) && key_jump{
	vertical_speed = -5
}

//Check horizontal collision with walls
if place_meeting(x+horizontal_speed, y, object_wall){
	while !place_meeting(x+sign(horizontal_speed), y, object_wall) {
		x += sign(horizontal_speed)
	}
	horizontal_speed = 0
}

//Check vertical collision with ground (wall)
if place_meeting(x, y+vertical_speed, object_wall){
	while !place_meeting(x, y+sign(vertical_speed), object_wall) {
		y += sign(vertical_speed)
	}
	vertical_speed = 0
}

//Player movement
x += horizontal_speed
y += vertical_speed

//Animation
if !place_meeting(x, y+1, object_wall) {
	sprite_index = sprite_player_jump_right
	image_speed = 0
	if (sign(vertical_speed)) image_index = 16 else image_index = 11
} else {
	image_speed = 1
	if (horizontal_speed == 0) {
		sprite_index = sprite_player
	} else {
		sprite_index = sprite_player_walk_right
	}
}

if (horizontal_speed != 0) image_xscale = sign(horizontal_speed)
