/// @desc Update Game State After Move

if (global.gameState == GAME_STATE.EnemyMove)
{
	enemyMoveFrame++;
	
	var _doneMoving = true;
	with (obj_enemy) if (moving || bumping) _doneMoving = false;
	if (_doneMoving && enemyMoveFrame > enemyMoveDuration)
	{
		SetGameState(GAME_STATE.PlayerMove);
		enemyMoveFrame = 0;
	}
}