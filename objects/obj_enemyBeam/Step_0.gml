/// @description Insert description here
// You can write your code in this editor
if (bottomY < y)
{
	bottomY += 50;
}
else if (topY < y)
{
	topY += 45;
}
else
{
	instance_destroy();
}