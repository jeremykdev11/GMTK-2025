function ScreenShake(_magnitude)
{
	with (obj_game) magnitude = _magnitude;
}

function HitStop()
{
	instance_create_depth(0, 0, -1, obj_hitstop);
}