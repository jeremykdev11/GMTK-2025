function MoveCharacter(_dir, _amount, _frames = 15)
{
	// TODO: Do check to see if position is open before moving
	
	// Get movement coordinates
	startPos = new Vector(x, y);
	targetPos = VectorCopy(startPos);
	
	var _moveVector = DirToVector(_dir, _amount);
	targetPos.add(_moveVector);
	
	// Start movement
	moving = true;
	moveFrame = 0;
	moveFrameCount = _frames;
}

function DirToVector(_dir, _amount)
{
	var _tempVector = new Vector(0, 0);
	
	switch(_dir)
	{
		case DIR.Right: _tempVector.x = _amount;	break;
		case DIR.Up:	_tempVector.y = -_amount;	break;
		case DIR.Left:	_tempVector.x = -_amount;	break;
		case DIR.Down:	_tempVector.y = _amount;	break;
	}
	
	return _tempVector;
}