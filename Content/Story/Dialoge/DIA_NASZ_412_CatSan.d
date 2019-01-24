//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_EXIT   (C_INFO)
{
	npc         = NASZ_412_CatSan;
	nr          = 999;
	condition   = DIA_NASZ_412_CatSan_EXIT_Condition;
	information = DIA_NASZ_412_CatSan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_412_CatSan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_412_CatSan_EXIT_Info()
{
	AI_StopProcessInfos (self);

};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_siema   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 1;
 	condition   = DIA_NASZ_412_CatSan_siema_Condition;
 	information = DIA_NASZ_412_CatSan_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_412_CatSan_siema_Condition()
{
	return TRUE;

};

FUNC VOID DIA_NASZ_412_CatSan_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_412_CatSan_siema_15_00"); //Obcy!
	AI_Output (other, self,"DIA_NASZ_412_CatSan_siema_15_01"); //Co ty tutaj robisz, yy... duchu?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_siema_15_02"); //Nie�atwo to ubra� w s�owa.

};

//*********************************************************************
//	Info ToZnaczy
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_ToZnaczy   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 2;
 	condition   = DIA_NASZ_412_CatSan_ToZnaczy_Condition;
 	information = DIA_NASZ_412_CatSan_ToZnaczy_Info;
 	permanent   = FALSE;
	description = "Co masz na my�li?";
};

FUNC INT DIA_NASZ_412_CatSan_ToZnaczy_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_412_CatSan_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_412_CatSan_ToZnaczy_Info()
{
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_00"); //Co masz na my�li?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_01"); //C�... Jestem stra�nikiem tej fortecy.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_02"); //Ale jestem te� wi�niem!
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_03"); //Pewnie jaka� magiczna aura nie pozwala ci opu�ci� tego budynku i musisz do ko�ca �wiata czuwa� tutaj, tak?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_04"); //Bzdura! To m�j dom, moje posiad�o�ci. Kiedy� rz�dzi� tu dobry Lord Tymorisin. A teraz orkowie sprofanowali moje skarby...
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_05"); //I nie mo�esz ich po prostu wykurzy� u�ywaj�c czar�w?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_06"); //To nie takie proste, cz�owieczku. Wyczuwam magi� jakiego� pot�nego szamana, kt�ry ogranicza si�� moich czar�w.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_07"); //Musz� dosta� si� na g�r�. Jak otworzy� t� krat�, kt�ra blokuje wyj�cie?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_08"); //Bardzo prosto: wystarczy wypowiedzie� zakl�cie. Osobi�cie zamkn��em t� krat� i tylko ja jestem w stanie j� ponownie otworzy�.

	B_LogEntry (TOPIC_Keroloth_Wojna, "Duch Cat-San zamkn�� krat� i nie mog� i�� dalej. Musz� zrobi� co�, �eby j� otworzy�!");
};

//*********************************************************************
//	Info Otworzysz
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_Otworzysz   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 3;
 	condition   = DIA_NASZ_412_CatSan_Otworzysz_Condition;
 	information = DIA_NASZ_412_CatSan_Otworzysz_Info;
 	permanent   = FALSE;
	description = "Otworzysz dla mnie krat�?";
};

FUNC INT DIA_NASZ_412_CatSan_Otworzysz_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_412_CatSan_ToZnaczy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_412_CatSan_Otworzysz_Info()
{
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Otworzysz_15_00"); //Otworzysz dla mnie krat�?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Otworzysz_15_01"); //Nie zrobi� tego. Bez swojego miecza jestem zbyt s�aby, by ryzykowa� atak ork�w.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Otworzysz_15_02"); //Ale ja musz� si� tam dosta�... AAAH!

	Log_CreateTopic (TOPIC_CatSan_ostrze, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_CatSan_ostrze, LOG_RUNNING);
	B_LogEntry (TOPIC_CatSan_ostrze, "W g�rskiej fortecy spotka�em ducha. Orkowie zaj�li jego posiad�o�ci, a on sam zamkn�� si� w komnacie. Otworzy krat� tylko, je�li przynios� mu jego miecz.");

};

//*********************************************************************
//	Info Przyniose
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_Przyniose   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 4;
 	condition   = DIA_NASZ_412_CatSan_Przyniose_Condition;
 	information = DIA_NASZ_412_CatSan_Przyniose_Info;
 	permanent   = FALSE;
	description = "Przynios� ci ten ca�y miecz.";
};

FUNC INT DIA_NASZ_412_CatSan_Przyniose_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_412_CatSan_Otworzysz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_412_CatSan_Przyniose_Info()
{
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Przyniose_15_00"); //Przynios� ci ten ca�y miecz.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Przyniose_15_01"); //Powiedz tylko, gdzie mam go szuka�?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Przyniose_15_02"); //Widzisz te dwie d�wignie za mn�?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Przyniose_15_03"); //Otwieraj� przej�cia do ukrytych komnat. Tylko uwa�aj, zamkn��em za nimi kilku ork�w, kt�rzy chcieli posieka� mnie - ducha - na kawa�ki.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Przyniose_15_04"); //My�l�, �e gdzie� tam, wieki temu schowa�em Ostrze Gildii San.
	
	B_LogEntry (TOPIC_CatSan_ostrze, "Ostrze Gildii San jest prawdopodobnie schowane gdzie� w ukrytych komnatach, do kt�rych przej�cia otwieraj� prze��czniki.");

};

//*********************************************************************
//	Info Wiezien
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_Wiezien   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 5;
 	condition   = DIA_NASZ_412_CatSan_Wiezien_Condition;
 	information = DIA_NASZ_412_CatSan_Wiezien_Info;
 	permanent   = FALSE;
	description = "Wspomina�e�, �e jeste� wi�niem...";
};

FUNC INT DIA_NASZ_412_CatSan_Wiezien_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_412_CatSan_ToZnaczy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_412_CatSan_Wiezien_Info()
{
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Wiezien_15_00"); //Wspomina�e�, �e jeste� wi�niem...
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Wiezien_15_01"); //Tak, na Beliara! Jestem.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Wiezien_15_02"); //Przyby�o tu pe�no ork�w. A moja magia zosta�a ograniczona przez moc jakiego� szamana.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Wiezien_15_03"); //Nie mog�em nic zrobi�, jestem sam, jestem wi�niem.

};

//*********************************************************************
//	Info FindKey
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_FindKey   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 6;
 	condition   = DIA_NASZ_412_CatSan_FindKey_Condition;
 	information = DIA_NASZ_412_CatSan_FindKey_Info;
 	permanent   = FALSE;
	description = "Znalaz�em klucz...";
};

FUNC INT DIA_NASZ_412_CatSan_FindKey_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_412_CatSan_Przyniose))
	&& (npc_hasitems (other, ItNa_Key_CatSan) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_412_CatSan_FindKey_Info()
{
	AI_Output (other, self,"DIA_NASZ_412_CatSan_FindKey_15_00"); //Znalaz�em klucz...
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_01"); //To ju� co�. Poka� mi go.
	B_giveinvitems (other, self, ItNa_Key_CatSan, 1);
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_02"); //Tak, przypominam sobie! To klucz do skrzyni ukrytej na klifie obok fortu. W �rodku jest miecz.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_FindKey_15_03"); //Jak mam si� tam dosta�?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_04"); //Mo�esz po prostu zeskoczy�...
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_05"); //We� klucz i przynie� mi moje ostrze!
	B_giveinvitems (self, other, ItNa_Key_CatSan, 1);

	B_LogEntry (TOPIC_CatSan_ostrze, "Znalaz�em klucz. Cat-San przypomnia� sobie, �e jego ostrze schowane jest na klifie w kufrze. Mog� si� tam dosta� po prostu zeskakuj�c.");

};


//*********************************************************************
//	Info Ostrze
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_Ostrze   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 7;
 	condition   = DIA_NASZ_412_CatSan_Ostrze_Condition;
 	information = DIA_NASZ_412_CatSan_Ostrze_Info;
 	permanent   = FALSE;
	description = "Mam ostrze.";
};

FUNC INT DIA_NASZ_412_CatSan_Ostrze_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_412_CatSan_Przyniose))
	&& (npc_hasitems (other, ItNa_CatSan_Sword) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_412_CatSan_Ostrze_Info()
{
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Ostrze_15_00"); //Mam ostrze.
	AI_EquipBestMeleeWeapon	(self);
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Ostrze_15_01"); //Doskonale. Otworz� wi�c krat�!
	AI_PlayAni		(self, "HEA");
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Ostrze_15_02"); //Czy mo�esz mi towarzyszy� w walce?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Ostrze_15_03"); //Niestety, �miertelniku, nie zrobi� tego. Magia tego szamana onie�miela mnie. Musisz uda� si� tam sam.

	B_giveinvitems (other, self, ItNa_CatSan_Sword, 1);

	Wld_SendTrigger ("FORT_4_SCRIPT");
	
	B_GivePlayerXP(700);
	Log_SetTopicStatus (TOPIC_CatSan_ostrze, LOG_SUCCESS);
	B_LogEntry (TOPIC_CatSan_ostrze, "Przynios�em Cat-Sanowi ostrze. Teraz mog� i�� dalej i zg�adzi� orkowego szamana.");

	B_LogEntry (TOPIC_Keroloth_Wojna, "Id� do Ur-Shaka. Mam pewne obawy... Skoro nawet nie�miertelny duch boi si� jego magii...");
};

//*********************************************************************
//	Info UrShackKilled
//*********************************************************************
INSTANCE DIA_NASZ_412_CatSan_UrShackKilled   (C_INFO)
{
	npc         = NASZ_412_CatSan;
 	nr          = 8;
 	condition   = DIA_NASZ_412_CatSan_UrShackKilled_Condition;
 	information = DIA_NASZ_412_CatSan_UrShackKilled_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_412_CatSan_UrShackKilled_Condition()
{
	if (npc_isdead (OrcShaman_Ur_Shak))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_412_CatSan_UrShackKilled_Info()
{
	AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_00"); //Wyczuwam wiele przelanej krwi!
	AI_Output (other, self,"DIA_NASZ_412_CatSan_UrShackKilled_15_01"); //Tak, w ko�cu orkowie wraz z ich szamanem gryz� ziemi�.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_02"); //M�wi� o ludzkiej krwi! Gdzie� w pobli�u Kanionu Trolli.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_03"); //Je�li jeste� do�� silny, by pokona� takiego szamana, to musisz pom�c te� tym �miertelnikom!

	if (npc_hasitems (other, ItNa_TeleportTwierdza) >= 1) {

		AI_Output (other, self,"DIA_NASZ_412_CatSan_UrShackKilled_15_04"); //Przeteleportuj� si� tam.
		AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_05"); //I to jak najszybciej!
		AI_StopProcessInfos (self);
	}
	
	else {

		AI_Output (other, self,"DIA_NASZ_412_CatSan_UrShackKilled_15_06"); //Nie mam si� jak tam dosta�...
		AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_07"); //Przeteleportuj� ci�.
		AI_StopProcessInfos (self);
		AI_Teleport	(hero, "TWIERDZA");

	};

};
