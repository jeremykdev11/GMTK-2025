/// @desc Setup Timeline

position = 0;
actionArray = array_create(8, -1);

actionFrame = 0;
actionDuration = 15;

iconSize = 48;
iconSpacing = 0;

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

actionHit = new Action(
	1,
	spr_swordPattern,
	[
		new Vector(1, 0)
	],
	-1
);
array_push(allActions, actionHit);

actionLob = new Action(
	2,
	spr_swordPattern,
	[
		new Vector(2, 0)
	],
	-1
);
array_push(allActions, actionLob);

actionSides = new Action(
	3,
	spr_swordPattern,
	[
		new Vector(0, 1),
		new Vector(0, -1)
	],
	-1
);
array_push(allActions, actionSides);

actionCross = new Action(
	4,
	spr_swordPattern,
	[
		new Vector(1, 1),
		new Vector(1, -1),
		new Vector(-1, 1),
		new Vector(-1, -1)
	],
	-1
);
array_push(allActions, actionCross);

actionBehind = new Action(
	5,
	spr_swordPattern,
	[
		new Vector(-1, -1),
		new Vector(-1, 0),
		new Vector(-2, 0),
		new Vector(-1, 1)
	],
	-1
);
array_push(allActions, actionBehind);

actionDash = new Action(
	6,
	spr_swordPattern,
	[
		new Vector(-1, 0),
		new Vector(-2, 0)
	],
	function()
	{
		with (obj_player) MoveCharacterByDir(facingDir, 32)
	}
);
array_push(allActions, actionDash);

actionRetreat = new Action(
	7,
	spr_swordPattern,
	[
		new Vector(1, 0),
		new Vector(2, 0),
		new Vector(3, 0)
	],
	function()
	{
		with (obj_player) MoveCharacterByDir((facingDir + 2) % 4, 32)
	}
);
array_push(allActions, actionRetreat);

actionRecoil = new Action(
	8,
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
array_push(allActions, actionRecoil);

actionRandom = new Action(
	9,
	spr_swordPattern,
	-1,
	-1,
	function()
	{
		attack = array_create(3);
		
		var _tiles = 
		[
			new Vector(1, 0),
			new Vector(2, 0),
			new Vector(-1, 0),
			new Vector(-2, 0),
			new Vector(0, 1),
			new Vector(0, 2),
			new Vector(0, -1),
			new Vector(0, -2),
			new Vector(1, 1),
			new Vector(1, -1),
			new Vector(-1, 1),
			new Vector(-1, -1)
		];
		
		var _nums = array_create(3, -1);
		
		for (var i = 0; i < 3; i++)
		{
			var _num = irandom(11);
			while (array_contains(_nums, _num)) _num = irandom(11);
		
			_nums[i] = _num;
			attack[i] = _tiles[_num];
		}
		return attack;
	}
);
array_push(allActions, actionRandom);

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
	actionArray = array_create(8, -1);
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