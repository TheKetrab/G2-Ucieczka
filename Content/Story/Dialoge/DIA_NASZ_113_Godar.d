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
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_01"); //Cz�owieku, we� si� odczep.
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
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_02"); //Kurg-Kan wspomina�, �e wiesz, dlaczego mo�e chodzi� z broni� po obozie.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_03"); //No wiem i to ca�kiem sporo, bo zawdzi�czam temu orkowi �ycie!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_04"); //Co? Jak to si� sta�o?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_05"); //Troch� g�upio si� po tym wszystkim przyzna�, ale uznali�my, �e p�jdziemy z ch�opakami na polowanie. I chcieli�my wzi�� ze sob� orka...
	AI_Output			(other, self,"DIA_NASZ_113_Godar_ORK_15_06"); //Niech zgadn�: Bez broni, �eby robi� wam za przyn�t�?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_07"); //Tak... W ka�dym razie, chcieli�my zapolowa� na par� wilk�w, mo�e warg�w. Tymczasem na drodze wpadli�my na najprawdziwsze brzytwy, kt�rych nie widzia�em od dawna w kolonii. Kaza�em Kurg-Kanowi podej�� jak najbli�ej si� da, by sprowokowa� zwierz�ta i skupi� na siebie ich uwag�, a my je szybko zestrzelimy z kuszy.
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_08"); //I co dzia�o si� potem?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_09"); //Zabili�my brzytwy, a tu nagle si� okaza�o, �e zamiast dw�ch sztuk, by�o ich ca�e stado i zostali�my szybko otoczeni. Zacz�a si� krwawa jatka i nawet nam dobrze sz�o, a� nie wyskoczy� na mnie samiec alfa. Powali� mnie na ziemi� i ca�ymi si�ami, powstrzymywa�em go, by nie odgryz� mi g�owy.
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_10"); //Chyba wiem, do czego to zmierza.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_11"); //Wtedy us�ysza�em ryk. A� mi serce zamar�o, ale wtedy okaza�o si�, �e ten ork leci mi na ratunek.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_12"); //I my�lisz, �e mia� jak�� bro�? Nie! Pobieg� na niego z pi�ciami! Rzuci� si�, przewracaj�c alf� na ziemi� i...
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_13"); //Przez chwil� si� z ni� si�owa�. I my�lisz, �e udusi� gada? Nie, chwyci� go za szcz�k� i poci�gn�� tak mocno, �e rozerwa� mu �eb!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_14"); //No, to by�o naprawd� imponuj�ce!
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_15"); //Zgadzam si�. Tote�, razem z ch�opakami, jak wr�cili�my do obozu, opowiedzieli�my wszystkim o tym co zrobi�. Do godziny, Keroloth wyszed� i da� orkowi bro�, m�wi�c �e na ni� zas�u�y�.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_16"); //S�yszysz to? Keroloth maj�c do dyspozycji wi�cej ludzi, najch�tniej zabra�by mi bro� i pancerz, a mu m�wi, �e zas�u�y�!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_17"); //Widzicie? Mia�em racj� co do niego, a nie chcieli�cie mi ufa�.
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_18"); //Wybacz, Will. Byli�my w b��dzie, ale wiesz... Rasie, kt�ra z nami walczy od dziesi�tek lat, trudno zaufa�.
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_19"); //Nie szkodzi. Rozumiem. Nie wiesz mo�e, czemu nie chcia� mi o tym m�wi�?
	AI_Output			(self, other,"DIA_NASZ_113_Godar_ORK_15_20"); //Szczerze? Wydaje mi si�, �e po prostu jest skromny. Pos�dzi�by� kiedy� orka o tak� cech�? Ha, ha!
	AI_Output			(other,self, "DIA_NASZ_113_Godar_ORK_15_21"); //Nie, pewnie nie. 
	KurgKanGodarInfo = 2;
	AI_StopProcessInfos (self);
};
