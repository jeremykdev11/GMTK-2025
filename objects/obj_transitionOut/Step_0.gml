/// @desc Update triangles

t1.x = EaseInOutCubic(transitionFrame, t1Start.x, t1End.x - t1Start.x, transitionTime);
t1.y = EaseInOutCubic(transitionFrame, t1Start.y, t1End.y - t1Start.y, transitionTime);

t2.x = EaseInOutCubic(transitionFrame, t2Start.x, t2End.x - t2Start.x, transitionTime);
t2.y = EaseInOutCubic(transitionFrame, t2Start.y, t2End.y - t2Start.y, transitionTime);

transitionFrame++;

if (transitionFrame > transitionTime)
{
	room_goto(targetRoom);
	instance_create_depth(0, 0, depth, obj_transitionIn)
	instance_destroy();
}