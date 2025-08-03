/// @desc Enemy Management Setup

enemyMoveFrame = 0;
enemyMoveDuration = 15;

baseEnemyCount = 2;

#region Pathfinding Grid

gridX = BOARD_X;
gridY = BOARD_Y;
gridWidth = BOARD_WIDTH;	// # of cells wide
gridHeight = BOARD_HEIGHT; // # of cells tall

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
			
			// After moving, set new cell to "forbidden" (unless attacking player)
			if !(place_meeting(targetPos.x, targetPos.y, obj_player))
			{
				var _newCellPos = WorldToGrid(targetPos.x, targetPos.y);
				mp_grid_add_cell(global.grid, _newCellPos.x, _newCellPos.y);
			}
		}
	}
	
	// Reset grid to clear forbidden cells
	ResetGrid();
}

function GetEnemySpawnCount()
{
	if !(instance_exists(obj_player)) return;
	
	var _increase = floor(obj_player.level / 3);
	return baseEnemyCount + _increase;
}

#endregion