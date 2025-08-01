/// @desc Draw Timeline

var _actionCount = ds_list_size(actionList);
var _displayWidth = _actionCount * iconSize + (_actionCount - 1) * iconSpacing;
var _startX = room_width / 2 - _displayWidth / 2;

for (var i = 0; i < _actionCount; i++)
{
	var _offsetX = (iconSize + iconSpacing) * i;
	var _offsetY = (i == position) ? -8 : 0;
	draw_sprite(actionList[| i].sprite, 0, _startX + _offsetX, 32 + _offsetY);
}