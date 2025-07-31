function Action(_displacement, _object, _sprite) constructor
{
	// Tile displacement from player position as a vector
	// ex. (1, 0) -> One tile right of the player
	displacement = _displacement
	
	// Object associated with/created by action
	object = _object;
	
	// Sprite on timeline
	sprite = _sprite;
	
	static SpawnAction = function()
	{
		if !(instance_exists(obj_player)) return;
		
		// Get action spawn position
		var _dir = obj_player.facingDir;
		var _dirDisplacement = RotateVectorByDir(displacement, _dir)
		_dirDisplacement.multiply(TILE_SIZE);
		
		// Create action
		instance_create_depth(
			obj_player.x + _dirDisplacement.x,
			obj_player.y + +_dirDisplacement.y,
			obj_player.depth,
			object,
			{ facingDir : _dir }
		);
	}
}