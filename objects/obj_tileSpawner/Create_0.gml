/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

// Chance to spawn wall, else pick a random tile sprite

if (irandom(100) < wallPercent)
{
	if (place_meeting(x, y, obj_player))
	{
		instance_create_layer(x, y, layer, obj_wall);
		instance_destroy();
	}
}

sprite_index = spr_tiles;
image_index = irandom(8);