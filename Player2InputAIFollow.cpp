	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
	*/
	// ----------------------------------

			// Initialization
			
			// Initialize some varaibles and Start off by calling the "Player2GetDelayedInput" script
	
			var AngleCheck = Angle + 16 & 224;
			var DistanceCheck =  targetMainPlayerPosX - PosX;
			var CheckGrav = MainPlayer.Grounded;
			var HeightCheck = PosY - targetMainPlayerPosY;
			Player2GetDelayedInput();
	
			
		if !MainPlayer.Death
	{
			// Stopping Inputs by an Offset
	
		if AngleCheck == 0 
		{
			if InputLeft == true // Are we pressing left?
			{
				
				// Initialize a variable that Offset MainPlayer's Position
				var MainPlayerPosXOffestL = MainPlayer.PosX - Offset;
				
				
				// Is our PosX less then our MainPlayer's Position (Including the offest)?
				if PosX < MainPlayerPosXOffestL{
					if Xsp <  0
					{
						InputLeft = false;
					}
				}
			}

			if InputRight == true // Are we pressing Right?
			{
				
				// Initialize a variable that Offset MainPlayer's Position
				var MainPlayerPosXOffestR = MainPlayer.PosX + Offset;
				
				// Is our PosX more then our MainPlayer's Position (Including the offest)?
				if PosX > MainPlayerPosXOffestR
				{
					if Ysp < 0
					{
						InputRight = false;
					}
				}
			}
		}
		
			
			// Offsetting MainPlayerPosX Values


			if CheckGrav == true
			{
				if MainPlayer.Xsp < 2 // Is their speed over then 2?
				{
					if MainPlayer.Xsp > -2 // Is their speed less then -2?
					{
						if MainPlayer.Facing == FlipRight // Are they Facing RIght?
						{
							targetMainPlayerPosX -= PosOffset;	// Offset our MainPlayerPosX Variable 
							}
						else
						{
							targetMainPlayerPosX += PosOffset;	
						}
					}
				}
			}
		
					
			
			// Movement by Distance
		
			// Check our Distance to MainPlayer to determine movement
			
			if DistanceCheck != 0
			{
				if DistanceCheck < 0
				{
					
					
					if DistanceCheck < -DisXMax // Are we too far from our MainPlayer in the Left?
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
				
					if DistanceCheck > DisXMax // Are we too far from our MainPlayer in the Right?
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
			

			// Pushing and Auto Jumping


			// Are we Pushing?
			if Animation == AnimPush
				{
					
					// Start a timer
					autoJumpTimer++
					
				// Stop the timer if the MainPlayer is also Pushing in our direction!
				
				if MainPlayer.Facing == Facing	
					{
					if MainPlayer.Animation == AnimPush
						{
						autoJumpTimer = 0
					}
				}
				
				 // Jump after 30 frames
				 
				if autoJumpTimer > 30
					{
					if Grounded == 1
							{
					//Insert a way to force us a jump!
					}
					timer = 0
					autoJumpTimer = 0
				}
				}
			else
				{
					
					// Are we too low from our MainPlayer?
					
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
								//Insert a way to force us a jump!								
								}
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
			
			
			
			if (GroundLock > 16)
			{
				if Xsp < 8 or Xsp > -8
					{
						/* Go through multiple scripts By this order:

						1. Player2InputAISpindashPt1
						2. Player2InputAISpindashPt2
						3. -> Revert back to this script, Player2InputAIFollow
						*/
						
					}
				
			}

			
	}
