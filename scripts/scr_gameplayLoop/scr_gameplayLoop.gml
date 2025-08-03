function SetGameState(_state)
{
	// Additional behavior on state switch
	switch (_state)
	{
		case GAME_STATE.TimelineAction:
		
			with (obj_timelineManager) DoCurrentAction();
			break;
		
		case GAME_STATE.EnemyMove:
		
			with (obj_enemyManager) MoveAllEnemies();
			break;
			
		case GAME_STATE.LevelUp:
			
			with (obj_timelineManager) NewActions();
			break;
	}
	
	// Set state
	global.gameState = _state;
}

function GamePaused()
{
	return instance_exists(obj_pauseObject);
}