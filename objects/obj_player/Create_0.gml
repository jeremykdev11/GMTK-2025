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
	MoveCharacter(_dir, _amount, _frames);
	
	// TEMP: Set image
	image_index = facingDir;
}

#endregion
