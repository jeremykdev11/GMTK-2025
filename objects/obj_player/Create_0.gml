///@desc Player Setup

#region Variables

moving			=	false;
moveFrame		=	0;
moveFrameCount	=	0;

startX			=	x;
startY			=	y;

targetX			=	x;
targetY			=	y;

#endregion

#region State Machine Declaration

enum PLAYER_STATE
{
	FreeMove
}
playerState = PLAYER_STATE.FreeMove;

#endregion

#region Functions

function MovePlayer(_x, _y, _frames = 15)
{
	// TODO: Do check to see if position is open before moving
	
	moving = true;
	moveFrame = 0;
	moveFrameCount = _frames;
	
	startX = x;
	startY = y;
	
	targetX = x + _x;
	targetY = y + _y;
}

#endregion
