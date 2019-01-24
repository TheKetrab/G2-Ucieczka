//by orcwarrior

var int Portal_X;
var int Portal_Y;
var int Portal_Z;

func int Spell_Logic_GotoPortal(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport3");
	IF((Portal_X==0)&&(Portal_Y==0)&&(Portal_Z==0))
	{
		//PutMsg("Za daleko!","font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
		return SPL_Sendstop;	
	};
	
	if (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)
	{
		//AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
		
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
		
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		hiro._zCVob_trafoObjToWorld[3]     = Portal_X; 
		hiro._zCVob_trafoObjToWorld[7]     = Portal_Y; 
		hiro._zCVob_trafoObjToWorld[11]    = Portal_Z;

 		return SPL_SENDCAST;
				
		
	};
	
	return SPL_NEXTLEVEL;
};

func int Spell_Logic_CreatePortal(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport3");
	
	if (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
		
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		Portal_X     = hiro._zCVob_trafoObjToWorld[3];
		Portal_Y     = hiro._zCVob_trafoObjToWorld[7];
		Portal_Z     = hiro._zCVob_trafoObjToWorld[11];
						
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};





// --- --- --- --- --- --- --- --- --- ---
var int Portal2_X;
var int Portal2_Y;
var int Portal2_Z;

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
				
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		hiro._zCVob_trafoObjToWorld[3]     = Portal2_X; 
		hiro._zCVob_trafoObjToWorld[7]     = Portal2_Y; 
		hiro._zCVob_trafoObjToWorld[11]    = Portal2_Z;

 		AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
				
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
				
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		Portal2_X     = hiro._zCVob_trafoObjToWorld[3];
		Portal2_Y     = hiro._zCVob_trafoObjToWorld[7];
		Portal2_Z     = hiro._zCVob_trafoObjToWorld[11];
						
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};