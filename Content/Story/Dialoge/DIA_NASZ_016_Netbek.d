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
 	description = "Wszystko w porz¹dku?";
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
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_who_15_00"); //Wszystko w porz¹dku?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_55_01"); //Spójrz na mnie.
	AI_PlayAni (self,"T_SEARCH");
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_55_02"); //Zaraz, co to by³o?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_55_03"); //Potrzebujê zapaliæ. Masz mo¿e trochê ziela?

	Info_ClearChoices (DIA_NASZ_016_Netbek_who);
	Info_AddChoice	  (DIA_NASZ_016_Netbek_who, "Nie mam.", DIA_NASZ_016_Netbek_who_nope);
	if (npc_hasitems (other, ItMi_Joint) >= 1){
	Info_AddChoice	  (DIA_NASZ_016_Netbek_who, "Tak, jasne.", DIA_NASZ_016_Netbek_who_yep);
	};
};

func void NetbekSay_NotOk() {

	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_00"); //Nie, przybyszu. Nie jest w porz¹dku. Kiedy zniknê³a bariera, w naszym obozie rozpêta³o siê prawdziwe piek³o.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_01"); //Pe³no szkieletów, kilkoro ludzi w czarnych maskach... A na dodatek te cholerne bóle g³owy. Ju¿ nie mogê wytrzymaæ.
	AI_Output (other, self,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_02"); //Wiesz, dlaczego do tego wszystkiego dosz³o?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_03"); //Nie mam pojêcia. Jedyne co wiem, to ¿e nie wrócê tam nigdy wiêcej! Z jednej strony bagno z o¿ywieñcami, a z drugiej orkowie i ich obóz!
	AI_Output (self, other,"DIA_NASZ_016_Netbek_NetbekSay_NotOK_15_04"); //Gdyby to ode mnie zale¿a³o, to oddali³bym siê od bagna jeszcze bardziej, ale Rudolf siê na to nie zgadza. Uwa¿a, ¿e tu jest najbezpieczniej, ale on nie widzia³ tego co ja!
	
};

FUNC VOID DIA_NASZ_016_Netbek_who_nope()
{
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_who_nope_15_00"); //Nie mam.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_nope_55_01"); //AAAARGH! Mój panie! Ten ból g³owy...
	NetbekSay_NotOk();
	Info_ClearChoices (DIA_NASZ_016_Netbek_who);

};

FUNC VOID DIA_NASZ_016_Netbek_who_yep()
{
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_who_yep_15_00"); //Tak, jasne.
	B_giveinvitems (other, self, ItMi_Joint, 1);
	AI_Output (self, other,"DIA_NASZ_016_Netbek_who_yep_55_01"); //Dziêki ci, wybawco!
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
 	description = "Co takiego widzia³eœ?";
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
	AI_Output (other,self ,"DIA_NASZ_016_Netbek_zadanie_15_00"); //Co takiego widzia³eœ?
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_55_01"); //Widzia³em demona. Demona...
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_55_02"); //To Œni¹cy! Przyszed³ zemœciæ siê na ca³ym Bractwie za sprzeniewierzenie mu siê. On dopadnie tak¿e i mnie.
	AI_Output (other, self,"DIA_NASZ_016_Netbek_zadanie_55_03"); //Niby czemu mia³by ciê dopadaæ? Na pewno jest jeszcze wiele innych nowicjuszy, na których ten demon ma ochotê.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_15_04"); //Ty nic nie rozumiesz! On siedzi zamkniêty w œwi¹tyni. CZYLI DOK£ADNIE POD NAMI! A poza nim s¹ tam tylko szkielety i bagienne golemy.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_zadanie_15_05"); //Lepiej siê tam nie zbli¿aj!
	AI_Output (other, self,"DIA_NASZ_016_Netbek_zadanie_55_06"); //Ale¿ sk¹d. Przecie¿ nawet o tym nie myœla³em.


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
 	description = "Uwolni³em wszystkich cz³onków bractwa.";
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
	AI_Output (other, self,"DIA_NASZ_016_Netbek_WTF_15_00"); //Uwolni³em wszystkich cz³onków bractwa.
	AI_Output (other, self,"DIA_NASZ_016_Netbek_WTF_15_01"); //Wszyscy oddali siê ukojeniu i opuœcili ten œwiat. Jesteœ chyba ostatnim cz³owiekiem w takiej szacie.
	AI_Output (self, other,"DIA_NASZ_016_Netbek_WTF_55_02"); //Œni¹cy przyjdzie i po mnie. Muszê do³¹czyæ do moich braci, ¿eby ten z³y demon mnie nie z³apa³!

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
