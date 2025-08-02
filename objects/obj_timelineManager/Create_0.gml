/// @desc Setup Timeline

position = 0;
actionList = ds_list_create();

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
	actionList[| position].DoAction();
	
	position++;
	if (position >= ds_list_size(actionList)) position = 0;
}

function ResetTimeline()
{
	ds_list_empty(actionList);
	ds_list_add(actionList, actionSword);
	ds_list_add(actionList, actionGun);
	ds_list_add(actionList, actionCross);
	position = 0;
}

#endregion

// Do reset at end of create
ResetTimeline();