
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_EXIT   (C_INFO)
{
	npc         = NASZ_888_Film;
	nr          = 999;
	condition   = DIA_NASZ_888_Film_EXIT_Condition;
	information = DIA_NASZ_888_Film_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_888_Film_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Cam1
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_Cam1   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 1;
 	condition   = DIA_NASZ_888_Film_Cam1_Condition;
 	information = DIA_NASZ_888_Film_Cam1_Info;
 	permanent   = TRUE;
 	description = "Kamera 1";
};

FUNC INT DIA_NASZ_888_Film_Cam1_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_Cam1_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam1);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam1, DIALOG_BACK, DIA_NASZ_888_Film_Cam1_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam1, "Cam", DIA_NASZ_888_Film_Cam1_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam1, "Function", DIA_NASZ_888_Film_Cam1_Function);

};

FUNC VOID DIA_NASZ_888_Film_Cam1_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam1);
};

FUNC VOID DIA_NASZ_888_Film_Cam1_Cam()
{
	FilmIdzie = 1;
	ff_applyonceExt(Film,1000,-1);
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_Cam1_Function()
{
	B_StartOtherRoutine (NASZ_110_Keroloth,"Scena1");
	Info_ClearChoices (DIA_NASZ_888_Film_Cam1);
};

//*********************************************************************
//	Cam2
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_Cam2   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 2;
 	condition   = DIA_NASZ_888_Film_Cam2_Condition;
 	information = DIA_NASZ_888_Film_Cam2_Info;
 	permanent   = TRUE;
 	description = "Kamera 2";
};

FUNC INT DIA_NASZ_888_Film_Cam2_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_Cam2_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam2);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam2, DIALOG_BACK, DIA_NASZ_888_Film_Cam2_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam2, "Cam", DIA_NASZ_888_Film_Cam2_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam2, "Function", DIA_NASZ_888_Film_Cam2_Function);

};

FUNC VOID DIA_NASZ_888_Film_Cam2_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam2);
};

FUNC VOID DIA_NASZ_888_Film_Cam2_Cam()
{
	FilmIdzie = 2;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_Cam2_Function()
{
	Wld_SendTrigger ("MOVER_OGIEN_ZAMEK_1");
	Info_ClearChoices (DIA_NASZ_888_Film_Cam2);
};

//*********************************************************************
//	Cam3
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_Cam3   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 3;
 	condition   = DIA_NASZ_888_Film_Cam3_Condition;
 	information = DIA_NASZ_888_Film_Cam3_Info;
 	permanent   = TRUE;
 	description = "Kamera 3";
};

FUNC INT DIA_NASZ_888_Film_Cam3_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_Cam3_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam3);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam3, DIALOG_BACK, DIA_NASZ_888_Film_Cam3_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam3, "Cam", DIA_NASZ_888_Film_Cam3_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam3, "Function", DIA_NASZ_888_Film_Cam3_Function);

};

FUNC VOID DIA_NASZ_888_Film_Cam3_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam3);
};

FUNC VOID DIA_NASZ_888_Film_Cam3_Cam()
{
	FilmIdzie = 3;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_Cam3_Function()
{
	//Wld_SendTrigger ("MOVER_OGIEN_ZAMEK_1");
	Info_ClearChoices (DIA_NASZ_888_Film_Cam3);
};

//*********************************************************************
//	Cam4
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_Cam4   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 4;
 	condition   = DIA_NASZ_888_Film_Cam4_Condition;
 	information = DIA_NASZ_888_Film_Cam4_Info;
 	permanent   = TRUE;
 	description = "FILM Scena 3";
};

FUNC INT DIA_NASZ_888_Film_Cam4_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_Cam4_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam4);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam4, DIALOG_BACK, DIA_NASZ_888_Film_Cam4_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam4, "Cam", DIA_NASZ_888_Film_Cam4_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam4, "Function", DIA_NASZ_888_Film_Cam4_Function);

};

FUNC VOID DIA_NASZ_888_Film_Cam4_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam4);
};

FUNC VOID DIA_NASZ_888_Film_Cam4_Cam()
{
	FilmIdzie = 4;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_Cam4_Function()
{
	//Wld_SendTrigger ("MOVER_OGIEN_ZAMEK_1");
	Info_ClearChoices (DIA_NASZ_888_Film_Cam4);
};

//*********************************************************************
//	Cam5
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_Cam5   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 5;
 	condition   = DIA_NASZ_888_Film_Cam5_Condition;
 	information = DIA_NASZ_888_Film_Cam5_Info;
 	permanent   = TRUE;
 	description = "FILM Scena 4";
};

FUNC INT DIA_NASZ_888_Film_Cam5_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_Cam5_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam5);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam5, DIALOG_BACK, DIA_NASZ_888_Film_Cam5_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam5, "Cam", DIA_NASZ_888_Film_Cam5_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam5, "Function", DIA_NASZ_888_Film_Cam5_Function);

};

FUNC VOID DIA_NASZ_888_Film_Cam5_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam5);
};

FUNC VOID DIA_NASZ_888_Film_Cam5_Cam()
{
	FilmIdzie = 5;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_Cam5_Function()
{
	Wld_InsertNpc	(NASZ_221_Benito,"OW_MINE2_STRF");
	B_StartOtherRoutine (NASZ_221_Benito, "Film1");
	Info_ClearChoices (DIA_NASZ_888_Film_Cam5);
};

//*********************************************************************
//	Cam6
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_Cam6   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 6;
 	condition   = DIA_NASZ_888_Film_Cam6_Condition;
 	information = DIA_NASZ_888_Film_Cam6_Info;
 	permanent   = TRUE;
 	description = "FILM Scena 5";
};

FUNC INT DIA_NASZ_888_Film_Cam6_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_Cam6_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam6);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam6, DIALOG_BACK, DIA_NASZ_888_Film_Cam6_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam6, "Cam", DIA_NASZ_888_Film_Cam6_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_Cam6, "Function", DIA_NASZ_888_Film_Cam6_Function);

};

FUNC VOID DIA_NASZ_888_Film_Cam6_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_Cam6);
};

FUNC VOID DIA_NASZ_888_Film_Cam6_Cam()
{
	FilmIdzie = 6;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_Cam6_Function()
{

	Info_ClearChoices (DIA_NASZ_888_Film_Cam6);
};

//*********************************************************************
//	FilmOutroCam1
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_FilmOutroCam1   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 6;
 	condition   = DIA_NASZ_888_Film_FilmOutroCam1_Condition;
 	information = DIA_NASZ_888_Film_FilmOutroCam1_Info;
 	permanent   = TRUE;
 	description = "FILMOUTRO Scena 1";
};

FUNC INT DIA_NASZ_888_Film_FilmOutroCam1_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam1_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam1);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam1, DIALOG_BACK, DIA_NASZ_888_Film_FilmOutroCam1_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam1, "Cam", DIA_NASZ_888_Film_FilmOutroCam1_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam1, "Function", DIA_NASZ_888_Film_FilmOutroCam1_Function);

};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam1_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam1);
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam1_Cam()
{
	Wld_SendTrigger ("UJECIE1");
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam1_Function()
{
	B_StartOtherRoutine(NASZ_010_Monastir,"UltraFinal");
	B_StartOtherRoutine(NASZ_015_Rudolf,"UltraFinal");
	B_StartOtherRoutine(NASZ_101_Korth,"UltraFinal");
	B_StartOtherRoutine(NASZ_106_Jan,"UltraFinal");
	B_StartOtherRoutine(NASZ_109_Rethon,"UltraFinal");
	B_StartOtherRoutine(NASZ_110_Keroloth,"UltraFinal");
	B_StartOtherRoutine(NASZ_115_Kurgan,"UltraFinal");
	B_StartOtherRoutine(NASZ_119_Udar,"UltraFinal");
	B_StartOtherRoutine(NASZ_201_Erak,"UltraFinal");
	B_StartOtherRoutine(NASZ_215_Kivo,"UltraFinal");
	B_StartOtherRoutine(NASZ_218_Ammann,"UltraFinal");
	
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam1);
};

//*********************************************************************
//	FilmOutroCam2
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_FilmOutroCam2   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 6;
 	condition   = DIA_NASZ_888_Film_FilmOutroCam2_Condition;
 	information = DIA_NASZ_888_Film_FilmOutroCam2_Info;
 	permanent   = TRUE;
 	description = "FILMOUTRO Scena 2";
};

FUNC INT DIA_NASZ_888_Film_FilmOutroCam2_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam2_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam2);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam2, DIALOG_BACK, DIA_NASZ_888_Film_FilmOutroCam2_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam2, "Cam", DIA_NASZ_888_Film_FilmOutroCam2_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam2, "Function", DIA_NASZ_888_Film_FilmOutroCam2_Function);

};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam2_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam2);
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam2_Cam()
{
	B_StartOtherRoutine(NASZ_010_Monastir,"Scena2Goal");
	B_StartOtherRoutine(NASZ_015_Rudolf,"Scena2Goal");
	B_StartOtherRoutine(NASZ_101_Korth,"Scena2Goal");
	B_StartOtherRoutine(NASZ_106_Jan,"Scena2Goal");
	B_StartOtherRoutine(NASZ_109_Rethon,"Scena2Goal");
	B_StartOtherRoutine(NASZ_110_Keroloth,"Scena2Goal");
	B_StartOtherRoutine(NASZ_115_Kurgan,"Scena2Goal");
	B_StartOtherRoutine(NASZ_119_Udar,"Scena2Goal");
	B_StartOtherRoutine(NASZ_201_Erak,"Scena2Goal");
	B_StartOtherRoutine(NASZ_215_Kivo,"Scena2Goal");
	B_StartOtherRoutine(NASZ_218_Ammann,"Scena2Goal");
	
	AI_StopProcessInfos	( self );
	Wld_SendTrigger ("UJECIE2");
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam2_Function()
{
	B_StartOtherRoutine(NASZ_010_Monastir,"Scena2");
	B_StartOtherRoutine(NASZ_015_Rudolf,"Scena2");
	B_StartOtherRoutine(NASZ_101_Korth,"Scena2");
	B_StartOtherRoutine(NASZ_106_Jan,"Scena2");
	B_StartOtherRoutine(NASZ_109_Rethon,"Scena2");
	B_StartOtherRoutine(NASZ_110_Keroloth,"Scena2");
	B_StartOtherRoutine(NASZ_115_Kurgan,"Scena2");
	B_StartOtherRoutine(NASZ_119_Udar,"Scena2");
	B_StartOtherRoutine(NASZ_201_Erak,"Scena2");
	B_StartOtherRoutine(NASZ_215_Kivo,"Scena2");
	B_StartOtherRoutine(NASZ_218_Ammann,"Scena2");
	
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam2);
};


//*********************************************************************
//	FilmOutroCam5
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_FilmOutroCam5   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 6;
 	condition   = DIA_NASZ_888_Film_FilmOutroCam5_Condition;
 	information = DIA_NASZ_888_Film_FilmOutroCam5_Info;
 	permanent   = TRUE;
 	description = "FILMOUTRO Scena 5";
};

FUNC INT DIA_NASZ_888_Film_FilmOutroCam5_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam5_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam5);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam5, DIALOG_BACK, DIA_NASZ_888_Film_FilmOutroCam5_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam5, "Cam", DIA_NASZ_888_Film_FilmOutroCam5_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam5, "Function", DIA_NASZ_888_Film_FilmOutroCam5_Function);

};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam5_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam5);
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam5_Cam()
{
	B_StartOtherRoutine(NASZ_010_Monastir,"Scena5Goal");
	B_StartOtherRoutine(NASZ_015_Rudolf,"Scena5Goal");
	B_StartOtherRoutine(NASZ_101_Korth,"Scena5Goal");
	B_StartOtherRoutine(NASZ_106_Jan,"Scena5Goal");
	B_StartOtherRoutine(NASZ_109_Rethon,"Scena5Goal");
	B_StartOtherRoutine(NASZ_110_Keroloth,"Scena5Goal");
	B_StartOtherRoutine(NASZ_115_Kurgan,"Scena5Goal");
	B_StartOtherRoutine(NASZ_119_Udar,"Scena5Goal");
	B_StartOtherRoutine(NASZ_201_Erak,"Scena5Goal");
	B_StartOtherRoutine(NASZ_215_Kivo,"Scena5Goal");
	B_StartOtherRoutine(NASZ_218_Ammann,"Scena5Goal");
	B_StartOtherRoutine(NASZ_220_Kirgo,"Scena5Goal");
	B_StartOtherRoutine(NASZ_103_Johny,"Scena5Goal");
	B_StartOtherRoutine(NASZ_114_Hokurn,"Scena5Goal");
	B_StartOtherRoutine(NASZ_117_Fed,"Scena5Goal");
	B_StartOtherRoutine(NASZ_124_Bron,"Scena5Goal");
	B_StartOtherRoutine(NASZ_203_Tabuk,"Scena5Goal");
	B_StartOtherRoutine(NASZ_204_Vick,"Scena5Goal");
	B_StartOtherRoutine(NASZ_216_Aran,"Scena5Goal");
	B_StartOtherRoutine(NASZ_219_Dick,"Scena5Goal");



	AI_StopProcessInfos	( self );

};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam5_Function()
{
	B_StartOtherRoutine(NASZ_010_Monastir,"Scena5");
	B_StartOtherRoutine(NASZ_015_Rudolf,"Scena5");
	B_StartOtherRoutine(NASZ_101_Korth,"Scena5");
	B_StartOtherRoutine(NASZ_106_Jan,"Scena5");
	B_StartOtherRoutine(NASZ_109_Rethon,"Scena5");
	B_StartOtherRoutine(NASZ_110_Keroloth,"Scena5");
	B_StartOtherRoutine(NASZ_115_Kurgan,"Scena5");
	B_StartOtherRoutine(NASZ_119_Udar,"Scena5");
	B_StartOtherRoutine(NASZ_201_Erak,"Scena5");
	B_StartOtherRoutine(NASZ_215_Kivo,"Scena5");
	B_StartOtherRoutine(NASZ_218_Ammann,"Scena5");
	B_StartOtherRoutine(NASZ_220_Kirgo,"Scena5");
	B_StartOtherRoutine(NASZ_103_Johny,"Scena5");
	B_StartOtherRoutine(NASZ_114_Hokurn,"Scena5");
	B_StartOtherRoutine(NASZ_117_Fed,"Scena5");
	B_StartOtherRoutine(NASZ_124_Bron,"Scena5");
	B_StartOtherRoutine(NASZ_203_Tabuk,"Scena5");
	B_StartOtherRoutine(NASZ_204_Vick,"Scena5");
	B_StartOtherRoutine(NASZ_216_Aran,"Scena5");
	B_StartOtherRoutine(NASZ_219_Dick,"Scena5");
	
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam5);
};

//*********************************************************************
//	FilmOutroCam6
//*********************************************************************
INSTANCE DIA_NASZ_888_Film_FilmOutroCam6   (C_INFO)
{
	npc         = NASZ_888_Film;
 	nr          = 6;
 	condition   = DIA_NASZ_888_Film_FilmOutroCam6_Condition;
 	information = DIA_NASZ_888_Film_FilmOutroCam6_Info;
 	permanent   = TRUE;
 	description = "FILMOUTRO Scena 6";
};

FUNC INT DIA_NASZ_888_Film_FilmOutroCam6_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam6_Info()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam6);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam6, DIALOG_BACK, DIA_NASZ_888_Film_FilmOutroCam6_BACK);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam6, "Cam", DIA_NASZ_888_Film_FilmOutroCam6_Cam);
		Info_AddChoice	  (DIA_NASZ_888_Film_FilmOutroCam6, "Function", DIA_NASZ_888_Film_FilmOutroCam6_Function);

};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam6_BACK()
{
	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam6);
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam6_Cam()
{
	Wld_SendTrigger ("UJECIE6");
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_888_Film_FilmOutroCam6_Function()
{

	Info_ClearChoices (DIA_NASZ_888_Film_FilmOutroCam6);
};