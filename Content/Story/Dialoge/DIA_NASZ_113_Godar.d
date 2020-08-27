//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_113_Godar_EXIT   (C_INFO)
{
	npc         = NASZ_113_Godar;
	nr          = 999;
	condition   = DIA_NASZ_113_Godar_EXIT_Condition;
	information = DIA_NASZ_113_Godar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_113_Godar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_113_Godar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_113_Godar_hello		(C_INFO)
{
	npc		 	 = 	NASZ_113_Godar;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_113_Godar_hello_Condition;
	information	 = 	DIA_NASZ_113_Godar_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_113_Godar_hello_Condition ()
{
	if ((Npc_IsInState (self, ZS_Talk)) && (KAPITEL < 3) &&  (KurgKanGodarInfo != 1))
	{
		return TRUE;
	};
};
func void DIA_NASZ_113_Godar_hello_Info ()
{
	if (LOWCA_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_00"); //Nie przeszkadzaj mi!
	LOWCA_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (LOWCA_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_01"); //Cz³owieku, weŸ siê odczep.
	LOWCA_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (LOWCA_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_02"); //Zostaw mnie w spokoju!
	LOWCA_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_03"); //Nie mam teraz czasu.
	LOWCA_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

//*********************************************************************
//	Info ORK 
//*********************************************************************
INSTANCE DIA_NASZ_113_Godar_ORK   (C_INFO)
{
	npc         = NASZ_113_Godar;
	nr          = 2;
	condition   = DIA_NASZ_113_Godar_ORK_Condition;
	information = DIA_NASZ_113_Godar_ORK_Info;
	description = "A co do orka...";
};

FUNC INT DIA_NASZ_113_Godar_ORK_Condition()
{
	if(KurgKanGodarInfo == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_113_Godar_ORK_Info()
{
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_00"); //A co do orka...
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_01"); //Tak? Czego chcesz?
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_02"); //Kurg-Kan wspomina³, ¿e wiesz, dlaczego mo¿e chodziæ z broni¹ po obozie.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_03"); //No wiem i to ca³kiem sporo, bo zawdziêczam temu orkowi ¿ycie!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_04"); //Co? Jak to siê sta³o?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_05"); //Trochê g³upio siê po tym wszystkim przyznaæ, ale uznaliœmy, ¿e pójdziemy z ch³opakami na polowanie. I chcieliœmy wzi¹æ ze sob¹ orka...
	AI_Output			(other, self,"DIA_NASZ_113_Godar_ORK_15_06"); //Niech zgadnê: Bez broni, ¿eby robi³ wam za przynêtê?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_07"); //Tak... W ka¿dym razie, chcieliœmy zapolowaæ na parê wilków, mo¿e wargów. Tymczasem na drodze wpadliœmy na najprawdziwsze brzytwy, których nie widzia³em od dawna w kolonii. Kaza³em Kurg-Kanowi podejœæ jak najbli¿ej siê da, by sprowokowa³ zwierzêta i skupi³ na siebie ich uwagê, a my je szybko zestrzelimy z kuszy.
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_08"); //I co dzia³o siê potem?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_09"); //Zabiliœmy brzytwy, a tu nagle siê okaza³o, ¿e zamiast dwóch sztuk, by³o ich ca³e stado i zostaliœmy szybko otoczeni. Zaczê³a siê krwawa jatka i nawet nam dobrze sz³o, a¿ nie wyskoczy³ na mnie samiec alfa. Powali³ mnie na ziemiê i ca³ymi si³ami, powstrzymywa³em go, by nie odgryz³ mi g³owy.
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_10"); //Chyba wiem, do czego to zmierza.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_11"); //Wtedy us³ysza³em ryk. A¿ mi serce zamar³o, ale wtedy okaza³o siê, ¿e ten ork leci mi na ratunek.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_12"); //I myœlisz, ¿e mia³ jak¹œ broñ? Nie! Pobieg³ na niego z piêœciami! Rzuci³ siê, przewracaj¹c alfê na ziemiê i...
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_13"); //Przez chwilê siê z ni¹ si³owa³. I myœlisz, ¿e udusi³ gada? Nie, chwyci³ go za szczêkê i poci¹gn¹³ tak mocno, ¿e rozerwa³ mu ³eb!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_14"); //No, to by³o naprawdê imponuj¹ce!
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_15"); //Zgadzam siê. Tote¿, razem z ch³opakami, jak wróciliœmy do obozu, opowiedzieliœmy wszystkim o tym co zrobi³. Do godziny, Keroloth wyszed³ i da³ orkowi broñ, mówi¹c ¿e na ni¹ zas³u¿y³.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_16"); //S³yszysz to? Keroloth maj¹c do dyspozycji wiêcej ludzi, najchêtniej zabra³by mi broñ i pancerz, a mu mówi, ¿e zas³u¿y³!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_17"); //Widzicie? Mia³em racjê co do niego, a nie chcieliœcie mi ufaæ.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_18"); //Wybacz, Will. Byliœmy w b³êdzie, ale wiesz... Rasie, która z nami walczy od dziesi¹tek lat, trudno zaufaæ.
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_19"); //Nie szkodzi. Rozumiem. Nie wiesz mo¿e, czemu nie chcia³ mi o tym mówiæ?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_20"); //Szczerze? Wydaje mi siê, ¿e po prostu jest skromny. Pos¹dzi³byœ kiedyœ orka o tak¹ cechê? Ha, ha!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_21"); //Nie, pewnie nie. 
	KurgKanGodarInfo = 2;
	AI_StopProcessInfos (self);
};
