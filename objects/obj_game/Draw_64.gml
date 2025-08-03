/// @desc Draw Game Init Text

if (room == r_load)
{
	scribble_anim_wave(1, 50, 0.1);
	draw_set_font(ft_large);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(#d1d5b4);

	draw_text_scribble(room_width/2, room_height/2, "[wave]> Click Screen to Focus <");
}