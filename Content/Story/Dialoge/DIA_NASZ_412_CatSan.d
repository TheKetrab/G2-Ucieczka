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
	AI_Output (self, other,"DIA_NASZ_412_CatSan_siema_15_02"); //Nie³atwo to ubraæ w s³owa.

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
	description = "Co masz na myœli?";
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
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_00"); //Co masz na myœli?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_01"); //Có¿... Jestem stra¿nikiem tej fortecy.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_02"); //Ale jestem te¿ wiêŸniem!
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_03"); //Pewnie jakaœ magiczna aura nie pozwala ci opuœciæ tego budynku i musisz do koñca œwiata czuwaæ tutaj, tak?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_04"); //Bzdura! To mój dom, moje posiad³oœci. Kiedyœ rz¹dzi³ tu dobry Lord Tymorisin. A teraz orkowie sprofanowali moje skarby...
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_05"); //I nie mo¿esz ich po prostu wykurzyæ u¿ywaj¹c czarów?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_06"); //To nie takie proste, cz³owieczku. Wyczuwam magiê jakiegoœ potê¿nego szamana, który ogranicza si³ê moich czarów.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_ToZnaczy_15_07"); //Muszê dostaæ siê na górê. Jak otworzyæ tê kratê, która blokuje wyjœcie?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_ToZnaczy_15_08"); //Bardzo prosto: wystarczy wypowiedzieæ zaklêcie. Osobiœcie zamkn¹³em tê kratê i tylko ja jestem w stanie j¹ ponownie otworzyæ.

	B_LogEntry (TOPIC_Keroloth_Wojna, "Duch Cat-San zamkn¹³ kratê i nie mogê iœæ dalej. Muszê zrobiæ coœ, ¿eby j¹ otworzy³!");
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
	description = "Otworzysz dla mnie kratê?";
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
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Otworzysz_15_00"); //Otworzysz dla mnie kratê?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Otworzysz_15_01"); //Nie zrobiê tego. Bez swojego miecza jestem zbyt s³aby, by ryzykowaæ atak orków.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Otworzysz_15_02"); //Ale ja muszê siê tam dostaæ... AAAH!

	Log_CreateTopic (TOPIC_CatSan_ostrze, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_CatSan_ostrze, LOG_RUNNING);
	B_LogEntry (TOPIC_CatSan_ostrze, "W górskiej fortecy spotka³em ducha. Orkowie zajêli jego posiad³oœci, a on sam zamkn¹³ siê w komnacie. Otworzy kratê tylko, jeœli przyniosê mu jego miecz.");

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
	description = "Przyniosê ci ten ca³y miecz.";
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
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Przyniose_15_00"); //Przyniosê ci ten ca³y miecz.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Przyniose_15_01"); //Powiedz tylko, gdzie mam go szukaæ?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Przyniose_15_02"); //Widzisz te dwie dŸwignie za mn¹?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Przyniose_15_03"); //Otwieraj¹ przejœcia do ukrytych komnat. Tylko uwa¿aj, zamkn¹³em za nimi kilku orków, którzy chcieli posiekaæ mnie - ducha - na kawa³ki.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Przyniose_15_04"); //Myœlê, ¿e gdzieœ tam, wieki temu schowa³em Ostrze Gildii San.
	
	B_LogEntry (TOPIC_CatSan_ostrze, "Ostrze Gildii San jest prawdopodobnie schowane gdzieœ w ukrytych komnatach, do których przejœcia otwieraj¹ prze³¹czniki.");

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
	description = "Wspomina³eœ, ¿e jesteœ wiêŸniem...";
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
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Wiezien_15_00"); //Wspomina³eœ, ¿e jesteœ wiêŸniem...
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Wiezien_15_01"); //Tak, na Beliara! Jestem.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Wiezien_15_02"); //Przyby³o tu pe³no orków. A moja magia zosta³a ograniczona przez moc jakiegoœ szamana.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Wiezien_15_03"); //Nie mog³em nic zrobiæ, jestem sam, jestem wiêŸniem.

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
	description = "Znalaz³em klucz...";
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
	AI_Output (other, self,"DIA_NASZ_412_CatSan_FindKey_15_00"); //Znalaz³em klucz...
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_01"); //To ju¿ coœ. Poka¿ mi go.
	B_giveinvitems (other, self, ItNa_Key_CatSan, 1);
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_02"); //Tak, przypominam sobie! To klucz do skrzyni ukrytej na klifie obok fortu. W œrodku jest miecz.
	AI_Output (other, self,"DIA_NASZ_412_CatSan_FindKey_15_03"); //Jak mam siê tam dostaæ?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_04"); //Mo¿esz po prostu zeskoczyæ...
	AI_Output (self, other,"DIA_NASZ_412_CatSan_FindKey_15_05"); //WeŸ klucz i przynieœ mi moje ostrze!
	B_giveinvitems (self, other, ItNa_Key_CatSan, 1);

	B_LogEntry (TOPIC_CatSan_ostrze, "Znalaz³em klucz. Cat-San przypomnia³ sobie, ¿e jego ostrze schowane jest na klifie w kufrze. Mogê siê tam dostaæ po prostu zeskakuj¹c.");

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
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Ostrze_15_01"); //Doskonale. Otworzê wiêc kratê!
	AI_PlayAni		(self, "HEA");
	AI_Output (other, self,"DIA_NASZ_412_CatSan_Ostrze_15_02"); //Czy mo¿esz mi towarzyszyæ w walce?
	AI_Output (self, other,"DIA_NASZ_412_CatSan_Ostrze_15_03"); //Niestety, œmiertelniku, nie zrobiê tego. Magia tego szamana onieœmiela mnie. Musisz udaæ siê tam sam.

	B_giveinvitems (other, self, ItNa_CatSan_Sword, 1);

	Wld_SendTrigger ("FORT_4_SCRIPT");
	
	B_GivePlayerXP(700);
	Log_SetTopicStatus (TOPIC_CatSan_ostrze, LOG_SUCCESS);
	B_LogEntry (TOPIC_CatSan_ostrze, "Przynios³em Cat-Sanowi ostrze. Teraz mogê iœæ dalej i zg³adziæ orkowego szamana.");

	B_LogEntry (TOPIC_Keroloth_Wojna, "Idê do Ur-Shaka. Mam pewne obawy... Skoro nawet nieœmiertelny duch boi siê jego magii...");
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
	AI_Output (other, self,"DIA_NASZ_412_CatSan_UrShackKilled_15_01"); //Tak, w koñcu orkowie wraz z ich szamanem gryz¹ ziemiê.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_02"); //Mówiê o ludzkiej krwi! Gdzieœ w pobli¿u Kanionu Trolli.
	AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_03"); //Jeœli jesteœ doœæ silny, by pokonaæ takiego szamana, to musisz pomóc te¿ tym œmiertelnikom!

	if (npc_hasitems (other, ItNa_TeleportTwierdza) >= 1) {

		AI_Output (other, self,"DIA_NASZ_412_CatSan_UrShackKilled_15_04"); //Przeteleportujê siê tam.
		AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_05"); //I to jak najszybciej!
		AI_StopProcessInfos (self);
	}
	
	else {

		AI_Output (other, self,"DIA_NASZ_412_CatSan_UrShackKilled_15_06"); //Nie mam siê jak tam dostaæ...
		AI_Output (self, other,"DIA_NASZ_412_CatSan_UrShackKilled_15_07"); //Przeteleportujê ciê.
		AI_StopProcessInfos (self);
		AI_Teleport	(hero, "TWIERDZA");

	};

};
