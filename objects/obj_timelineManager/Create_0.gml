/// @desc Setup Timeline

position = 0;
actionArray = array_create(10, -1);

actionFrame = 0;
actionDuration = 15;

iconSize = 32;
iconSpacing = 8;

leveledUp = false;

#region Define Actions

actionSword = new Action(
	spr_swordTimeline,
	[
		new Vector(1, -1),
		new Vector(1, 0),
		new Vector(1, 1)
	],
	function()
	{
		with (obj_player) MoveCharacterByDir((facingDir + 2) % 4, 32)
	}
);

actionGun = new Action(
	spr_gunTimeline,
	[
		new Vector(1, 0),
		new Vector(2, 0),
		new Vector(3, 0)
	],
	-1
);

actionCross = new Action(
	spr_crossTimeline,
	[
		new Vector(1, 1),
		new Vector(1, -1),
		new Vector(-1, 1),
		new Vector(-1, -1)
	],
	-1
);

#endregion

#region Update Timeline

function DoCurrentAction()
{
	// Run action effect at current position
	actionArray[position].DoAction();
	
	var _foundAction = false;
	while (!_foundAction)
	{
		position++;
		if (position >= array_length(actionArray)) position = 0;
		
		if (actionArray[position] != -1) _foundAction = true;
	}
}

function ResetTimeline()
{
	actionArray = array_create(10, -1);
	actionArray[0] = actionSword;
	actionArray[3] = actionCross;
	actionArray[8] = actionGun;
	position = 0;
}

#endregion

// Do reset at end of create
ResetTimeline();