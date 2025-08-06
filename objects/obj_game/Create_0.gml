/// @desc Define Game States
enum GAME_STATE
{
	Initialize,
	MainMenu,
	GameLoad,
	PlayerMove,
	TimelineAction,
	EnemyMove,
	LevelUp,
	GameOver
}
global.gameState = GAME_STATE.Initialize;

display_set_gui_size(480, 704);

randomize();

// Particle Setup

// Particles
global.pSystem = part_system_create_layer(layer, true);
global.dustParticle = part_type_create();

//Dust Particle Info
part_type_sprite(global.dustParticle, spr_walkDust, false, false, false);
part_type_life(global.dustParticle, 20, 30);
part_type_size(global.dustParticle, 0.8, 1, -0.05, 0);

// Font
global.font = font_add_sprite(spr_font, 32, true, 1);
global.fontL = font_add_sprite(spr_fontL, 32, true, 2);