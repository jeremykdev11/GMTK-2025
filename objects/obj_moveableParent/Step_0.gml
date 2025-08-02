/// @desc Update Movement

if (moving)
{	
	x = EaseOutCubic(moveFrame, startPos.x, targetPos.x - startPos.x, moveFrameCount);
	y = EaseOutCubic(moveFrame, startPos.y, targetPos.y - startPos.y, moveFrameCount);
	
	moveFrame++;
	
	// Stop movement at end of animation
	if (moveFrame > moveFrameCount)
	{
		x = targetPos.x;
		y = targetPos.y;
		moving = false;
		endMove();
	}
}

if (bumping)
{
	if (bumpFrame < bumpFrameCount / 2)
	{
		x = EaseInOutCubic(bumpFrame, startPos.x, (targetPos.x - startPos.x) / 2, bumpFrameCount / 2);
		y = EaseInOutCubic(bumpFrame, startPos.y, (targetPos.y - startPos.y) / 2, bumpFrameCount / 2);
	}
	else
	{
		x = EaseInOutCubic(bumpFrame, targetPos.x, startPos.x - targetPos.x, bumpFrameCount);
		y = EaseInOutCubic(bumpFrame, targetPos.y, startPos.y - targetPos.y, bumpFrameCount);
	}
	
	bumpFrame++;
	
	// Stop movement at end of animation
	if (bumpFrame > bumpFrameCount)
	{
		x = startPos.x;
		y = startPos.y;
		bumping = false;
		endBump();
	}
}