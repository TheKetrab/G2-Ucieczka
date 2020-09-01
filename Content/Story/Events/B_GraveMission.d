
//******************************************
//		----- Grave 1 -----
//******************************************
var int GraveMission_Grave1_OneTime;

func int GraveMission_Grave1_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave1_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave1_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Rodrica IV.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave1_OneTime = TRUE;
	Wld_SendTrigger ("SCRIPT_MOVER_GRAVE1");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_ROAM_ORC_10");
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 2 -----
//******************************************
var int GraveMission_Grave2_OneTime;

func int GraveMission_Grave2_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave2_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave2_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Pierwszego barbarzyñcy.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave2_OneTime = TRUE;
	Wld_SendTrigger ("SCRIPT_MOVER_GRAVE2");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE2_SKELETON"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 3 -----
//******************************************
var int GraveMission_Grave3_OneTime;

func int GraveMission_Grave3_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave3_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave3_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Hosh-Paka.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave3_OneTime = TRUE;
	Wld_SendTrigger ("SCRIPT_MOVER_GRAVE3");
	Wld_InsertNpc	(OrcShaman_Hosh_Pak_Ghost,"FP_ROAM_HOSHPAK_06"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 4 -----
//******************************************
var int GraveMission_Grave4_OneTime;

func int GraveMission_Grave4_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave4_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave4_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Garonda.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave4_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE4");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE4"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 5 -----
//******************************************
var int GraveMission_Grave5_OneTime;

func int GraveMission_Grave5_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave5_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave5_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Gestatha.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	GraveGestath = TRUE;
	B_GivePlayerXP (100);
	GraveMission_Grave5_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE5");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE5"); 
	//IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1; // TO NIE GROB DO MISJI
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 6 -----
//******************************************
var int GraveMission_Grave6_OneTime;

func int GraveMission_Grave6_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave6_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave6_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Ukita.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave6_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE6");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE6"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 7 -----
//******************************************
var int GraveMission_Grave7_OneTime;

func int GraveMission_Grave7_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave7_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave7_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Blema.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave7_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE7");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE7"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 8 -----
//******************************************
var int GraveMission_Grave8_OneTime;

func int GraveMission_Grave8_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave8_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave8_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Thory.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave8_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE8");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE8"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 9 -----
//******************************************
var int GraveMission_Grave9_OneTime;

func int GraveMission_Grave9_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave9_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave9_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Susan.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave9_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE9");
	Wld_InsertNpc	(Skeleton_Ghost_Immortal,"FP_GRAVE9"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 10 -----
//******************************************
var int GraveMission_Grave10_OneTime;

func int GraveMission_Grave10_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave10_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave10_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Laplace'a.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave10_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE10");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE10"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 11 -----
//******************************************
var int GraveMission_Grave11_OneTime;

func int GraveMission_Grave11_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave11_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave11_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Thorina.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave11_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE11");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE11"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 12 -----
//******************************************
var int GraveMission_Grave12_OneTime;

func int GraveMission_Grave12_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave12_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave12_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Kurokumy.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave12_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE12");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE12"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 13 -----
//******************************************
var int GraveMission_Grave13_OneTime;

func int GraveMission_Grave13_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave13_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave13_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Olimpacosa.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave13_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE13");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE13"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 14 -----
//******************************************
var int GraveMission_Grave14_OneTime;

func int GraveMission_Grave14_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave14_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave14_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Pradziada wilków.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave14_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE14");
	Wld_InsertNpc	(DuchWilk,"FP_GRAVE14"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 15 -----
//******************************************
var int GraveMission_Grave15_OneTime;

func int GraveMission_Grave15_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave15_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave15_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Ketty Duna.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave15_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE15");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE15"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 16 -----
//******************************************
var int GraveMission_Grave16_OneTime;

func int GraveMission_Grave16_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave16_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave16_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Gravitatiusa.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	B_GivePlayerXP (100);
	GraveMission_Grave16_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE16");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE16"); 
	IleGrobowWillPoswiecil = IleGrobowWillPoswiecil + 1;
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 17 -----
//******************************************
var int GraveMission_Grave17_OneTime;

func int GraveMission_Grave17_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave17_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave17_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Melatonixa.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	GraveMelatonix = TRUE;
	B_GivePlayerXP (100);
	GraveMission_Grave17_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE17");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE17"); 
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 18 -----
//******************************************
var int GraveMission_Grave18_OneTime;

func int GraveMission_Grave18_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave18_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave18_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Kap³ana Œmiercionoœnych.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	GraveKaplan = TRUE;
	B_GivePlayerXP (100);
	GraveMission_Grave18_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE18");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE18"); 
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 19 -----
//******************************************
var int GraveMission_Grave19_OneTime;

func int GraveMission_Grave19_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave19_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave19_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Cassem Da-Na'rema.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	GraveCassem = TRUE;
	B_GivePlayerXP (100);
	GraveMission_Grave19_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE19");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE19"); 
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};

//******************************************
//		----- Grave 20 -----
//******************************************
var int GraveMission_Grave20_OneTime;

func int GraveMission_Grave20_Condition ()
{
	if (GraveMissionReady == TRUE) && (GraveMission_Grave20_OneTime == FALSE)
	{
		if (npc_hasitems (hero, ItNa_WodaSwiecona_Adanos) >=1) {
		
			return TRUE;
		}
		
		else {
			HeroSay_NoHolyWater();
		};

	}
	else {
	//	Createinvitems (hero, ItMw_2H_Axe_L_01, 1);
	};
};

func void GraveMission_Grave20_S1 ()
{
	B_LogEntry (TOPIC_Udar_Grave, "Oczyœci³em grób Muga.");
	Npc_RemoveInvItems         (hero, ItNa_WodaSwiecona_Adanos, 1);

	GraveMugo = TRUE;
	B_GivePlayerXP (100);
	GraveMission_Grave20_OneTime = TRUE;
	Wld_SendTrigger ("MOVER_GRAVE20");
	Wld_InsertNpc	(Skeleton_Ghost,"FP_GRAVE20"); 
	WszystkieGrobyAchievement = WszystkieGrobyAchievement + 1;
};



//******************************************
//		----- Grave Brat -----
//******************************************
var int GraveMission_GraveBrat_OneTime;

func int GraveMission_GraveBrat_Condition ()
{
	if (BraciaMissionReady == TRUE)
	{
		return TRUE;
	};

};

func void GraveMission_GraveBrat_S1 ()
{

	B_GivePlayerXP (100);
	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	GraveMission_GraveBrat_OneTime = TRUE;
	Wld_InsertItem (ItNa_KoscBrata,"NASZ_ITEM_BRACIA_5");

};

//******************************************
//		----- Grave Skarb Bagno -----
//******************************************
var int GraveMission_GraveSkarbBagno_OneTime;

func int GraveMission_GraveSkarbBagno_Condition ()
{
	if (WillWieOSkarbieJoru == TRUE)
	{
		return TRUE;
	};

};

func void GraveMission_GraveSkarbBagno_S1 ()
{

	B_GivePlayerXP (500);
	Snd_Play ("THRILLJINGLE_01"); 

	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	GraveMission_GraveSkarbBagno_OneTime = TRUE;
	
	Log_SetTopicStatus (TOPIC_Joru_lutnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Joru_lutnia, "Znalaz³em skarb Joru! A w nim miêdzy innymi dziwny pierœcieñ... Ciekawe, o co z nim chodzi?");
	
	Wld_InsertItem (ItSe_GoldPocket100,"NASZ_ITEM_SKARBJORU_1");
	Wld_InsertItem (ItMi_SilverCandleHolder,"NASZ_ITEM_SKARBJORU_1");
	Wld_InsertItem (ItMi_Addon_WhitePearl,"NASZ_ITEM_SKARBJORU_1");
	Wld_InsertItem (ItNa_Pierscien_Glodu,"NASZ_ITEM_SKARBJORU_1");

};


//******************************************
//		----- Treassure_Kopalnia -----
//******************************************
var int Treassure_Kopalnia_OneTime;

func int Treassure_Kopalnia_Condition ()
{
	if (WillWieOSkrytceKopaczy == TRUE)
	&& (Treassure_Kopalnia_OneTime == FALSE)
	{
		return TRUE;
	};
};

func void Treassure_Kopalnia_S1 ()
{

	B_GivePlayerXP (50);
	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	Treassure_Kopalnia_OneTime = TRUE;
	
	Wld_InsertItem (ItSe_GoldPocket20,"NASZ_ITEM_KOPALNIA_1");
	Wld_InsertItem (ItPo_Health_01,"NASZ_ITEM_KOPALNIA_1");
	Wld_InsertItem (ItPo_Health_01,"NASZ_ITEM_KOPALNIA_1");
	Wld_InsertItem (ItNa_PaczkaZZywnoscia,"NASZ_ITEM_KOPALNIA_1");
	
	
};




//******************************************
//		----- Treassure_Gerold -----
//******************************************
var int Treassure_Gerold1_OneTime;
var int Treassure_Gerold2_OneTime;

func int Treassure_Gerold1_Condition ()
{
	if (WillWieOSkrytceGerolda == TRUE)
	&& (Treassure_Gerold1_OneTime == FALSE)
	{
		return TRUE;
	};
};

func void Treassure_Gerold1_S1 ()
{
	B_GivePlayerXP (50);
	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	Treassure_Gerold1_OneTime = TRUE;
	
	Wld_InsertItem (ItSe_GoldPocket100,"NASZ_ITEM_GEROLD1");
};

func int Treassure_Gerold2_Condition ()
{
	if (WillWieOSkrytceGerolda == TRUE)
	&& (Treassure_Gerold2_OneTime == FALSE)
	{
		return TRUE;
	};
};

func void Treassure_Gerold2_S1 ()
{
	B_GivePlayerXP (50);
	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	Treassure_Gerold2_OneTime = TRUE;
	
	Wld_InsertItem (ItSe_GoldPocket100,"NASZ_ITEM_GEROLD2");
};