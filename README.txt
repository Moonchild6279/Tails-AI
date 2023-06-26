These script is formatted in a C-Like Format in a CPP file format, DO NOT TRY TO IMPORT THESE DIRECTLY!

Variables Setup


jumpInTimer		= 0; // Used for respawning
autoJumpTimer		= 0; // Used for jumping as AI
targetLeaderPosX	= 0; // Main Player's X Position
targetLeaderPosY	= 0; // Main Player's Y Position
IsRespawning	   	= 0; // Are we Respawning?	

Input Setup for AI
Player2_stateUp 	= 0; 
Player2_stateDown 	= 0;
Player2_stateLeft 	= 0;
Player2_stateRight 	= 0;
Player2_stateJumpPress = 0;
Player2_stateJumpHold = 0;


// Buffer List Setup
Player2_PosID 		 = 0;  // Index
Player2_leaderPosBufferX = []; // List for Main Player's X Position
Player2_leaderPosBufferY = []; // List for Main Player's Y Position

