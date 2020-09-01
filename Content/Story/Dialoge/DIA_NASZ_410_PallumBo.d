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

FUNC VOID DIA_NASZ_410_PallumBo_EXIT_Info()
{
	AI_StopProcessInfos (self);

	var c_npc vangan; vangan = Hlp_GetNpc(NASZ_405_VanGan);
	var c_npc pallumbo; pallumbo = Hlp_GetNpc(NASZ_410_PallumBo);
	vangan.aivar[AIV_LASTTARGET] = NASZ_410_PallumBo;
	pallumbo.aivar[AIV_LASTTARGET] = NASZ_405_VanGan;

	B_Attack (NASZ_405_VanGan, NASZ_410_PallumBo, AR_KILL, 0);
	B_Attack (NASZ_410_PallumBo, NASZ_405_VanGan, AR_KILL, 0);
	
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
	AI_Output (self, other,"DIA_NASZ_410_PallumBo_siema_15_00"); //Kogo my tu mie�?
	AI_Output (self, other,"DIA_NASZ_410_PallumBo_siema_15_01"); //Ty by� przyjaciel m�j wr�g, ty te� by� m�j wr�g. Najpierw ja zabi� Van-Gan, potem ty!
	AI_Output (self, other,"DIA_NASZ_410_PallumBo_siema_15_02"); //ORAK SZAKA!

	B_LogEntry (TOPIC_VanGan_zemsta, "Zacz�o si�. Ten ork jest pot�ny... Chyba nie obejdzie si� bez mojej pomocy.");
	NASZ_410_PallumBo.guild = GIL_ORC;
	Npc_SetTrueGuild (NASZ_410_PallumBo, GIL_ORC);
	Npc_SetTempAttitude (NASZ_410_PallumBo, ATT_HOSTILE);

};
