/// @description Insert description here
// You can write your code in this editor

var _width = 200;
var _mainSurf = surface_create(_width, 100);


surface_set_target(_mainSurf);
draw_clear_alpha(#d1d5b4, 0);

#region draw

draw_set_font(global.fontL);
word.draw((_width / 2), 50, typist);

#endregion

surface_reset_target();

shader_set(sh_outline);

var _texture = surface_get_texture(_mainSurf);
var _textureWidth  = texture_get_texel_width(_texture);
var _textureHeight = texture_get_texel_height(_texture);
shader_set_uniform_f(u_texture, _textureWidth, _textureHeight);
shader_set_uniform_f_array(u_col, [lighterColor[0], lighterColor[1], lighterColor[2], 1.0]);
shader_set_uniform_f(u_width, 2.0);
shader_set_uniform_f(u_bottom, 1.0);



draw_surface_ext(_mainSurf, x - (_width / 2), y - 50, 1, 1, 0, c_white, 1);
shader_reset();


surface_free(_mainSurf);
