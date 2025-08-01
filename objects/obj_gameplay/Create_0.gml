/// @desc Define Game States
enum GAME_STATE
{
	PlayerMove,
	TimelineAction,
	EnemyMove
}
global.gameState = GAME_STATE.PlayerMove;