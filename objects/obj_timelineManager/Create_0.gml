/// @desc Setup Timeline

position = 0;
actionArray = array_create(10, -1);

actionFrame = 0;
actionDuration = 15;

iconSize = 32;
iconSpacing = 8;

leveledUp = false;

newActions = array_create(3);

// Level up timeline interaction
newActionSelected = false;
newActionPosition = 0;
slotPosition = 0;

// Attack pattern display animation on level up
attackPatternState = 0;
attackPatternFrame = 0;
attackPatternDuration = 60;

#region Define Actions

allActions = array_create(0);

actionSword = new Action(
	spr_swordTimeline,
	spr_swordPattern,
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
array_push(allActions, actionSword);

actionGun = new Action(
	spr_gunTimeline,
	spr_swordPattern,
	[
		new Vector(1, 0),
		new Vector(2, 0),
		new Vector(3, 0)
	],
	-1
);
array_push(allActions, actionGun);

actionCross = new Action(
	spr_crossTimeline,
	spr_crossPattern,
	[
		new Vector(1, 1),
		new Vector(1, -1),
		new Vector(-1, 1),
		new Vector(-1, -1)
	],
	-1
);
array_push(allActions, actionCross);

#endregion

#region Update Timeline

function DoCurrentAction()
{
	// Run action effect at current position
	if (actionArray[position] == -1)
	{
		var _foundInitialAction = false;
		while (!_foundInitialAction)
		{
			position++;
			if (position >= array_length(actionArray)) position = 0;
		
			if (actionArray[position] != -1) _foundInitialAction = true;
		}
	}
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
	//actionArray[0] = actionSword;
	//actionArray[3] = actionCross;
	//actionArray[8] = actionGun;
	position = 0;
}

function NewActions()
{
	// Set variables
	newActionSelected = false;
	newActionPosition = 0;
	slotPosition = 0;
	
	// Pick 3 random actions
	var _count = array_length(allActions);
	var _nums = array_create(array_length(newActions), -1);
	
	for (var i = 0; i < array_length(newActions); i++)
	{
		var _num = irandom(_count - 1);
		while (array_contains(_nums, _num)) _num = irandom(_count - 1);
		
		_nums[i] = _num;
		newActions[i] = allActions[_num];
	}
}

#endregion

// Do reset at end of create
ResetTimeline();