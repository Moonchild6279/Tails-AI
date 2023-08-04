// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player2InputAISpindashPt1(){
	InputUp = false;
	InputDown = false;
	InputLeft = false;
	InputRight = false;
	PressedInputABC = false;
	InputABC = false;
	if GroundLock == 0
	{
		if Grounded == true
		{
			if Xsp < 0.25
			{
				if Xsp > -0.25
				{
					autoJumpTimer = 1
					if Animation != AnimSpindash
					{
						if PosX < targetLeaderPosX
						{
							Facing = FlipRight;
							}
						else{
							Facing = FlipLeft;
						}

						InputDown = true;
						p2InputFunction = 2;
					}
				}
			}
		}
	}
}