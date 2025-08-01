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