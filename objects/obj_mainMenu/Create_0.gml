/// @desc Define Main Menu

// Main Menu
options[0, 0] = "Play";
options[0, 1] = "How to Play";
options[0, 2] = "Credits";
// How To Play
options[1, 0] = 0;
options[1, 1] = 0;
options[1, 2] = "Back";
// Credits
options[2, 0] = 0;
options[2, 1] = 0;
options[2, 2] = "Back";

pos = 0;
menu = 0;
menuSpace = 16;
menuLength = array_length(options[menu]);
menuLowest = 0;
menuHighest = 2;

function MenuJump(_menu, _pos)
{
	menu = _menu;
	pos = _pos;
	
	audio_play_sound(snd_select, 5, false);
	
}

function GetMenuSize()
{
	// Lowest menu pos
	for (var i = 0; i < menuLength; i++)
	{
		if (options[menu, i] != 0 && options[menu, i] != undefined) {menuLowest = i; break;}
	}
	// Highest menu pos
	for (var i = menuLength-1; i >= 0; i--)
	{
		if (options[menu, i] != 0 && options[menu, i] != undefined) {menuHighest = i; break;}
	}
}