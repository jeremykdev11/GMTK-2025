/// @desc Define Game States
enum GAME_STATE
{
	Initialize,
	MainMenu,
	PlayerMove,
	TimelineAction,
	EnemyMove,
	LevelUp
}
global.gameState = GAME_STATE.Initialize;

display_set_gui_size(480, 704);

randomize();