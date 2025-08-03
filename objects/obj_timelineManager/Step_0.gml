/// @desc Manage Timeline and Actions

#region Actions

if (global.gameState == GAME_STATE.TimelineAction && !GamePaused())
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

#endregion

#region Level Up Phase

if (global.gameState == GAME_STATE.LevelUp)
{
	enterPressed	= InputPressed(INPUT_VERB.ACTION);
	upPressed		= InputPressed(INPUT_VERB.UP);
	downPressed		= InputPressed(INPUT_VERB.DOWN);
	
	// Animate attack pattern
	attackPatternFrame++;
	if (attackPatternFrame >= attackPatternDuration)
	{
		attackPatternFrame = 0;
		attackPatternState++;
		if (attackPatternState >= 4) attackPatternState = 0;
	}
}

#endregion