// by orcwarrior, modified by TheKetrab

var int Portal_X;
var int Portal_Y;
var int Portal_Z;


var int GotoPortalDelay_VAR;
func void GotoPortalDelay() {

	if (GotoPortalDelay_VAR < 3)
	{
		GotoPortalDelay_VAR += 1;
	}
	else
	{
		GotoPortalDelay_VAR = 0;
		
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		hiro._zCVob_trafoObjToWorld[3]     = Portal_X; 
		hiro._zCVob_trafoObjToWorld[7]     = Portal_Y; 
		hiro._zCVob_trafoObjToWorld[11]    = Portal_Z;
		
 		AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );

		FF_Remove(GotoPortalDelay);
	};
};

func int Spell_Logic_GotoPortal(var int manaInvested)
{
	if ((Portal_X == 0) && (Portal_Y == 0) && (Portal_Z == 0))
	{
		return SPL_SENDSTOP;	
	};
	
	if (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;		
		FF_ApplyOnceExt (GotoPortalDelay, 500, -1); //raz na 0,5s
		
 		return SPL_SENDCAST;		
	};
	
	return SPL_NEXTLEVEL;
};

func void SavePortalPosition()
{
	var ocnpc hiro; hiro = hlp_getnpc(self);
	Portal_X     = hiro._zCVob_trafoObjToWorld[3];
	Portal_Y     = hiro._zCVob_trafoObjToWorld[7];
	Portal_Z     = hiro._zCVob_trafoObjToWorld[11];
};

func int Spell_Logic_CreatePortal(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport3");
	
	if (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
		SavePortalPosition();
		//var int playerId;
		//playerID = Hlp_GetInstanceID(hero);
		//var ocnpc hiro; hiro = hlp_getnpc(playerID);
		//Portal_X     = hiro._zCVob_trafoObjToWorld[3];
		//Portal_Y     = hiro._zCVob_trafoObjToWorld[7];
		//Portal_Z     = hiro._zCVob_trafoObjToWorld[11];
		//Ai_WaitMS(self,1500);
		//AI_Function(self,SavePortalPosition);
						
		return SPL_SENDCAST;
	};
	return SPL_SENDCAST;
	
	return SPL_NEXTLEVEL;
};





// --- --- --- --- --- --- --- --- --- ---
var int Portal2_X;
var int Portal2_Y;
var int Portal2_Z;

func void SavePortalPosition2()
{
	var ocnpc hiro; hiro = hlp_getnpc(self);
	Portal2_X     = hiro._zCVob_trafoObjToWorld[3];
	Portal2_Y     = hiro._zCVob_trafoObjToWorld[7];
	Portal2_Z     = hiro._zCVob_trafoObjToWorld[11];
};

var int GotoPortal2Delay_VAR;
func void GotoPortal2Delay() {

	if (GotoPortal2Delay_VAR < 3)
	{
		GotoPortal2Delay_VAR += 1;
	}
	else
	{
		GotoPortal2Delay_VAR = 0;
		
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		hiro._zCVob_trafoObjToWorld[3]     = Portal2_X; 
		hiro._zCVob_trafoObjToWorld[7]     = Portal2_Y; 
		hiro._zCVob_trafoObjToWorld[11]    = Portal2_Z;
		
 		AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
		
		
		FF_Remove(GotoPortal2Delay);
	};
};

func int Spell_Logic_GotoPortal2(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport3");
	IF((Portal2_X==0)&&(Portal2_Y==0)&&(Portal2_Z==0))
	{
		//PutMsg("Za daleko!","font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
		return SPL_Sendstop;	
	};
	
	if (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
		FF_ApplyOnceExt (GotoPortal2Delay, 500, -1); //raz na 0,5s
		
 		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func int Spell_Logic_CreatePortal2(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport3");
	
	if (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
				
		SavePortalPosition2();
		
		
		Ai_WaitMS(self,1500);		
		
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};