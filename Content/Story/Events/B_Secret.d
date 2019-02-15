//Secret LasOC
var int SecretLasOC_1;
var int SecretLasOC_2;
var int SecretLasOC_3;

func void B_Secret_LasOC_1_S1 ()
{
	if (SecretLasOC_1 == FALSE) {

		SecretLasOC = SecretLasOC + 1;
		SecretLasOC_1 = TRUE;
		
		if (SecretLasOC == 3) {
			Wld_SendTrigger ("OPEN_LAS_OC_SECRET_MOVER");
			Snd_Play ("THRILLJINGLE_01"); 
		};
	};
};

func void B_Secret_LasOC_2_S1 ()
{
	if (SecretLasOC_2 == FALSE) {

		SecretLasOC = SecretLasOC + 1;
		SecretLasOC_2 = TRUE;
		
		if (SecretLasOC == 3) {
			Wld_SendTrigger ("OPEN_LAS_OC_SECRET_MOVER");
			Snd_Play ("THRILLJINGLE_01"); 
		};
	};
};

func void B_Secret_LasOC_3_S1 ()
{
	if (SecretLasOC_3 == FALSE) {

		SecretLasOC = SecretLasOC + 1;
		SecretLasOC_3 = TRUE;
		
		if (SecretLasOC == 3) {
			Wld_SendTrigger ("OPEN_LAS_OC_SECRET_MOVER");
			Snd_Play ("THRILLJINGLE_01"); 
		};
	};	
};



//*********************************
// Secret Przelecz
//*********************************
var int SecretPrzelecz_1;
var int SecretPrzelecz_2;
var int SecretPrzelecz_3;
var int SecretPrzelecz_4;
var int SecretPrzelecz_5;

func void B_Secret_Przelecz_1_S1 ()
{
	if (SecretPrzelecz_1 == FALSE) {
		SecretPrzelecz_1 = TRUE;
	};
};

func void B_Secret_Przelecz_2_S1 ()
{
	if (SecretPrzelecz_2 == FALSE) {
		SecretPrzelecz_2 = TRUE;
	};
};

func void B_Secret_Przelecz_3_S1 ()
{
	if (SecretPrzelecz_3 == FALSE) {
		SecretPrzelecz_3 = TRUE;
	};
};

func void B_Secret_Przelecz_4_S1 ()
{
	if (SecretPrzelecz_4 == FALSE) {
		SecretPrzelecz_4 = TRUE;
	};
};

func void B_Secret_Przelecz_5_S1 ()
{
	if (SecretPrzelecz_1 == TRUE) && (SecretPrzelecz_2 == TRUE) && (SecretPrzelecz_3 == TRUE) && (SecretPrzelecz_4 == TRUE)
	{
		Wld_SendTrigger ("SECRET_BRAMA_PRZELECZ");
		Wld_InsertNpc	(Nasz_Potwor,"FP_PRZELECZ_POTWOR"); 
		Wld_InsertItem	(ItNa_TeleportPrzelecz,"FP_INSERT_TELEPORT_PRZELECZ");
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
	}
	else
	{
		Wld_SendTrigger ("SECRET_KOLCE_PRZELECZ");
		B_KillNPC (hero);
	};
};

func int Open_Chest_Przelecz()
{
	if (PotworZabity == TRUE)
	{
		return TRUE;
	}
	else {
	AI_Output (hero, hero,"DIA_NASZ_FunkcjaPrzelecz_55_00"); //Jakaœ magiczna aura blokuje dostêp do skrzyni...
	};
};

//*********************************
// Secret Fort
//*********************************
var int SecretFortWlaczone;
var int SecretFort;

func void B_Secret_Fort_1_S1 ()
{
	if (SecretFort == 0)
	{
		SecretFort = 1;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		
		SecretFort = 0;

	};
};

func void B_Secret_Fort_2_S1 ()
{
	if (SecretFort == 1)
	{
		SecretFort = 2;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_3_S1 ()
{
	if (SecretFort == 2)
	{
		SecretFort = 3;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_4_S1 ()
{
	if (SecretFort == 3)
	{
		SecretFort = 4;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_5_S1 ()
{
	if (SecretFort == 4)
	{
		SecretFort = 5;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_6_S1 ()
{
	if (SecretFort == 5)
	{
		SecretFort = 6;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_7_S1 ()
{
	if (SecretFort == 6)
	{
		SecretFort = 7;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_8_S1 ()
{
	if (SecretFort == 7)
	{
		SecretFort = 8;
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_9_S1 ()
{
	if (SecretFort == 8)
	{
		SecretFort = 0;
		
		if (SecretFortWlaczone == FALSE)
		{
			Wld_SendTrigger ("FORT_2_SCRIPT");
			SecretFortWlaczone = TRUE;
			//PrintScreen	("wlaczone", -1,-1, "font_old_20_white.tga",2);
		}
		else
		{
			Wld_SendTrigger ("FORT_2_SCRIPT");
			SecretFortWlaczone = FALSE;
			//PrintScreen	("wylaczone", -1,-1, "font_old_20_white.tga",2);
		};
	}
	else
	{
		Wld_InsertNpc	(Demon0exp,"LOCATION_19_03_SECOND_ETAGE5"); 

		Wld_PlayEffect("SPELLFX_massdeath",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon0exp, Demon0exp, 0, 0, 0, FALSE );

		SecretFort = 0;
	};
};

func void B_Secret_Fort_10_S1 ()
{
	if (SecretFortWlaczone == FALSE)
	{
		SecretFort = 0;
		Wld_SendTrigger ("FORT_2_SCRIPT");
		SecretFortWlaczone = TRUE;
		//PrintScreen	("wlaczone", -1,-1, "font_old_20_white.tga",2);
	}
	else
	{
		SecretFort = 0;
		Wld_SendTrigger ("FORT_2_SCRIPT");
		SecretFortWlaczone = FALSE;
		//PrintScreen	("wylaczone", -1,-1, "font_old_20_white.tga",2);
	};
};

//*********************************
// Secret Straznik1
//*********************************
var int SecretStraznik1;

func void B_Secret_Straznik1_1_S1 ()
{
	if (SecretStraznik1 == 0) {
		SecretStraznik1 = SecretStraznik1 + 1;
	};
};

func void B_Secret_Straznik1_2_S1 ()
{
	if (SecretStraznik1 == 1) {
		SecretStraznik1 = SecretStraznik1 + 1;
	};
};

func void B_Secret_Straznik1_3_S1 ()
{
	if (SecretStraznik1 == 2) {
		SecretStraznik1 = SecretStraznik1 + 1;
	};
};

func void B_Secret_Straznik1_4_S1 ()
{
	if (SecretStraznik1 == 3) {
		SecretStraznik1 = SecretStraznik1 +1;
	};
};

func void B_Secret_Straznik1_5_S1 ()
{
	if (SecretStraznik1 == 4)
	{
		Wld_SendTrigger ("SECRET_STRAZNIK1_1");
		
	}
	else
	{
		Wld_SendTrigger ("SECRET_STRAZNIK1_2");
		B_KillNPC (hero);
	};
};

//*********************************
// Secret Straznik2
//*********************************

/*func int Przelacznik_Straznik2()
{
	if (Npc_GetDistToWP	(hero, "NASZ_WP_STRAZNIK2") < 50)
	{
		return TRUE;
	}
	else {
		return FALSE;
	};
};*/

//*********************************
// Secret Straznik3
//*********************************

func int SKRZYNIA_STRAZNIK3 ()
{
	if (Npc_GetDistToWP	(hero, "NASZ_WP_STRAZNIK2") < 50) {
	 return TRUE;
	 }
	 else {
	STRAZNIK3 = TRUE;
	};
};



//*********************************
// Xardas OLD
//*********************************

func void Xardas_Old_Spawn_Warrior1_S1 ()
{
	Wld_InsertNpc	(Skeleton_Lord_Xardas_1,"NASZ_XARDAS_OLD_POKOJ_1"); 
	Wld_PlayEffect("spellFX_Fear",  Skeleton_Lord_Xardas_1, Skeleton_Lord_Xardas_1, 0, 0, 0, FALSE );
};
func void Xardas_Old_Spawn_Warrior2_S1 ()
{
	Wld_InsertNpc	(Skeleton_Lord_Xardas_2,"NASZ_XARDAS_OLD_POKOJ_1"); 
	Wld_PlayEffect("spellFX_Fear",  Skeleton_Lord_Xardas_2, Skeleton_Lord_Xardas_2, 0, 0, 0, FALSE );
};
func void Xardas_Old_Spawn_Warrior3_S1 ()
{
	Wld_InsertNpc	(Skeleton_Lord_Xardas_3,"NASZ_XARDAS_OLD_POKOJ_1"); 
	Wld_PlayEffect("spellFX_Fear",  Skeleton_Lord_Xardas_3, Skeleton_Lord_Xardas_3, 0, 0, 0, FALSE );
};

var int XARDAS_OLD_PRZELACZNIK_NIEBIESKI_ONETIME;
var int XARDAS_OLD_PRZELACZNIK_CZARNY_ONETIME;
var int XARDAS_OLD_PRZELACZNIK_COUNTER;
func void Xardas_Old_PRZELACZNIK_S1 ()
{
	if (XARDAS_OLD_PRZELACZNIK_COUNTER >= 2) {
		return;
	};
	

	if (Npc_GetDistToWP(hero,"XARDASOLD_PRZEL_1") < 500)
	&& (XARDAS_OLD_PRZELACZNIK_NIEBIESKI_ONETIME == FALSE)
	{
		XARDAS_OLD_PRZELACZNIK_COUNTER +=1;
		XARDAS_OLD_PRZELACZNIK_NIEBIESKI_ONETIME = TRUE;
		Npc_RemoveInvItems	(hero ,ItNa_NiebieskiKamien, 1);
		Snd_Play ("MFX_TELEKINESIS_STARTINVEST");
	};

	if (Npc_GetDistToWP(hero,"XARDASOLD_PRZEL_2") < 500)
	&& (XARDAS_OLD_PRZELACZNIK_CZARNY_ONETIME == FALSE)
	{
		XARDAS_OLD_PRZELACZNIK_COUNTER +=1;
		XARDAS_OLD_PRZELACZNIK_CZARNY_ONETIME = TRUE;
		Npc_RemoveInvItems	(hero ,ItNa_CzarnyKamien, 1);
		Snd_Play ("MFX_TELEKINESIS_STARTINVEST");
	};	


	if (XARDAS_OLD_PRZELACZNIK_COUNTER == 2)
	{
		Wld_InsertNpc	(DemonLordXardasOld,"XARDASOLD_PRZEL_3"); 
		Wld_PlayEffect("FX_EarthQuake",  DemonLordXardasOld, DemonLordXardasOld, 0, 0, 0, FALSE );
	};

};


var int NodKlifOneTime;
//*******************
func void NOD_KLIF ()
{
	if (NodKlifOneTime == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		NodKlifOneTime = TRUE;
		NieznanyTPActivated = TRUE;
		Npc_RemoveInvItems	(hero ,ItAt_DemonHeart, 1);
		Snd_Play ("MFX_TELEKINESIS_STARTINVEST");
		Wld_SendTrigger ("MOVER_KLIF_1");
		Wld_SendTrigger ("MOVER_KLIF_2");
		Wld_SendTrigger ("MOVER_TP_NIEZNANY");
	};
};

var int TriggerOrcCity01OneTime;
//*******************
func void ORCCITY_01 ()
{
	if (TriggerOrcCity01OneTime == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		TriggerOrcCity01OneTime = TRUE;
		Wld_SendTrigger ("MOVER_ORCCITY_01");
		Wld_SendTrigger ("MOVER_ORCCITY_02");
		Wld_SendTrigger ("MOVER_ORCCITY_03");
		
		B_LogEntry (TOPIC_OrcCity_In, "Cholera! Ziemia siê zatrzês³a i runê³o kilka ska³. Mam nadziejê, ¿e to siê wiêcej nie powtórzy.");
	};
};

var int TriggerOrcCity02OneTime;
//*******************
func void ORCCITY_02 ()
{
	if (TriggerOrcCity02OneTime == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		TriggerOrcCity02OneTime = TRUE;
		Wld_SendTrigger ("MOVER_ORCCITY_04");
		Wld_SendTrigger ("MOVER_ORCCITY_05");
		Wld_PlayEffect("SCIEMNIANIE",  hero, hero, 0, 0, 0, FALSE);
		AI_Teleport	(hero, "NASZ_ORCCITY_PRISON_01");
		Npc_SwitchInventory (hero);
		Snd_Play ("SVM_10_DEAD");
		
		WillCantKillOrcs_SetTrue();
		
		B_LogEntry (TOPIC_OrcCity_In, "... Ale mnie boli ³eb... Co siê sta³o? Gdzie ja jestem? Muszê siê st¹d wydostaæ.");
	};
};


//*******************
func void BARIERA_DAMAGE ()
{
	if (WillMozePrzejscPrzezBariere == FALSE)
	{
		Wld_PlayEffect ("spellFX_RingRitual1", self, self, 0, 0, 0, FALSE);
		B_KillNPC(self);
	};
};





// ***** ***** *****
// PORTALSWITCH
// ***** ***** *****

var int PORTALSWITCH1_OneTime;
func void PORTALSWITCH1_S1 ()
{
	if (PORTALSWITCH1_OneTime == FALSE)
	{
		PORTALSWITCH1_OneTime = TRUE;
		CameraToPortalGoes = TRUE;
		ff_applyonceext(CameraGoesToPortal,1000,-1);
		B_LogEntry (TOPIC_OrcCity_In, "Przekrêci³em prze³¹cznik przy szefach.");
	};
};

var int PORTALSWITCH2_OneTime;
func void PORTALSWITCH2_S1 ()
{
	if (PORTALSWITCH2_OneTime == FALSE)
	{
		PORTALSWITCH2_OneTime = TRUE;
		CameraToPortalGoes = TRUE;
		ff_applyonceext(CameraGoesToPortal,1000,-1);
		B_LogEntry (TOPIC_OrcCity_In, "Przekrêci³em prze³¹cznik w szkole szamanów.");
	};
};

var int PORTALSWITCH3_OneTime;
func void PORTALSWITCH3_S1 ()
{
	if (PORTALSWITCH3_OneTime == FALSE)
	{
		PORTALSWITCH3_OneTime = TRUE;
		CameraToPortalGoes = TRUE;
		ff_applyonceext(CameraGoesToPortal,1000,-1);
		B_LogEntry (TOPIC_OrcCity_In, "Przekrêci³em prze³¹cznik za wielkim szamanem.");
	};
};

// ***** ***** *****

var int TrollsMoverOneTime;
func void FUNC_GATE_TROLLS_S1 ()
{
	if (TrollsMoverOneTime == FALSE)
	{
		Npc_RemoveInvItems (hero, ItNa_Smar, 1);
		TrollsMoverOneTime = TRUE;
		Wld_SendTrigger ("MOVER_TROLLS_1");
		WillOtworzylBrameDlaTeda = TRUE;
		B_LogEntry (TOPIC_Ted_trolls, "Uda³o siê! Krata powinna siê otworzyæ.");

	};
};

var int FuncOpenKrataSmarOneTime;
var int WillOtworzylPrzelacznikSmar;
func int OPEN_KRATA_SMAR()
{
	if (npc_hasitems (hero, ItNa_Smar) >= 1)
	{
		WillOtworzylPrzelacznikSmar = TRUE;
		return TRUE;
	}
	else
	{
		if (WillOtworzylPrzelacznikSmar == FALSE)
		{
			AI_Output (hero, hero,"DIA_NASZ_FunkcjaTrolls_55_00"); //Mechanizm siê zaci¹³...
		};
	
		if (FuncOpenKrataSmarOneTime == FALSE)
		{
			FuncOpenKrataSmarOneTime = TRUE;
			B_LogEntry (TOPIC_Ted_trolls, "Znalaz³em prze³¹cznik, ale nie jestem w stanie go przekrêciæ. Zardzewia³. Gdzieœ w tych ruinach magowie z pewnoœci¹ maj¹ jakiœ sk³adzik ze smarem.");
		};
		
		return FALSE;
	};
};

func void ORCCITYSKRZYNIA_S1 ()
{
	var int OrcCitySkrzyniaOneTime;

	if (OrcCitySkrzyniaOneTime == FALSE)
	{
		Wld_InsertNpc	(OrcScout,"FP_ROAM_ORCCITY_01");
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_02");
	
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_04");
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_05");
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_06");
		
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_16");
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_17");
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_18");
		
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_27");
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_28");
		Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_29");

		OrcCitySkrzyniaOneTime = TRUE;
	};

};



// GRAVEYARD
func void B_Secret_Graveyard_1_S1 ()
{
	Wld_SendTrigger ("MOVER_KOLCE_GRAVEYARD");
	B_KillNPC (hero);
};