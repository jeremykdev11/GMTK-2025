/// @desc Menu Interaction

if (global.gameState == GAME_STATE.MainMenu && !GamePaused())
{
	enterPressed	= InputPressed(INPUT_VERB.ACTION);
	upPressed		= InputPressed(INPUT_VERB.UP);
	downPressed		= InputPressed(INPUT_VERB.DOWN);

	// Get Menu Position
	if (upPressed) pos--;
	if (downPressed) pos++;
	if (pos > menuHighest) pos = menuLowest;
	if (pos < menuLowest) pos = menuHighest;

	// Menu Move Sounds
	if (upPressed || downPressed)
	{
		audio_play_sound(snd_hover, 5, false);
	}
	
	#region Interact with Main Menu
	if (enterPressed)
	{
		switch(menu)
		{
			case 0: // Main Menu
				switch(pos)
				{
					case 0: // Play
						DoTransition(r_gameplay, GAME_STATE.GameLoad);
						audio_play_sound(snd_select, 5, false);
						break;
				
					case 1: // How to Play
						MenuJump(1, 2)
						break;
				
					case 2: // Credits
						MenuJump(2, 2)
						break;
				}
			break;
		
			case 1: // How To Play
				switch(pos)
				{
					case 2: // Back
						MenuJump(0, 1)
						break;
				}
			break;
		
			case 2: // Credits
				switch(pos)
				{
					case 2: // Back
						MenuJump(0, 2)
						break;
				}
			break;
		}
		GetMenuSize();
	}
	#endregion
}