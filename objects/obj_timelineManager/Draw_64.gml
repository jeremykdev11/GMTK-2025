/// @desc Draw Timeline


if (global.gameState == GAME_STATE.LevelUp)
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	// Draw current timeline
	var _actionCount = array_length(actionArray);
	
	var _displayWidth = _actionCount * iconSize + (_actionCount) * iconSpacing;
	var _startX = room_width / 2 - _displayWidth / 2;
	var _yHeight = 48;
	var _barWidth = (2/3) + (_actionCount / 2)
	draw_sprite_ext(spr_timeline, 0, _startX - 32, _yHeight + 2, _barWidth, 1, 0, c_white, 1);
	
	

	for (var i = 0; i < _actionCount; i++)
	{
		var _offsetX = (iconSize + iconSpacing) * i;
		draw_sprite(spr_timelineSlot, i == slotPosition, _startX + _offsetX, _yHeight);
		if (actionArray[i] != -1)
		{
			draw_sprite(spr_beatIcons, actionArray[i].subimg, _startX + _offsetX, _yHeight);
		}
	}
	
	// Draw new action options
	_actionCount = array_length(newActions)
	
	_displayWidth = (_actionCount * iconSize + (_actionCount - 1) * iconSpacing) * 2;
	_startX = room_width / 2 - _displayWidth / 2;
	
	for (var i = 0; i < _actionCount; i++)
	{
		var _offsetX = ((iconSize + iconSpacing) * i) * 2;
		draw_sprite_ext(spr_timelineSlot, i == newActionPosition, _startX + _offsetX, 128, 2, 2, 0, c_white, 1);
		draw_sprite_ext(spr_beatIcons, newActions[i].subimg, _startX + _offsetX, 128, 2, 2, 0, c_white, 1);
	}
	
	// Draw new action pattern
	//draw_sprite(newActions[newActionPosition].pattern, attackPatternState, room_width/2, 128);
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
	var _yHeight = 48;
	var _barWidth = (2/3) + (_actionCount / 2)
	draw_sprite_ext(spr_timeline, 0, _startX - 32, _yHeight + 2, _barWidth, 1, 0, c_white, 1);

	for (var i = 0; i < _actionCount; i++)
	{
		var _offsetX = (iconSize + iconSpacing) * i;
		var _offsetY = (i == position) ? -8 : 0;
		draw_sprite(spr_beatIcons, _activeActions[i].subimg, _startX + _offsetX, _yHeight + _offsetY);
	}
}