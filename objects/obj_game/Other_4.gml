/// @desc Screen Shake

if (room == r_gameplay)
{
	shakeFX = layer_get_fx("EffectShake");
	shakeFXparams = fx_get_parameters(shakeFX);
	magnitude = 0;
}