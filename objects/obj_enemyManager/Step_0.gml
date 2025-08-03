/// @desc Update Game State After Move

if (global.gameState == GAME_STATE.EnemyMove && !GamePaused())
{
	enemyMoveFrame++;
	
	// Make sure all enemies are done moving before returning control back to player
	var _doneMoving = true;
	with (obj_enemy) if (moving || bumping) _doneMoving = false;
	if (_doneMoving && enemyMoveFrame > enemyMoveDuration)
	{
		// Spawn enemies at end of enemy move at spawn locations
		with (obj_enemySpawn)
		{
			instance_create_depth(x, y, depth, obj_enemy);
			instance_destroy();
		}
		
		// If no enemies left, create enemy spawn points
		if (instance_number(obj_enemy) == 0)
		{
			var _spawnCount = GetEnemySpawnCount();
			for (var i = 0; i < _spawnCount; i++)
			{
				var _spawnPos = GetRandomBoardEmpty();
				instance_create_layer(_spawnPos.x + TILE_SIZE/2, _spawnPos.y + TILE_SIZE/2, "Instances", obj_enemySpawn);
			}
		}
		
		// Create enemy spawn points every (?) player moves
		if (instance_exists(obj_player))
		{
			if (obj_player.totalMoves % 15 == 14) 
			{
				var _spawnCount = GetEnemySpawnCount();
				for (var i = 0; i < _spawnCount; i++)
				{
					var _spawnPos = GetRandomBoardEmpty();
					instance_create_layer(_spawnPos.x + TILE_SIZE/2, _spawnPos.y + TILE_SIZE/2, "Instances", obj_enemySpawn);
				}
			}
		}
		
		SetGameState(GAME_STATE.PlayerMove);
		enemyMoveFrame = 0;
	}
}