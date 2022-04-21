var int PallumBo_end;

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_410_PallumBo_EXIT   (C_INFO)
{
	npc         = NASZ_410_PallumBo;
	nr          = 999;
	condition   = DIA_NASZ_410_PallumBo_EXIT_Condition;
	information = DIA_NASZ_410_PallumBo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_410_PallumBo_EXIT_Condition()
{
	return TRUE;
};


func void Orc_attack(var c_npc slf, var c_npc oth)
{
	if(Npc_IsInstate(slf,ZS_TALK)  == false)
	{
		Npc_ClearAIQueue(slf);
	};
	AI_standupquick(slf);

	B_ClearPerceptions(slf);
	Npc_SetTarget(slf,oth);
	AI_StartState	(slf, ZS_MM_ATTACK, 0, "");
	Npc_SetTarget(slf,oth);
	AI_Attack(slf);

};

FUNC VOID DIA_NASZ_410_PallumBo_EXIT_Info()
{
	AI_StopProcessInfos (self);

	NASZ_405_VanGan.aivar[AIV_LASTTARGET] = NASZ_410_PallumBo;
	self.aivar[AIV_LASTTARGET] = NASZ_405_VanGan;

	self.guild = GIL_UNDEADORC;
	NPC_SetTrueGuild(self,GIL_UNDEADORC);
	B_SetAttitude (self, ATT_HOSTILE); 
	Npc_SetTempAttitude(self, ATT_HOSTILE);


	Orc_attack(NASZ_405_VanGan,NASZ_410_PallumBo);

	//B_Attack (NASZ_405_VanGan, NASZ_410_PallumBo, AR_KILL, 0);
	

	Npc_SetTarget(self,NASZ_405_VanGan);
	
	PallumBo_end = true;


};


//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_410_PallumBo_siema   (C_INFO)
{
	npc         = NASZ_410_PallumBo;
 	nr          = 1;
 	condition   = DIA_NASZ_410_PallumBo_siema_Condition;
 	information = DIA_NASZ_410_PallumBo_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_410_PallumBo_siema_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_405_VanGan_Arena))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_410_PallumBo_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_410_PallumBo_siema_15_00"); //Kogo my tu mieæ?
	AI_Output (self, other,"DIA_NASZ_410_PallumBo_siema_15_01"); //Ty byæ przyjaciel mój wróg, ty te¿ byæ mój wróg. Najpierw ja zabiæ Van-Gan, potem ty!
	AI_Output (self, other,"DIA_NASZ_410_PallumBo_siema_15_02"); //ORAK SZAKA!

	B_LogEntry (TOPIC_VanGan_zemsta, "Zaczê³o siê. Ten ork jest potê¿ny... Chyba nie obejdzie siê bez mojej pomocy.");
};
