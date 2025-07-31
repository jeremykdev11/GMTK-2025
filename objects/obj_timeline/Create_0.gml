/// @desc Setup Timeline

position = 0;
actionList = ds_list_create();

#region Define Actions

actionSword = new Action(new Vector(1, 0), obj_sword, spr_swordTimeline);

#endregion

#region Update Timeline

function DoCurrentAction()
{
	// Run action effect at current position
	actionList[| position].SpawnAction();
}

function ResetTimeline()
{
	ds_list_empty(actionList);
	ds_list_add(actionList, actionSword);
	position = 0;
}

#endregion

// Do reset at end of create
ResetTimeline();