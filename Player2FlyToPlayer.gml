// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player2FlyToPlayer(DelayAmount,SetAnim0,SetAnim1 = SetAnim0){
	if !IsRespawning
	{
		return;
	}
	
	
	Player2GetDelayedInput(DelayAmount);

	if Grv = 0.21875
	{
		Animation = SetAnim0;
	}
	else
	{
	
		Animation = SetAnim1;
	}

	var temp0 = (targetLeaderPosX - PosX) >> 4;
	var temp1 = temp0;
	//temp0 = temp0 >> 4;

	if PosX < targetLeaderPosX
		Facing = FlipRight;
		if temp0 > 12
		{
			temp0 = 12;
		}

		if Leader.Xsp > 0
		{
			temp0 += Leader.Xsp;
		}

		temp0 += 1;
		if temp0 > temp1
		{
			temp0 = temp1;
			temp1 = 0;
		}
	else
	{
		Facing = FlipLeft;
		if temp0 < -12
		{
			temp0 = -12;
		}

		if Leader.Xsp < 0
		{
			temp0 += Leader.Xsp;
		}

		temp0 -= 1
		if temp0 < temp1
		{
			temp0 = temp1;
			temp1 = 0;
		}
	}

	PosX += temp0;
	if PosY < targetLeaderPosY
	{
		PosY += 1;
	}

	if PosY > targetLeaderPosY
	{
		PosY -= 1;
	}

	//if Player.type != TypeName[Death Event]
		if Leader.Death != true
		{
			if Leader.Drown != true
			{
				if Leader.ForcedRoll != true
				{
					if temp1 == 0
					{
						temp0 = targetLeaderPosY - PosY;
						if temp0 < 0
						{
							temp0 = temp0 * -1
						}	

						if temp0 < 2
						{
							PlayerReset();
							PlayerPhysicsHandle();
							Layer			 = Leader.Layer;
							IsRespawning     = false;
						}
					}
				}
			}
		}
	
}
