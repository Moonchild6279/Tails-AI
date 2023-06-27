	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
		Cleanup by javainterface
	*/
	// ----------------------------------

	// if we are under than 64 in our timer

	if(autoJumpTimer < 64) {
		// Press Down if we aren't, than Spindash every other 15 frames.
		InputDown = true
		var temp0 = autoJumpTimer & 15;
		if(temp0 == 0) {
			PressedInputABC = true
		} else {
			PressedInputABC = false
		}
		autoJumpTimer++
	} else {
		// Let go of A button and Down Button, Return to normal Condition
		autoJumpTimer = 0;
		InputDown = false;
		PressedInputABC = false;
		// -> Revert back to Following state `Player2InputAIFollow()`
	}
