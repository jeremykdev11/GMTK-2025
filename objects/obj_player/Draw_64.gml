/// @desc TEMP: Display HP/XP

//draw_text(16, 16, "HP:" + string(hp));
//draw_text(16, 32, "XP:" + string(xp));
//draw_text(16, 48, "Level:" + string(level));
//draw_text(16, 64, "gamestate" + string(global.gameState));

var _healthX = 128;
var _healthY = room_height - 64;

draw_sprite_ext(spr_healthBar, 0, _healthX, _healthY, 1.8, 1, 0, c_white, 1);

for (var _i = 0; _i < hpMax; _i++)
{
	if ( _i + 1 > global.hp)
	{
		draw_set_color(#444444);
	}
	else
	{
		var _color = merge_color(#bc115f, #119fa1, _i / hpMax)
		draw_set_color(_color);
	}
	var _width = 16
	var _space = _i * (_width + 8)
	draw_roundrect_ext(_healthX + 48 + (_width / 2) + _space, _healthY + (4 - _i) * 4, _healthX + 48 - (_width / 2) + _space, _healthY + 34,
	6, 6, false);
}