/// @desc Update Player

// Inherit movement updates
event_inherited();

depth = -y + initialDepth;

#region Get Input

leftPressed		= InputPressed(INPUT_VERB.LEFT);
rightPressed	= InputPressed(INPUT_VERB.RIGHT);
upPressed		= InputPressed(INPUT_VERB.UP);
downPressed		= InputPressed(INPUT_VERB.DOWN);

#endregion

#region State Machine

switch (global.gameState)
{
	case GAME_STATE.PlayerMove:
	
	if (!moving && !bumping)
	{
		if (rightPressed)	MovePlayer(DIR.Right, TILE_SIZE);
		if (upPressed)		MovePlayer(DIR.Up, TILE_SIZE);
		if (leftPressed)	MovePlayer(DIR.Left, TILE_SIZE);
		if (downPressed)	MovePlayer(DIR.Down, TILE_SIZE);
	}
	
	break;
	case GAME_STATE.TimelineAction:
		sprite_index = animationFrame;
	break;
}

#endregion

// Update xp/level
if (xp >= xpMax)
{
	xp -= xpMax;
	xpMax += 2;
	level++;
	obj_timelineManager.leveledUp = true;
}