/// @desc

event_inherited();

path = path_add();
if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, false))
{
    path_start(path, 0, path_action_stop, false);
}