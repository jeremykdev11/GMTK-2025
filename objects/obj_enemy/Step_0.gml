/// @desc Move & Attack

event_inherited();

if (place_meeting(x, y, obj_attack))
{
	with (obj_player) xp++;
	instance_destroy();
}