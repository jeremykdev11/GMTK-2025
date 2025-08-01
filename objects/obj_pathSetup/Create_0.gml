/// @desc Create Motion Planning Grid

// Create grid
global.grid = mp_grid_create(
	TILE_SIZE / 2,
	TILE_SIZE / 2,
	(room_width / TILE_SIZE) - 1,
	(room_height / TILE_SIZE) - 1,
	TILE_SIZE,
	TILE_SIZE
);

// Add wall objects to grid
mp_grid_add_instances(global.grid, obj_wall, true);