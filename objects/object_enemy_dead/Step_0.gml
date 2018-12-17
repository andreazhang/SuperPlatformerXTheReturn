/// @description 

if done == 0 {
	vertical_speed += enemy_gravity

	//Check horizontal collision with walls
	if place_meeting(x+horizontal_speed, y, object_wall){
		while !place_meeting(x+sign(horizontal_speed), y, object_wall) {
			x += sign(horizontal_speed)
		}
		horizontal_speed = 0
	}

	//Check vertical collision with ground (wall)
	if place_meeting(x, y+vertical_speed, object_wall){
		if vertical_speed > 0 {
			done = 1
			//image_index = 8
		}
		while !place_meeting(x, y+sign(vertical_speed), object_wall) {
			y += sign(vertical_speed)
		}
		vertical_speed = 0
	}

	//enemy movement
	show_debug_message(horizontal_speed)
	x += horizontal_speed
	y += vertical_speed
}