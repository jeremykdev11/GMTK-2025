function DoTransition(_room, _state)
{
	SetGameState(_state);
	instance_create_depth(0, 0, -5000, obj_transitionOut, { targetRoom : _room } );
}