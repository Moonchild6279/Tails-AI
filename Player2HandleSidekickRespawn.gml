// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player2HandleSidekickRespawn(RespawnType){
	
		if !object_is_onscreen(id) and !IsRespawning
		{
			jumpInTimer++
		}
		else
		{
			jumpInTimer = 0
		}

		if jumpInTimer >= 240
		{
		switch (RespawnType) {
			  
			case 0:
			 
			PlayerReset();
			jumpInTimer = 0;
			IsRespawning = true;
			PosX = Leader.PosX;
			PosY = Camera.PosY - 64;
			AllowCollision = false;
			AllowMovement = false;
			DrawOrder = 4;
			AirTimer = 1800;
			Grounded = false;
			
			break;
			
			case 1:
			
			PlayerReset();
			jumpInTimer = 0;
			IsRespawning = true;
			PosX = Leader.PosX;
			PosY = Leader.PosY + global.Height;
			AllowCollision = false;
			AllowMovement = false;
			DrawOrder = 4;
			AirTimer = 1800;
			Grounded = false;
			
			break;

			}

		}
		
		
		if(Leader.Death and !Hurt and !Death)
		{
			jumpInTimer = 0
			Xsp = 0;
			Ysp = 0;
			Gsp = 0;
			//FlightState = true;
			if (global.Character[PlayerID] = CharTails) Animation = AnimFly;
			if (global.Character[PlayerID] = CharKnuckles) Animation = AnimGlide;
			AllowCollision = false
			AllowMovement = false
			IsRespawning = true;
			AirTimer = 1800;
		}

}