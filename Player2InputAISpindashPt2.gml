// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player2InputAISpindashPt2(){
if autoJumpTimer < 64
{
		InputDown = true;
		var temp0 = autoJumpTimer & 15;
		if temp0 == 0
		{
			PressedInputABC = true
		}
		else
		{
			PressedInputABC = false
		}
		autoJumpTimer++
}
	else
	{
		autoJumpTimer = 0;
		InputDown = false;
		PressedInputABC = false;
		p2InputFunction = 0;
	}
}