
	// ----------------------------------
	/*
	Base code taken from Sonic 1 2013 By Christain Whitehead
	Decomp by Rubberduckycooly
	Reformat by Moonchild
	Cleanup by javainterface
	*/
	// ----------------------------------	

	// Exit if we're not respawing
	if(!IsRespawning) { return; }
	
	// Start getting delayed inputs
	
	Player2GetDelayedInput();

	// Change Animation Base on gravity (Wheather we're underwater or not)

	Animation = AnimSwim;
	if(Grv == 0.21875) {
		Animation = AnimFly;
	}
	
	// Init Varaibles

	var temp0 = (targetLeaderPosX - PosX) >> 4;
	var temp1 = temp0;
	//temp0 = temp0 >> 4;

	// Move X Position of AI Based on Distance

	if(PosX < targetLeaderPosX) {
		Facing = FlipRight;

		temp0 = min(temp0, 12);
		temp0 += max(Leader.Xsp, 0) + 1;

		if(temp0 > temp1) {
			temp0 = temp1;
			temp1 = 0;
		}
	} else {
		Facing = FlipLeft;

		temp0 = max(temp0, -12)
		temp0 += min(Leader.Xsp, 0) - 1; 

		if(temp0 < temp1) {
			temp0 = temp1;
			temp1 = 0;
		}
	}

	// Move Y Position of AI Based on Distance

	PosX += temp0;
	if(PosY < targetLeaderPosY) { PosY += 1; }
	if(PosY > targetLeaderPosY) { PosY -= 1; }

	// Once Close enough to Player, Return from Spawning State

	if(Leader.Death or Leader.Drown or Leader.ForcedRoll or temp1 != 0) { return }
	
	// Make the Y Position Absolute to Prevent Negatives

	temp0 = abs(targetLeaderPosY - PosY);

	// -> Reset Player Values Here
	// Stop Respawning

	if temp0 < 2 { IsRespawning = false; }