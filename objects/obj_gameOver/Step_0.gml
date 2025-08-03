/// @desc Go to main menu

enterPressed = InputPressed(INPUT_VERB.ACTION);

if (enterPressed)
{
	audio_play_sound(snd_select, 5, false);
	DoTransition(r_mainmenu, GAME_STATE.MainMenu);
}