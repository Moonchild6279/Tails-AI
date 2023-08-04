// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player2InputAIFollow(DelayAmount,Offset,PosOffset,DisXMax,DisYMax){
	
	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
	*/
	// ----------------------------------

			#region Initialization
			
			// Initialize some varaibles and Start off by calling the "Player2GetDelayedInput" script
	
			var AngleCheck = Angle + 16 & 224;
			var DistanceCheck =  targetLeaderPosX - PosX;
			var CheckGrav = Leader.Grounded;
			var HeightCheck = PosY - targetLeaderPosY;
			Player2GetDelayedInput(DelayAmount);
	
			#endregion 
		if !Leader.Death
	{
			#region Stopping Inputs by an Offset
	
		if AngleCheck == 0 
		{
			if InputLeft == true // Are we pressing left?
			{
				
				// Initialize a variable that Offset Leader's Position
				var LeaderPosXOffestL = Leader.PosX - Offset;
				
				
				// Is our PosX less then our Leader's Position (Including the offest)?
				if PosX < LeaderPosXOffestL{
					if Xsp <  0
					{
						InputLeft = false;
					}
				}
			}

			if InputRight == true // Are we pressing Right?
			{
				
				// Initialize a variable that Offset Leader's Position
				var LeaderPosXOffestR = Leader.PosX + Offset;
				
				// Is our PosX more then our Leader's Position (Including the offest)?
				if PosX > LeaderPosXOffestR
				{
					if Ysp < 0
					{
						InputRight = false;
					}
				}
			}
		}
		
		#endregion	
					if !Leader.IsCarriedByTails
		{
			#region Offsetting LeaderPosX Values


			if CheckGrav == true
			{
				if Leader.Xsp < 2 // Is their speed over then 2?
				{
					if Leader.Xsp > -2 // Is their speed less then -2?
					{
						if Leader.Facing == FlipRight // Are they Facing RIght?
						{
							targetLeaderPosX -= PosOffset;	// Offset our LeaderPosX Variable 
							}
						else
						{
							targetLeaderPosX += PosOffset;	
						}
					}
				}
			}
		
			#endregion		
			
			#region Movement by Distance
		
			// Check our Distance to Leader to determine movement
			
			if DistanceCheck != 0
			{
				if DistanceCheck < 0
				{
					
					
					if DistanceCheck < -DisXMax // Are we too far from our Leader in the Left?
					{
						
						// Press Left, Stop Pressing Right
						InputRight = false;
						InputLeft = true;
						
					}
				
				// 4/8/23 - This code does nothing benifical, originated from the OG Sonic 1 2013 Code. it's purpose is unknown, however I included it here anyways
				
				if Xsp != 0
					{
						if Facing == FlipLeft
						{
							
							 PosX -= cos(Angle) * 0.0029296875;    
						}
					}


				}
				else
				{
				
					if DistanceCheck > DisXMax // Are we too far from our Leader in the Right?
					{
						
						// Press Right, Stop Pressing Left
						InputLeft = false;
						InputRight = true;
					}
				// 4/8/23 - This code ALSO does nothing benifical, originated from the OG Sonic 1 2013 Code. it's purpose is unknown, however I included it here anyways
					if Xsp != 0
					{
						if Facing == FlipRight
						{
							PosX += cos(Angle) * 0.0029296875;
						}
					}
					

				}
			}
			#endregion

			#region Pushing and Auto Jumping
			

			// Are we Pushing?
			if Animation == AnimPush
				{
					
					// Start the timer
					autoJumpTimer++
					
				// Stop the timer if the Leader is also Pushing in our direction!
				
				if Leader.Facing == Facing	
					{
					if Leader.Animation == AnimPush
						{
						autoJumpTimer = 0
					}
				}
				
				 // Jump after 30 frames
				 
				if autoJumpTimer > 30
					{
					if Grounded == 1
							{
					//Player2AutoJump();
					PressedInputABC = 0xffff;
					InputABC = 0xffff;
					}
					InputABC = 0xffff;
					
					timer = 0
					autoJumpTimer = 0

				}
				}
			else
				{
					
					// Are we too low from our Leader?
					
				if HeightCheck > DisYMax
				{
					// Start the timer
					
					autoJumpTimer++					 
					
					// Jump after 64 frames
					
					if autoJumpTimer > 64			
						{
							if Grounded == true
								{
								
								// Force us to Jump!
								//Player2AutoJump();
								PressedInputABC = 0xffff;
								InputABC = 0xffff;
								
								}
						InputABC = 0xffff;
					
						timer = 0
						autoJumpTimer = 0
						}
						
				}
				else
				{
					// Rest!
					autoJumpTimer = 0
				}
					
			}
			
			#endregion
			
			if (GroundLock > 16)
			{					
				if Xsp < 8 or Xsp > -8
					{
						p2InputFunction = 1;
						
					}
				
			}

			
		}
	}
	
}