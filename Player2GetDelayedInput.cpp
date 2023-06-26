	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
	*/
	// ----------------------------------	

		
		// Do some math to grab our Player Inputs and store it in our Variables

		Player2_stateUp = Player2_stateUp << 1 | MainPlayer.InputUp & 0xffff;
		Player2_stateDown = Player2_stateDown << 1 | MainPlayer.InputDown & 0xffff;
		Player2_stateLeft = Player2_stateLeft << 1 | MainPlayer.InputLeft & 0xffff;
		Player2_stateRight = Player2_stateRight << 1 | MainPlayer.InputRight & 0xffff;
		Player2_stateJumpPress = Player2_stateJumpPress << 1 | MainPlayer.PressedInputABC & 0xffff ;
		Player2_stateJumpHold = Player2_stateJumpHold << 1 | MainPlayer.InputABC & 0xffff ;
		
		
		//Now... Do more math to convert this to actual inputs to output back! 

		var DelayedUp = Player2_stateUp >> DelayAmount;		
		InputUp = DelayedUp;

		var DelayedDown = Player2_stateDown >> DelayAmount;
		InputDown = DelayedDown;

		var DelayedLeft = Player2_stateLeft >> DelayAmount;
		InputLeft = DelayedLeft;

		var DelayedRight = Player2_stateRight >> DelayAmount;
		InputRight = DelayedRight;

		var DelayedJmpPress = Player2_stateJumpPress >> DelayAmount;
		PressedInputABC = DelayedJmpPress;

		var DelayedJmpHold = Player2_stateJumpHold >> DelayAmount;
		InputABC = DelayedJmpHold ;
		
		

			
			if (!MainPlayer.Death)
			{

			// Increment Index, Limit to 15 (Counting starts at 0, so its 16)
			
			Player2_PosID++
			
			if(Player2_PosID > 15)
			{
				Player2_PosID = 0;
			}

			// Start Storing Player Positions into our arrays
			
			Player2_leaderPosBufferX[| Player2_PosID] = MainPlayer.PosX;
			Player2_leaderPosBufferY[| Player2_PosID] = MainPlayer.PosY;

			if (MainPlayer.Grounded = false)
			{
				// Store array values into our variables to set Main Player position Data

				targetLeaderPosX = Player2_leaderPosBufferX[| Player2_PosID];
				targetLeaderPosY = Player2_leaderPosBufferY[| Player2_PosID];
			}
			else
			{
				// Store values from our Main Player Directly into variables

				targetLeaderPosX = Leader.PosX;
				targetLeaderPosY = Leader.PosY;
			}
		}
	else
	{
		// Reverse Index Increment

		var temp0 = Player2_PosID;
		temp0--;
		if temp0 < 0
		{
			temp0 += 16;
		}
		// Set Varibles to values from array at the reversed index
	
		targetLeaderPosX = Player2_leaderPosBufferX[| temp0];
		targetLeaderPosY = Player2_leaderPosBufferY[| temp0];
	}

