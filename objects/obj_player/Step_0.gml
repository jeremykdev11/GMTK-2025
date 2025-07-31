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
		if (leftPressed) MovePlayer(-TILE_SIZE, 0);
		if (rightPressed) MovePlayer(TILE_SIZE, 0);
		if (upPressed) MovePlayer(0, -TILE_SIZE);
		if (downPressed) MovePlayer(0, TILE_SIZE);
	}
	
	break;
}

#endregion

// Update Player Movement

if (moving)
{	
	x = EaseOutCubic(moveFrame, startX, targetX - startX, moveFrameCount);
	y = EaseOutCubic(moveFrame, startY, targetY - startY, moveFrameCount);
	
	moveFrame++;
	
	// Stop movement at end of animation
	if (moveFrame > moveFrameCount)
	{
		moving = false;
	}
}