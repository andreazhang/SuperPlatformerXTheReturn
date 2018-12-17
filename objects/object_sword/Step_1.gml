/// @description Update sword position

// Update sword position on player hand
x = object_player.x - 2
y = object_player.y + 6

// Update sword angle based on cursor
image_angle = point_direction(x, y, mouse_x, mouse_y)

// FIRE!!!
delay--
recoil = max(0, recoil-1)
if mouse_check_button(mb_left) && delay < 0 {
	recoil = 4
	delay = 5
	
	with instance_create_layer(x, y, "Projectile", object_sword_projectile){
		speed = 15
		direction = other.image_angle + random_range(-3, 3)
		image_angle = direction
	}
}

x += lengthdir_x(recoil, image_angle)
y += lengthdir_y(recoil, image_angle)

if image_angle > 90 && image_angle < 270 {
	image_yscale = -1
} else {
	image_yscale = 1
}