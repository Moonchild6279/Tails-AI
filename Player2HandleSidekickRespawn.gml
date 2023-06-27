	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
	Cleanup by javainterface
	*/
	// ----------------------------------	
		
	// Start a timer if we're off the screen

	if(!object_is_onscreen and !IsRespawning) {
		jumpInTimer++
	} else {
		jumpInTimer = 0
	}

	if(jumpInTimer >= 240) {
		// Reset and get into Respawn State
		PlayerReset();
		jumpInTimer = 0;
		IsRespawning = true;
		PosX = MainPlayer.PosX;
		PosY = Camera.PosY - 64 
		AllowCollision = false;
		AllowMovement = false;
		DrawOrder = 4;
		AirTimer = 1800;
		Grounded = false;
	}
	
	// If Main Player is Dead, Get into respawn state

	if(Leader.Death and !Hurt and !Death) {
		jumpInTimer = 0
		Xsp = 0;
		Ysp = 0;
		Gsp = 0;
		FlightState = true;
		AllowCollision = false
		AllowMovement = false
		IsRespawning = true;
		AirTimer = 1800;
	}
