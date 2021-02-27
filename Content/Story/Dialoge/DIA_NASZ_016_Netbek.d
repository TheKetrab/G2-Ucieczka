//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_016_Netbek_EXIT   (C_INFO)
{
	npc         = NASZ_016_Netbek;
	nr          = 999;
	condition   = DIA_NASZ_016_Netbek_EXIT_Condition;
	information = DIA_NASZ_016_Netbek_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_016_Netbek_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_016_Netbek_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	         Who 
//*********************************************************************
INSTANCE DIA_NASZ_016_Netbek_who   (C_INFO)
{
	npc         = NASZ_016_Netbek;
 	nr          = 1;
 	condition   = DIA_NASZ_016_Netbek_who_Condition;
 	information = DIA_NASZ_016_Netbek_who_Info;
 	permanent   = FALSE;
 	description = "Wszystko w porz�dku?";
};

FUNC INT DIA_NASZ_016_Netbek_who_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_015_Rudolf_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_016_Netbek_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_who_15_00"); //Wszystko w porz�dku?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_55_01"); //Sp�jrz na mnie.
	AI_PlayAni (self,"T_SEARCH");
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_55_02"); //Zaraz, co to by�o?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_55_03"); //Potrzebuj� zapali�. Masz mo�e troch� ziela?

	Info_ClearChoices (DIA_NASZ_016_Netbek_who);
	Info_AddChoice	  (DIA_NASZ_016_Netbek_who, "Nie mam.", DIA_NASZ_016_Netbek_who_nope);
	if (npc_hasitems (other, ItMi_Joint) >= 1){
	Info_AddChoice	  (DIA_NASZ_016_Netbek_who, "Tak, jasne.", DIA_NASZ_016_Netbek_who_yep);
	};
};

func void NetbekSay_NotOk() {

	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_00"); //Nie, przybyszu. Nie jest w porz�dku. Kiedy znikn�a bariera, w naszym obozie rozp�ta�o si� prawdziwe piek�o.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_01"); //Pe�no szkielet�w, kilkoro ludzi w czarnych maskach... A na dodatek te cholerne b�le g�owy. Ju� nie mog� wytrzyma�.
	AI_Output (other, self,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_02"); //Wiesz, dlaczego do tego wszystkiego dosz�o?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_03"); //Nie mam poj�cia. Jedyne co wiem, to �e nie wr�c� tam nigdy wi�cej! Z jednej strony bagno z o�ywie�cami, a z drugiej orkowie i ich ob�z!
	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_04"); //Gdyby to ode mnie zale�a�o, to oddali�bym si� od bagna jeszcze bardziej, ale Rudolf si� na to nie zgadza. Uwa�a, �e tu jest najbezpieczniej, ale on nie widzia� tego co ja!
	
};

FUNC VOID DIA_NASZ_016_Netbek_who_nope()
{
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_who_nope_15_00"); //Nie mam.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_nope_55_01"); //AAAARGH! M�j panie! Ten b�l g�owy...
	NetbekSay_NotOk();
	Info_ClearChoices (DIA_NASZ_016_Netbek_who);

};

FUNC VOID DIA_NASZ_016_Netbek_who_yep()
{
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_who_yep_15_00"); //Tak, jasne.
	B_giveinvitems (other, self, ItMi_Joint, 1);
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_yep_55_01"); //Dzi�ki ci, wybawco!
	B_UseItem (self, ItMi_Joint);

	NetbekSay_NotOk();
	Info_ClearChoices (DIA_NASZ_016_Netbek_who);

};

//*********************************************************************
//	         Zadanie 
//*********************************************************************
INSTANCE DIA_NASZ_016_Netbek_zadanie   (C_INFO)
{
	npc         = NASZ_016_Netbek;
 	nr          = 3;
 	condition   = DIA_NASZ_016_Netbek_zadanie_Condition;
 	information = DIA_NASZ_016_Netbek_zadanie_Info;
 	permanent   = FALSE;
 	description = "Co takiego widzia�e�?";
};

FUNC INT DIA_NASZ_016_Netbek_zadanie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_016_Netbek_who))
	&& !(npc_isdead(NASZ_028_Kazmin))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_016_Netbek_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_zadanie_15_00"); //Co takiego widzia�e�?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_55_01"); //Widzia�em demona. Demona...
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_55_02"); //To �ni�cy! Przyszed� zem�ci� si� na ca�ym Bractwie za sprzeniewierzenie mu si�. On dopadnie tak�e i mnie.
	AI_Output (other, self,"DIA_NASZ_016_Netbek_zadanie_55_03"); //Niby czemu mia�by ci� dopada�? Na pewno jest jeszcze wiele innych nowicjuszy, na kt�rych ten demon ma ochot�.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_15_04"); //Ty nic nie rozumiesz! On siedzi zamkni�ty w �wi�tyni. CZYLI DOK�ADNIE POD NAMI! A poza nim s� tam tylko szkielety i bagienne golemy.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_15_05"); //Lepiej si� tam nie zbli�aj!
	AI_Output (other, self,"DIA_NASZ_016_Netbek_zadanie_55_06"); //Ale� sk�d. Przecie� nawet o tym nie my�la�em.


};


//*********************************************************************
//	         WTF 
//*********************************************************************
INSTANCE DIA_NASZ_016_Netbek_WTF   (C_INFO)
{
	npc         = NASZ_016_Netbek;
 	nr          = 5;
 	condition   = DIA_NASZ_016_Netbek_WTF_Condition;
 	information = DIA_NASZ_016_Netbek_WTF_Info;
 	permanent   = FALSE;
 	description = "Uwolni�em wszystkich cz�onk�w bractwa.";
};

FUNC INT DIA_NASZ_016_Netbek_WTF_Condition()	
{
	if (npc_isdead(NASZ_028_Kazmin))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_016_Netbek_WTF_Info()
{
	AI_Output (other, self,"DIA_NASZ_016_Netbek_WTF_15_00"); //Uwolni�em wszystkich cz�onk�w bractwa.
	AI_Output (other, self,"DIA_NASZ_016_Netbek_WTF_15_01"); //Wszyscy oddali si� ukojeniu i opu�cili ten �wiat. Jeste� chyba ostatnim cz�owiekiem w takiej szacie.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_WTF_55_02"); //�ni�cy przyjdzie i po mnie. Musz� do��czy� do moich braci, �eby ten z�y demon mnie nie z�apa�!

	AI_StopProcessInfos (self);
	B_StartOtherRoutine (self,"Dead");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_016_Netbek_PICKPOCKET (C_INFO)
{
	npc			= NASZ_016_Netbek;
	nr			= 900;
	condition	= DIA_NASZ_016_Netbek_PICKPOCKET_Condition;
	information	= DIA_NASZ_016_Netbek_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_016_Netbek_PICKPOCKET_Condition()
{
	C_Beklauen (23);
};
 
FUNC VOID DIA_NASZ_016_Netbek_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_016_Netbek_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_016_Netbek_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_016_Netbek_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_016_Netbek_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_016_Netbek_PICKPOCKET_DoIt);
};

func void DIA_NASZ_016_Netbek_PICKPOCKET_DoIt()
{
	B_BeklauenThings (ItMi_Joint, 5);
	Info_ClearChoices (DIA_NASZ_016_Netbek_PICKPOCKET);
};
	
func void DIA_NASZ_016_Netbek_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_016_Netbek_PICKPOCKET);
};
