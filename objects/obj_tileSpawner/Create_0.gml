/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
image_xscale = choose(-1, 1);

// Chance to spawn wall, else pick a random tile sprite

if (irandom(100) < wallPercent && !playerSpawn)
{

		var _struct = {view: false};
		
		if place_meeting(x, y - TILE_SIZE, obj_tileSpawner) 
		{
			_struct = {view: true};
		}
		
		instance_create_layer(x, y, layer, obj_wall, _struct);
		instance_destroy();	
		

} 
else 
{
	sprite_index = spr_tiles;
	image_index = irandom(8);
}