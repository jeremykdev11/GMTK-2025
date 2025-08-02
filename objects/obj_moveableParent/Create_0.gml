/// @desc Define Moveable

#region Variables

moving			=	false;
moveFrame		=	0;
moveFrameCount	=	0;

bumping			=	false;
bumpFrame		=	0;
bumpFrameCount	=	0;

startPos		=	new Vector(x, y);
targetPos		=	new Vector(x, y);

facingDir		=	DIR.Right;

#endregion

#region Functions

endMove = function()
{
	// OVERRIDE
}

endBump = function()
{
	// OVERRIDE
}

#endregion