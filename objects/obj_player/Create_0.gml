///@desc Player Setup

event_inherited();

#region Visuals

initialDepth = depth;
animationFrame = spr_playerIdle_A;
animationStep = 0;

#endregion

#region Player Stats

xp = 0;
xpMax = 4;
hp = 5;
level = 1;
totalMoves = 0;

#endregion

#region Functions

function MovePlayer(_dir, _amount, _frames = 15)
{
	MoveCharacterByDir(_dir, _amount, _frames);
	
	// TEMP: Set image
	image_index = facingDir;
	sprite_index = spr_playerMove;
	audio_play_sound(snd_move, 5, false);
}

endMove = function()
{
	totalMoves++;
	if (global.gameState == GAME_STATE.PlayerMove) SetGameState(GAME_STATE.TimelineAction);
}

endBump = function()
{
	audio_play_sound(snd_explodeShort, 5, false);
	totalMoves++;
	if (global.gameState == GAME_STATE.PlayerMove)
	{
		SetGameState(GAME_STATE.TimelineAction);
	}
}


#endregion