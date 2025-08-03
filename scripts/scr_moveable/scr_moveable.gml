#region Character Movement

function MoveCharacterByDir(_dir, _amount, _frames = 15)
{	
	// Get movement coordinates
	startPos = new Vector(x, y);
	targetPos = VectorCopy(startPos);
	
	// Get target position
	var _moveVector = DirToVector(_dir, _amount);
	targetPos.add(_moveVector);
	
	// Move
	DoMove(_dir, _frames);
}

function MoveCharacterByVec(_vec, _frames = 15)
{
	// Get movement coordinates
	startPos = new Vector(x, y);
	targetPos = VectorCopy(_vec);
	
	// Get move direction
	var _tempVec = VectorCopy(targetPos);
	_tempVec.subtract(startPos);
	var _dir = abs((_tempVec.getDirection()) / 90);
	
	// Move
	DoMove(_dir, _frames);
}

function DoMove(_dir, _frames)
{
	// Check if position is open before moving
	if (place_meeting(targetPos.x, targetPos.y, obj_wall)) return;
	
	// Enemy attack
	if (object_index == obj_enemy)
	{
		if (place_meeting(targetPos.x, targetPos.y, obj_enemy)) return;
		if (place_meeting(targetPos.x, targetPos.y, obj_player))
		{
			bumping = true;
			bumpFrame = 0;
			bumpFrameCount = _frames;
		
			facingDir = _dir;
		
			return;
		}
	}
	
	// Player "bump" into enemy
	if (object_index == obj_player)
	{
		if (place_meeting(targetPos.x, targetPos.y, obj_enemy))
		{
			bumping = true;
			bumpFrame = 0;
			bumpFrameCount = _frames;
		
			facingDir = _dir;
		
			return;
		}
	}
	
	// Start movement
	moving = true;
	moveFrame = 0;
	moveFrameCount = _frames;
	
	facingDir = _dir;
}

#endregion

#region World Space Conversion

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

function RotateVectorByDir(_vector, _dir)
{
	var _tempVector = new Vector(0, 0);
	
	switch(_dir)
	{
		case DIR.Right:
			_tempVector.x = _vector.x;
			_tempVector.y = _vector.y;
			break;
		case DIR.Up:
			_tempVector.x = _vector.y;
			_tempVector.y = -_vector.x;
			break;
		case DIR.Left:
			_tempVector.x = -_vector.x;
			_tempVector.y = -_vector.y;
			break;
		case DIR.Down:
			_tempVector.x = -_vector.y;
			_tempVector.y = _vector.x;
			break;
	}
	
	return _tempVector;
}

function WorldToGrid(_x, _y)
{
	var _gridX = (_x - BOARD_X - 16) / TILE_SIZE;
	var _gridY = (_y - BOARD_Y - 16) / TILE_SIZE;
	
	return new Vector(_gridX, _gridY);
}

#endregion