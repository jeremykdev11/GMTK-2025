/// @desc Move & Attack

event_inherited();

depth = -y + initialDepth;

if (place_meeting(x, y, obj_attack))
{
	with (obj_player) xp++;
	instance_destroy();
}