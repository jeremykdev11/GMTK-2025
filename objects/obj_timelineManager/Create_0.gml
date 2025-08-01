/// @desc Setup Timeline

position = 0;
actionList = ds_list_create();

actionFrame = 0;
actionDuration = 15;

#region Define Actions

actionSword = new Action(new Vector(1, 0), obj_sword, spr_swordTimeline);
actionGun = new Action(new Vector(2, 0), obj_gun, spr_swordTimeline);

#endregion

#region Update Timeline

function DoCurrentAction()
{
	// Run action effect at current position
	actionList[| position].SpawnAction();
	
	position++;
	if (position >= ds_list_size(actionList)) position = 0;
}

function ResetTimeline()
{
	ds_list_empty(actionList);
	ds_list_add(actionList, actionSword);
	ds_list_add(actionList, actionGun);
	position = 0;
}

#endregion

// Do reset at end of create
ResetTimeline();