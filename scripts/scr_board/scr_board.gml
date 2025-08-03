function GetRandomBoardPos()
{
	var _x = GetRandomBoardX();
	var _y = GetRandomBoardY();
	return new Vector(_x, _y);
}

function GetRandomBoardX()
{
	return irandom_range(0, BOARD_WIDTH - 1);
}

function GetRandomBoardY()
{
	return irandom_range(0, BOARD_HEIGHT - 1);
}

function GetRandomBoardEmpty()
{
	var _pos = GetRandomBoardPos();
	_pos.x = BOARD_X + _pos.x * TILE_SIZE;
	_pos.y = BOARD_Y + _pos.y * TILE_SIZE;
	
	while (position_meeting(_pos.x, _pos.y, obj_player)
		|| position_meeting(_pos.x, _pos.y, obj_enemy)
		|| position_meeting(_pos.x, _pos.y, obj_wall)
		|| position_meeting(_pos.x, _pos.y, obj_enemySpawn))
	{
		_pos = GetRandomBoardPos();
		_pos.x = BOARD_X + _pos.x * TILE_SIZE;
		_pos.y = BOARD_Y + _pos.y * TILE_SIZE;
	}
	return _pos;
}

//function GetMultipleRandomBoardEmpty(_count)
//{
//	var _array = array_create(_count);
//	for (var i = 0; i < _count; i++)
//	{
//		var _pos = GetRandomBoardEmpty();
//		while (array_contains(_array, _pos))
//		{
//			_pos = GetRandomBoardEmpty();
//		}
//		_array[i] = _pos;
//	}
//	return _array;
//}