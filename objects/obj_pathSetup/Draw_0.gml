///@desc (DEBUG) View Grid

draw_set_alpha(0.3);
mp_grid_draw(global.grid);
draw_set_alpha(1);

with (obj_enemy)
{
	if (variable_instance_exists(self, "path")) draw_path(path, x, y, false)
}