/// @desc Enemy Management Setup

#region Pathfinding Grid

gridX = TILE_SIZE / 2;
gridY = TILE_SIZE / 2;
gridWidth = (room_width / TILE_SIZE) - 1;	// # of cells wide
gridHeight = (room_height / TILE_SIZE) - 1; // # of cells tall

// Create motion planning grid
global.grid = mp_grid_create(gridX, gridY, gridWidth, gridHeight, TILE_SIZE, TILE_SIZE);

// Set/reset grid
ResetGrid();

function ResetGrid()
{
	mp_grid_clear_all(global.grid);
	mp_grid_add_instances(global.grid, obj_wall, true);
}

#endregion

#region Enemy Control

function MoveAllEnemies()
{
	// Set position of all enemies to "forbidden"
	mp_grid_add_instances(global.grid, obj_enemy, true);
	
	// Get array of enemies
	var _enemyNum = instance_number(obj_enemy);
	var _enemyArray = array_create(_enemyNum);
	for (var i = 0; i < _enemyNum; i++)
	{
		_enemyArray[i] = instance_find(obj_enemy, i);
	}
	
	// Move enemies individually
	for (var i = 0; i < _enemyNum; i++)
	{
		with (_enemyArray[i])
		{
			// Clear position from being "forbidden"
			var _curCellPos = WorldToGrid(x, y);
			mp_grid_clear_cell(global.grid, _curCellPos.x, _curCellPos.y);
			
			// Move
			MoveEnemy();
			
			// After moving, set new cell to "forbidden"
			var _newCellPos = WorldToGrid(targetPos.x, targetPos.y);
			mp_grid_add_cell(global.grid, _newCellPos.x, _newCellPos.y);
		}
	}
	
	// Reset grid to clear forbidden cells
	ResetGrid();
}

#endregion