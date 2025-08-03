/// @desc Update Animation/Action

depth = -y + initialDepth;

if (!GamePaused()) animFrame++;
if (animFrame > animDuration) instance_destroy();