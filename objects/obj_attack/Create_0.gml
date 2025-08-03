/// @desc Generic Action Setup

if place_meeting(x, y, obj_wall) 
{
	instance_destroy()
}

initialDepth = layer_get_depth(layer_get_id("Instances"));

actionDelay = 0;
//image_angle = facingDir * 90;

animFrame = 0;
animDuration = image_number * 2;

if ((instance_exists(obj_player)) && (obj_player.x > x))
{
	image_xscale = -1;
}