	

	// Stop all active inputs!
	InputUp = false;
	InputDown = false;
	InputLeft = false;
	InputRight = false;
	PressedInputABC = false;
	InputABC = false;


	// Crouch, then get into spindash state
	if GroundLock == 0
	{
		if Grounded == true
		{
			if Xsp < 0.25
			{
				if Xsp > -0.25
				{
					// -> From here Move onto Part 2!

					// Face the same direction as our Main Player, Also Start "Jumping"(Pressing the A button)
					autoJumpTimer = 1
					if Animation != AnimSpindash
					{
						if PosX < targetLeaderPosX
						{
							Facing = FlipRight
							}
						else{
							Facing = FlipLeft
						}

						InputDown = true
					}
				}
			}
		}
	}
