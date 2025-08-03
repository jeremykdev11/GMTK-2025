function Action(_subimg, _pattern, _attack, _effect) constructor
{
	// Attack pattern as an array of vectors
	// -1 if none
	attack = _attack;
	
	// Sprite of attack pattern
	pattern = _pattern;
	
	// Additional effect of action as a function
	// -1 if none
	effect = _effect;
	
	// Sprite on timeline
	subimg = _subimg;
	
	static DoAction = function()
	{
		if !(instance_exists(obj_player)) return;
		
		// Attack
		if (attack != -1)
		{
			var _len = array_length(attack);
			for (var i = 0; i < _len; i++)
			{
				// Get attack spawn position
				var _dir = obj_player.facingDir;
				var _dirDisplacement = RotateVectorByDir(attack[i], _dir)
				_dirDisplacement.multiply(TILE_SIZE);
				
				// Create attacks
				instance_create_depth(
					obj_player.x + _dirDisplacement.x,
					obj_player.y + +_dirDisplacement.y,
					-100,
					obj_attack
				);
			}
		}
		
		// Effect
		if (effect != -1)
		{
			effect();
		}
	}
}

//function Action(_displacement, _object, _sprite) constructor
//{
//	// Tile displacement from player position as a vector
//	// ex. (1, 0) -> One tile right of the player
//	displacement = _displacement
	
//	// Object associated with/created by action
//	object = _object;
	
//	// Sprite on timeline
//	sprite = _sprite;
	
//	static SpawnAction = function()
//	{
//		if !(instance_exists(obj_player)) return;
		
//		// Get action spawn position
//		var _dir = obj_player.facingDir;
//		var _dirDisplacement = RotateVectorByDir(displacement, _dir)
//		_dirDisplacement.multiply(TILE_SIZE);
		
//		// Create action
//		instance_create_depth(
//			obj_player.x + _dirDisplacement.x,
//			obj_player.y + +_dirDisplacement.y,
//			obj_player.depth,
//			object,
//			{ facingDir : _dir }
//		);
//	}
//}