/// @desc Draw Main Menu

if (room == r_mainmenu)
{
	//Draw Main Menu
	scribble_anim_wave(1, 50, 0.1);
	draw_set_font(ft_regular);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var i = 0; i < menuLength; i++)
	{
		draw_set_color(#ffffff);
		if (options[menu, i] != 0 && options[menu, i] != undefined)
		{
			if (i == pos)
			{
				draw_set_color(#ffffff);
				draw_text_scribble(TILE_SIZE, room_height/2 + (menuSpace * i), "[wave] = " + options[menu, i] + "[/wave]");
			}
			else draw_text_scribble(TILE_SIZE, room_height/2 + (menuSpace * i), options[menu, i]);
		}
	}
	
	//Other Text

	//if (menu == 2) //How to Play
	//{
	//	draw_set_font(global.fontS);
	//	draw_set_halign(fa_left);
	//	draw_set_valign(fa_top);
	//	draw_set_color(c_white);
		
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2, "[#cbd1be]Move with [#e0a46e]W/A/D [#cbd1be]or");
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2 + 8, "[#e0a46e]</^/>[#cbd1be]. Reset with [#e0a46e]R[#cbd1be].");
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2 + 20, "[#cbd1be]Go back in time and work");
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2 + 28, "[#cbd1be]alongside your past self");
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2 + 36, "[#cbd1be]to [#e0a46e]reach the cheese!");
	//}
	//if (menu == 3) //Credits
	//{
	//	draw_set_font(global.fontS);
	//	draw_set_halign(fa_left);
	//	draw_set_valign(fa_top);
	//	draw_set_color(c_white);
		
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2, "[#cbd1be]Art, Programming, Game");
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2 + 8, "[#cbd1be]Design by [#e0a46e]Jeremy K");
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2 + 20, "[#cbd1be]Music by [#e0a46e]Aidan Todd [#cbd1be]+ [#e0a46e]Josh F");
	//	draw_text_scribble(TILESIZE, GAMEHEIGHT/2 + 32, "[#cbd1be]Sound Design by [#e0a46e]Luminious");
	//}
}