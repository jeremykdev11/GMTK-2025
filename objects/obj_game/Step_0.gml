/// @desc Load Screen
if (global.gameState == GAME_STATE.Initialize)
{
	var mouseClick = InputMouseCheck();
	if (mouseClick && !GamePaused())
	{
		DoTransition(r_mainmenu, GAME_STATE.MainMenu);
	}
}

if (room == r_gameplay)
{
	// Screenshake
	magnitude = lerp(magnitude, 0, 0.2);
	shakeFXparams[$ "g_Magnitude"] = magnitude;
	fx_set_parameters(shakeFX, shakeFXparams);
}

// Hitstop visuals
with (all)
{
	if (GamePaused())
	{
		image_speed = 0;
	}
	else
	{
		image_speed = 1;
	}
}