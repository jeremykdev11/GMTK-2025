///@desc Player Setup

event_inherited();

#region Functions

function MovePlayer(_dir, _amount, _frames = 15)
{
	MoveCharacterByDir(_dir, _amount, _frames);
	
	// TEMP: Set image
	image_index = facingDir;
}

endMove = function()
{
	if (global.gameState == GAME_STATE.PlayerMove) SetGameState(GAME_STATE.TimelineAction);
}

#endregion