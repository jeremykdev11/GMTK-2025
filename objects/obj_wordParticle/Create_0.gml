/// @description Insert description here
// You can write your code in this editor
scale = 1;

var _colorOffset = 60;
lighterColor = [(color_get_red(color) + _colorOffset) / 255, (color_get_green(color) + _colorOffset) / 255, (color_get_blue(color) + _colorOffset) / 255];

duration = 25;
typeSpeed = string_length(wordString)/duration * 2;

riseSpeed = 1.2;

typist = scribble_typist();
typist.in(typeSpeed, 0);

//wordLength = string_length(wordString) / typeSpeed;

alarm[0] = duration * 2;

wordString = "[wave]" + wordString;
word = scribble(wordString);

word.transform(scale, scale, 0);

//word.starting_format("ft_large", color);
word.align(fa_center, fa_middle);

#region shader 

u_texture = shader_get_uniform(sh_outline, "texture_Pixel");
u_col = shader_get_uniform(sh_outline, "col");
u_width = shader_get_uniform(sh_outline, "width");
u_bottom = shader_get_uniform(sh_outline, "bottom");

#endregion