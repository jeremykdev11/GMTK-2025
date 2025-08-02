/// @desc Load Screen
if (global.gameState == GAME_STATE.Initialize)
{
	var mouseClick = InputMouseCheck();
	if (mouseClick && !GamePaused())
	{
		DoTransition(r_mainmenu, GAME_STATE.MainMenu);
	}
}