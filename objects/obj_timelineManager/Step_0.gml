/// @desc Manage Action Duration

if (global.gameState == GAME_STATE.TimelineAction)
{
	// Update action frame
	actionFrame++;
	
	// End action after duration
	if (actionFrame > actionDuration && !instance_exists(obj_attack))
	{
		actionFrame = 0;
		if (leveledUp)
		{
			leveledUp = false;
			SetGameState(GAME_STATE.LevelUp);
		}
		else SetGameState(GAME_STATE.EnemyMove);
	}
}