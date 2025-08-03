/// @desc Draw Timeline


if (global.gameState == GAME_STATE.LevelUp)
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}
else
{
	// Get added actions from array
	var _actionCount = 0;
	for (var i = 0; i < array_length(actionArray); i++)
	{
		if (actionArray[i] != -1) _actionCount++;
	}
	
	// Create new array of only added action
	var _activeActions = array_create(_actionCount);
	var _added = 0;
	for (var i = 0; i < array_length(actionArray); i++)
	{
		if (actionArray[i] != -1)
		{
			_activeActions[_added] = actionArray[i];
			_added++;
		}
	}
	
	var _displayWidth = _actionCount * iconSize + (_actionCount - 1) * iconSpacing;
	var _startX = room_width / 2 - _displayWidth / 2;

	for (var i = 0; i < _actionCount; i++)
	{
		var _offsetX = (iconSize + iconSpacing) * i;
		var _offsetY = (i == position) ? -8 : 0;
		draw_sprite(_activeActions[i].sprite, 0, _startX + _offsetX, 32 + _offsetY);
	}
}