// Vector Functions & Constructors

#region Constructors

function Vector(_x, _y) constructor
{
	// Variables
	x = _x;
	y = _y;
	
	#region Functions
	static set = function(_x, _y)
	{
		x = _x;
		y = _y;
	}
	static add = function(_vector)
	{
		x += _vector.x;
		y += _vector.y;
	}
	static subtract = function(_vector)
	{
		x -= _vector.x;
		y -= _vector.y;
	}
	static multiply = function(_scalar)
	{
		x *= _scalar;
		y *= _scalar;
	}
	static divide = function(_scalar)
	{
		x /= _scalar;
		y /= _scalar;
	}
	static negate = function()
	{
		x = -x;
		y = -y;
	}
	
	static getMagnitude = function()
	{
		return point_distance(0, 0, x, y);
    }
	static getDirection = function()
	{
		return point_direction(0, 0, x, y);
	}
	static normalize = function()
	{
		if ((x != 0) || (y != 0))
		{
			var _factor = 1/sqrt((x * x) + (y * y));
			x = _factor * x;
			y = _factor * y;
		}
	}
	static setMagnitude = function(_scalar)
	{
		normalize();
		multiply(_scalar);	
	}	
	static limitMagnitude = function(_limit)
	{
		if (getMagnitude() > _limit) {
			setMagnitude(_limit);
		}
	}
	#endregion
}

function VectorZero() : Vector() constructor
{
	x = 0;
	y = 0;
}

function VectorRandom(_length = 1) : Vector() constructor
{
	var _dir = random(360);
	x = lengthdir_x(_length, _dir);
	y = lengthdir_y(_length, _dir);
}

#endregion

#region Vector Functions

function VectorCopy(_vector)
{
	return new Vector(_vector.x, _vector.y);
}

function VectorSubtract(_vectorA, _vectorB)
{
	return new Vector((_vectorA.x - _vectorB.x), (_vectorA.y - _vectorB.y));
}

function VectorLengthdir(_length, _dir) : Vector() constructor {
    x = lengthdir_x(_length, _dir);
    y = lengthdir_y(_length, _dir);
}

#endregion