func void ZS_Kazmin ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_Kazmin");
	
	//-------- Wahrnehmungen --------
	Npc_PercEnable  		(self, 	PERC_ASSESSPLAYER,	B_AssessPlayer	);
	Npc_PercEnable			(self,	PERC_ASSESSTALK, 	ZS_Talk		);
	
	//-------- Attitüden --------
	//Npc_SetPermAttitude		(self, ATT_FRIENDLY);

	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func void ZS_XardasDemon_Loop ()
{
	PrintDebugNpc			(PD_TA_LOOP,	"ZS_Kazmin_Loop");
	
	AI_Wait					(self,	1);
};

func void ZS_XardasDemon_End ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_Kazmin_End");
};
