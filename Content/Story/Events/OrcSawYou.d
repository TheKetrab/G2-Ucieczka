
func void WillCantKillOrcs_SetTrue() {
	WillCantKillOrcsVar = TRUE;
	ff_applyonceext(TransformLoop,1000,-1);
};

func void OrcSawYou_InsertOrc()
{
	var string wp; wp = Npc_GetNearestWP(hero);
	
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	
};
func void ExitToMenuOrcSaw()
{
	View_Close(OrcSawYouBlackScreen);
	View_Delete(OrcSawYouBlackScreen);
	ExitSession();
};

var int TransformPtr;
func void Transform()
{
	if(WillCantKillOrcsVar)
	{
		B_KillNpc(hero);
		TransformPtr = MEM_ReadInt(ESP+4);
	};

};

func void TransformLoop()
{
	if(TransformPtr)
	{
		var c_npc slf; slf = _^(TransformPtr);
		
		if(Hlp_IsValidNpc(slf))
		{
			B_KillNpc(slf);
		};
	};
};

var int OrcSawYouBlackScreen;
func void OrcSawYou() {

	MEM_CallByString("SaveDis");
	OrcSawYou_Activated = TRUE;
	HeroSay_OrcSeenMe();
	OrcSawYou_InsertOrc();
	Snd_Play ("ORC_HAPPY");
	
	Print_GetScreenSize();
	if(!Hlp_IsValidHandle(OrcSawYouBlackScreen))
	{
		OrcSawYouBlackScreen = View_Create(PS_X, PS_Y, 8192 , 8192 );
		View_SetTexture(OrcSawYouBlackScreen,"black.tga");
		View_Open(OrcSawYouBlackScreen);
	};
	
	//Fade_Status = 1;
	ff_applyonceext(ExitToMenuOrcSaw,4000,1);
	//ff_applyonce(OrcSawYou_Active); // in MyLegoFuncs.d

};

func int WillCantKillOrcs() {
	return WillCantKillOrcsVar;
};



func void Kap5FightWithOrc(var C_NPC oth, var C_NPC slf) {

	if (WillCantKillOrcs())										// jesli nie mozesz atakowac orkow
	&& (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))		// i ty uderzyles
	&& ((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)			// orka wojownika
		|| (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSCOUT))			// lub scouta
	{
		OrcSawYou();
	};

};
