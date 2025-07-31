/// @desc Update Player

#region Get Input

leftPressed		= InputPressed(INPUT_VERB.LEFT);
rightPressed	= InputPressed(INPUT_VERB.RIGHT);
upPressed		= InputPressed(INPUT_VERB.UP);
downPressed		= InputPressed(INPUT_VERB.DOWN);

#endregion

#region State Machine

switch (playerState)
{
	case PLAYER_STATE.FreeMove:
	
	if (!moving)
	{
		if (rightPressed)	MovePlayer(DIR.Right, TILE_SIZE);
		if (upPressed)		MovePlayer(DIR.Up, TILE_SIZE);
		if (leftPressed)	MovePlayer(DIR.Left, TILE_SIZE);
		if (downPressed)	MovePlayer(DIR.Down, TILE_SIZE);
	}
	
	break;
}

#endregion

// Update Player Movement

if (moving)
{	
	x = EaseOutCubic(moveFrame, startPos.x, targetPos.x - startPos.x, moveFrameCount);
	y = EaseOutCubic(moveFrame, startPos.y, targetPos.y - startPos.y, moveFrameCount);
	
	moveFrame++;
	
	// Stop movement at end of animation
	if (moveFrame > moveFrameCount)
	{
		moving = false;
	}
}