/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(0.5);

draw_ellipse(x - 14, y - 5, x + 14, y + 5, false);

draw_set_alpha(1);


var _xOffset = sprite_get_xoffset(sprite_index);
var _yOffset = sprite_get_yoffset(sprite_index);
var _extra = 20;
var _mainSurf = surface_create(sprite_width * 2, (sprite_height * 2) + _extra);


surface_set_target(_mainSurf);
draw_clear_alpha(c_white, 0);

#region character draw

draw_sprite_ext(sprite_index, image_index, 
_xOffset * 2, (_yOffset * 2)  + _extra, 
image_xscale * 2, image_yscale * 2, 0, c_white, 1);

#endregion

surface_reset_target();

shader_set(sh_outline);

var _texture = surface_get_texture(_mainSurf);
var _textureWidth  = texture_get_texel_width(_texture);
var _textureHeight = texture_get_texel_height(_texture);
shader_set_uniform_f(u_texture, _textureWidth, _textureHeight);
shader_set_uniform_f_array(u_col, [1.0, 1.0, 1.0, 1.0]);
shader_set_uniform_f(u_width, 4.0);
shader_set_uniform_f(u_bottom, 0.0);



draw_surface_ext(_mainSurf, x - _xOffset, y - _yOffset - (_extra / 2), 0.5, 0.5, 0, c_white, 1);
shader_reset();


surface_free(_mainSurf);