
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

func void WartaCz1Create()
{
	//Print("WartaCz1Create");
	Wld_InsertNpc(GroznyZebaczWarta1,"NASZ_ZEBACZE_WP_2");
	Wld_InsertNpc(GroznyZebaczWarta2,"NASZ_ZEBACZE_WP_2");
	Wld_InsertNpc(GroznyZebaczWarta3,"NASZ_ZEBACZE_WP_2");
};

func void WartaCz1Atak()
{
	//Print("WartaCz1Atak");
	var C_NPC S1; var C_NPC S2; var C_NPC S3;    	
	S1=Hlp_GetNpc(GroznyZebaczWarta1);
	S2=Hlp_GetNpc(GroznyZebaczWarta2);
	S3=Hlp_GetNpc(GroznyZebaczWarta3);		
	
	
	S1.wp = "OW_DJG_ROCKCAMP_02";
	AI_GotoWP(S1,"OW_DJG_ROCKCAMP_02");
	S2.wp = "OW_DJG_ROCKCAMP_02";
	AI_GotoWP(S2,"OW_DJG_ROCKCAMP_02");	
	S3.wp = "OW_DJG_ROCKCAMP_02";
	AI_GotoWP(S3,"OW_DJG_ROCKCAMP_02");	
	
	Npc_SetTarget(S1,hero);
	Npc_SetTarget(S2,hero);
	Npc_SetTarget(S3,hero);

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

func void WartaCz2Create()
{
	//Print("WartaCz2Create");
	Wld_InsertNpc(DragonSnapperWarta1,"NASZ_ZEBACZE_WP_2");
	Wld_InsertNpc(DragonSnapperWarta2,"NASZ_ZEBACZE_WP_2");
};

func void WartaCz2Atak()
{
	//Print("WartaCz2Atak");
	var C_NPC S1; var C_NPC S2;   	
	S1=Hlp_GetNpc(DragonSnapperWarta1);
	S2=Hlp_GetNpc(DragonSnapperWarta2);	
	
	S1.wp = "OW_DJG_ROCKCAMP_02";
	S2.wp = "OW_DJG_ROCKCAMP_02";
	
	AI_GotoWP(S1,"OW_DJG_ROCKCAMP_02");
	AI_GotoWP(S2,"OW_DJG_ROCKCAMP_02");
	
	Npc_SetTarget(S1,hero);
	Npc_SetTarget(S2,hero);		

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

func void WartaCz3Create()
{
	//Print("WartaCz3Create");
	Wld_InsertNpc(DragonSnapperWarta3,"NASZ_ZEBACZE_WP_2"); // zebacz ktorego sledzimy
	Wld_InsertNpc(DragonSnapperWarta4,"NASZ_ZEBACZE_WP_5"); // przywodca stada
	Wld_InsertNpc(DragonSnapper,"FP_REST_ZEBACZ_01");
	Wld_InsertNpc(GroznyZebacz,"FP_REST_ZEBACZ_02");
	Wld_InsertNpc(GroznyZebacz,"FP_REST_ZEBACZ_03");
	Wld_InsertNpc(Snapper,"FP_REST_ZEBACZ_04");
	Wld_InsertNpc(GroznyZebacz,"FP_REST_ZEBACZ_05");
};

func void WartaCz3Atak()
{
	//Print("WartaCz3Atak");

	var C_NPC S1;
	S1=Hlp_GetNpc(DragonSnapperWarta3);
	
	S1.wp = "NASZ_ZEBACZE_WP_5";
	AI_GotoWP(S1,"NASZ_ZEBACZE_WP_5");

	FF_ApplyOnceExt(WartaCz3Loop,2000,-1); // raz na 2s
};

func void WartaCz3Loop() {

	var C_NPC S1;
	S1=Hlp_GetNpc(DragonSnapperWarta3);
	
	if (Npc_GetDistToWP(hero,"NASZ_ZEBACZE_WP_5") < 1000) // jesli jest przy gniezdzie
	{
		Npc_ClearAIQueue(S1);
		FF_Remove(WartaCz3Loop);
	};
	
	if (Npc_GetDistToNpc(hero,S1)<500) {
		Npc_ClearAIQueue(S1);
		AI_TurnToNpc(S1,hero);
		Npc_SetTarget(S1,hero);
		B_LogEntry (TOPIC_Mysliwy_Warta, "Cholera! Zêbacz zorientowa³ siê, ¿e go œledzê i rzuci³ siê na mnie. Teraz bêdê musia³ sam poszukaæ gniazda.");
		FF_Remove(WartaCz3Loop);
	};
	
};