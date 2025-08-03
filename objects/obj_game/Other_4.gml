/// @desc Music / Screen Shake

if (room == r_gameplay)
{
	shakeFX = layer_get_fx("EffectShake");
	shakeFXparams = fx_get_parameters(shakeFX);
	magnitude = 0;
}

if (!audio_is_playing(mus_funkyfresh))
{
	audio_play_sound(mus_funkyfresh, 10, true);	
}