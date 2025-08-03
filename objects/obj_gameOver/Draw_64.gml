/// @desc Draw Game Over

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);
draw_set_alpha(1);


scribble_anim_wave(1, 50, 0.1);
draw_set_font(ft_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text_scribble(room_width/2, room_height/2 - TILE_SIZE, "Total Enemies Destroyed: " + string(global.enemiesKilled));

draw_text_scribble(room_width/2, room_height/2 + TILE_SIZE, "[wave]> Press Enter to Continue <");