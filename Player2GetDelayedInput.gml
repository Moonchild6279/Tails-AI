// Script assets have changed f| v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 f| m|e inf|mation
function Player2GetDelayedInput(DelayAmount){
	
	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
	*/
	// ----------------------------------	

		
		// Do some math to grab our Player Inputs and store it in our Variables

		Player2_stateUp = Player2_stateUp << 1 | Leader.InputUp & 0xffff;
		Player2_stateDown = Player2_stateDown << 1 | Leader.InputDown & 0xffff;
		Player2_stateLeft = Player2_stateLeft << 1 | Leader.InputLeft & 0xffff;
		Player2_stateRight = Player2_stateRight << 1 | Leader.InputRight & 0xffff;
		Player2_stateJumpPress = Player2_stateJumpPress << 1 | Leader.PressedInputABC & 0xffff ;
		Player2_stateJumpHold = Player2_stateJumpHold << 1 | Leader.InputABC & 0xffff ;
		
		
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
		
		

			
			if (!Leader.Death)
			{
			
			Player2_PosID++
			
			if(Player2_PosID > 15)
			{
				Player2_PosID = 0;
			}
			
			Player2_leaderPosBufferX[| Player2_PosID] = Leader.PosX;
			Player2_leaderPosBufferY[| Player2_PosID] = Leader.PosY;

			if (Leader.Grounded = false)
			{
				targetLeaderPosX = Player2_leaderPosBufferX[| Player2_PosID];
				targetLeaderPosY = Player2_leaderPosBufferY[| Player2_PosID];
			}
			else
			{
				targetLeaderPosX = Leader.PosX;
				targetLeaderPosY = Leader.PosY;
			}
		}
	else
	{
		var temp0 = Player2_PosID;
		temp0--;
		if temp0 < 0
		{
			temp0 += 16;
		}

				targetLeaderPosX = Player2_leaderPosBufferX[| temp0];
				targetLeaderPosY = Player2_leaderPosBufferY[| temp0];
	}

}