/// @desc Draw Main Menu

if (room == r_mainmenu)
{
	//Draw Main Menu
	scribble_anim_wave(1, 50, 0.1);
	draw_set_font(ft_large);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var i = 0; i < menuLength; i++)
	{
		draw_set_color(#ffffff);
		if (options[menu, i] != 0 && options[menu, i] != undefined)
		{
			if (i == pos)
			{
				draw_set_color(#e35115);
				draw_text_scribble(TILE_SIZE, room_height*0.75 + (menuSpace * i), "[wave] > " + options[menu, i] + "[/wave]");
			}
			else draw_text_scribble(TILE_SIZE, room_height*0.75 + (menuSpace * i), options[menu, i]);
		}
	}
	
	//Other Text
	if (menu == 0)
	draw_sprite(spr_logo, 0, 0, 0);

	if (menu == 1) //How to Play
	{
		draw_set_font(ft_large);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(#ffffff);
		
		draw_text_scribble(room_width/2, room_width*0.25, "[#ffffff]Move with [#e35115]WASD [#ffffff]or");
		draw_text_scribble(room_width/2, room_width*0.25 + 32, "[#e35115]Arrow Keys[#ffffff]. Select menu");
		draw_text_scribble(room_width/2, room_width*0.25 + 64, "[#ffffff]menu items with [#e35115]Enter[#ffffff].");
		draw_text_scribble(room_width/2, room_width*0.25 + 96, "[#ffffff]Add new [#e35115]beats [#ffffff]to your");
		draw_text_scribble(room_width/2, room_width*0.25 + 128, "[#e35115]tracklist [#ffffff]to defeat");
		draw_text_scribble(room_width/2, room_width*0.25 + 160, "[#ffffff]oncoming waves of enemies!");
	}
	if (menu == 2) //Credits
	{	
		scribble_anim_wave(1, 50, 0.1);
		draw_set_font(ft_large);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(#ffffff);
		
		draw_text_scribble(room_width/2, room_width*0.25, "[#ffffff]Programming, Game Design");
		draw_text_scribble(room_width/2, room_width*0.25 + 32, "[#e35115][wave]Jeremy K");
		
		draw_text_scribble(room_width/2, room_width*0.25 + 80, "[#ffffff]Art, Programming");
		draw_text_scribble(room_width/2, room_width*0.25 + 112, "[#e35115][wave]Drew G");
		
		draw_text_scribble(room_width/2, room_width*0.25 + 160, "[#ffffff]Composing");
		draw_text_scribble(room_width/2, room_width*0.25 + 192, "[#e35115][wave]Joana L");
	}
}