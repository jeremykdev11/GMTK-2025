/// @desc Setup Enemy

event_inherited();

instance_create_layer(x,y, "Game", obj_enemyBeam);

initialDepth = depth;
image_speed = 0.5;
animationStep = -15;
visible = false;	

function MoveEnemy(_frames = 15)
{
	// Get path
	path = path_add();
	if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, false))
	{
	    path_start(path, 0, path_action_stop, false);
		
		// Determine next position from path
		var _vec = new Vector(path_get_point_x(path, 1), path_get_point_y(path, 1));
	
		// Move character to next position
		MoveCharacterByVec(_vec);
	}
	
	// Delete path
	path_delete(path);
	
	//if !audio_is_playing(snd_move) audio_play_sound(snd_move, 5, false);
	
	// TEMP: Set image
	//image_index = facingDir;
}

endBump = function()
{
	audio_play_sound(snd_explodeShort, 5, false);
	with (obj_player) global.hp--;
}