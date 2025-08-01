/// @desc Manage Action Duration

if (global.gameState == GAME_STATE.TimelineAction)
{
	// Update action frame
	actionFrame++;
	
	// End action after duration
	if (actionFrame > actionDuration)
	{
		actionFrame = 0;
		SetGameState(GAME_STATE.EnemyMove);
	}
}