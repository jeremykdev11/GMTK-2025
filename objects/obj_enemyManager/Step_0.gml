/// @desc Update Game State After Move

if (global.gameState == GAME_STATE.EnemyMove)
{
	var _doneMoving = true;
	with (obj_enemy) if (moving || attacking) _doneMoving = false;
	if _doneMoving SetGameState(GAME_STATE.PlayerMove);
}