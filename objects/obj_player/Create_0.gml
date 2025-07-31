///@desc Player Setup

event_inherited();

#region State Machine Declaration

enum PLAYER_STATE
{
	FreeMove
}
playerState = PLAYER_STATE.FreeMove;

#endregion

#region Functions

function MovePlayer(_dir, _amount, _frames = 15)
{
	// TEMP: Set image
	image_index = _dir;
	
	MoveCharacter(_dir, _amount, _frames);
}

#endregion
