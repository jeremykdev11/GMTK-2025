/// @description Insert description here
// You can write your code in this editor

boardX = 64;
boardY = 288;

#region function
// wallAmount is the percentage of tiles to turn into walls
refresh = function(_wallAmount = 10) 
{
	with (obj_tileSpawner) instance_destroy();
	for (var _i = 0; _i < BOARD_WIDTH; _i++)
	{
		for (var _j = 0; _j < BOARD_HEIGHT; _j++)
		{
			instance_create_layer(_i * TILE_SIZE + boardX, _j * TILE_SIZE + boardY, 
			layer, obj_tileSpawner, {wallPercent: _wallAmount});
		}
	}
}
#endregion

refresh(10);