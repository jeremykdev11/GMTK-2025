/// @description Insert description here
// You can write your code in this editor
scale = 1;

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

word.starting_format("ft_regular", color);
word.align(fa_center, fa_middle);