/// @desc Move & Attack

event_inherited();

depth = -y + initialDepth;

animationStep++;

var _sinCurve = sin(animationStep * (pi / 32));

image_yscale = 1 + 0.025 * _sinCurve;

if (place_meeting(x, y, obj_attack))
{
	with (obj_player) xp++;
	instance_destroy();
	instance_create_depth(x, y, depth - 10, obj_wordParticle, {wordString: "Yeahhh!", color: c_blue})
}