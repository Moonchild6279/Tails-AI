
	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
	*/
	// ----------------------------------	


	// Exit if we're not respawing
	if !IsRespawning
	{
		return;
	}
	
	
	// Start getting delayed inputs
	
	Player2GetDelayedInput();


	// Change Animation Base on gravity (Wheather we're underwater or not)

	if Grv = 0.21875
	{
		Animation = AnimFly;
	}
	else
	{
	
		Animation = AnimSwim;
	}

	
	// Init Varaibles

	var temp0 = (targetLeaderPosX - PosX) >> 4;
	var temp1 = temp0;
	//temp0 = temp0 >> 4;


	// Move X Position of AI Based on Distance

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

	// Move Y Position of AI Based on Distance

	PosX += temp0;
	if PosY < targetLeaderPosY
	{
		PosY += 1;
	}

	if PosY > targetLeaderPosY
	{
		PosY -= 1;
	}


	// Once Close enough to Player, Return from Spawning State

		if Leader.Death != true
		{
			if Leader.Drown != true
			{
				if Leader.ForcedRoll != true
				{	

					// Flip the sign of our Y Position
					if temp1 == 0
					{
						temp0 = targetLeaderPosY - PosY;
						if temp0 < 0
						{
							temp0 = temp0 * -1
						}	

						if temp0 < 2
						{

							// -> Reset Player Values Here
							// Stop Respawning
							IsRespawning     = false;

							
						}
					}
				}
			}
		}