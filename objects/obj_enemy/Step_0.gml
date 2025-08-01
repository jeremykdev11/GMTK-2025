/// @desc Move & Attack

event_inherited();

if (attacking)
{
	if (attackFrame < attackFrameCount / 2)
	{
		x = EaseInOutCubic(attackFrame, startPos.x, (targetPos.x - startPos.x) / 2, attackFrameCount / 2);
		y = EaseInOutCubic(attackFrame, startPos.y, (targetPos.y - startPos.y) / 2, attackFrameCount / 2);
	}
	else
	{
		x = EaseInOutCubic(attackFrame, targetPos.x, startPos.x - targetPos.x, attackFrameCount);
		y = EaseInOutCubic(attackFrame, targetPos.y, startPos.y - targetPos.y, attackFrameCount);
	}
	
	attackFrame++;
	
	// Stop movement at end of animation
	if (attackFrame > attackFrameCount)
	{
		x = startPos.x;
		y = startPos.y;
		attacking = false;
	}
}