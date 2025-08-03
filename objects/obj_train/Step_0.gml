/// @description Insert description here
// You can write your code in this editor
animationStep++;

var _sinCurve = sin(animationStep * (pi / 32));

image_yscale = 1 + 0.025 * _sinCurve;

x += 2;

if (x > room_width + sprite_width)
{
	x = -2000
}