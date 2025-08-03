/// @desc Move & Attack

event_inherited();

depth = -y + initialDepth;

animationStep++;

var _sinCurve = sin(animationStep * (pi / 32));

image_yscale = 1 + 0.025 * _sinCurve;

// Enemy hit by attack
if (place_meeting(x, y, obj_attack))
{
	with (obj_player) xp++;
	
	if !audio_is_playing(snd_explode) audio_play_sound(snd_explode, 5, false);
	instance_create_depth(x, y, depth - 10, obj_wordParticle, {wordString: "Yeahhh!", color: c_blue})
	ScreenShake(50);
	HitStop();
	
	instance_destroy();
}

// Screenshake on attacking player
if (bumpFrame == 8)
{
	ScreenShake(50);
}

// Move particles
if (moving || bumping)
{
	var _rand = irandom(3);
	if (_rand == 0)
	{
		part_system_depth(global.pSystem, depth + 1);
		part_particles_create(global.pSystem, x, y, global.dustParticle, 1);
	}
}