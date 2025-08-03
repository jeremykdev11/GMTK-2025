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
	leftPressed		= InputPressed(INPUT_VERB.LEFT);
	rightPressed	= InputPressed(INPUT_VERB.RIGHT);
	
	// New action selection
	if (newActionSelected == false)
	{
		if (leftPressed) newActionPosition--;
		if (rightPressed) newActionPosition++;
		
		if (newActionPosition < 0) newActionPosition = 2;
		if (newActionPosition > 2) newActionPosition = 0;
		
		if (enterPressed) newActionSelected = true;
	}
	// Timeline slot selection
	else
	{
		if (leftPressed) slotPosition--;
		if (rightPressed) slotPosition++;
		
		if (slotPosition < 0) slotPosition = 9;
		if (slotPosition > 9) slotPosition = 0;
		
		// Pick slot
		if (enterPressed)
		{
			actionArray[slotPosition] = newActions[newActionPosition];
			SetGameState(GAME_STATE.EnemyMove);
		}
	}
	
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