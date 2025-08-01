/// @desc Setup Enemy

event_inherited();

attacking			=	false;
attackFrame			=	0;
attackFrameCount	=	0;

function MoveEnemy(_frames = 15)
{
	// Get path
	path = path_add();
	if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, false))
	{
	    path_start(path, 0, path_action_stop, false);
	}
	
	// Determine next position from path
	var _vec = new Vector(path_get_point_x(path, 1), path_get_point_y(path, 1));
	
	// Delete path
	path_delete(path);
	
	// Move character to next position
	MoveCharacterByVec(_vec);
	
	// TEMP: Set image
	image_index = facingDir;
}