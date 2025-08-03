/// @desc Go to main menu

enterPressed = InputPressed(INPUT_VERB.ACTION);

if (enterPressed)
{
	DoTransition(r_mainmenu, GAME_STATE.MainMenu);
}