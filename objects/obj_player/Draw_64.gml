/// @desc TEMP: Display HP/XP

//draw_text(16, 16, "HP:" + string(hp));
//draw_text(16, 32, "XP:" + string(xp));
//draw_text(16, 48, "Level:" + string(level));
//draw_text(16, 64, "gamestate" + string(global.gameState));

draw_sprite_ext(spr_healthBar, 0, 128, room_height - 64, 2, 1, 0, c_white, 1);