//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_EXIT   (C_INFO)
{
	npc         = NASZ_211_Hunt;
	nr          = 999;
	condition   = DIA_NASZ_211_Hunt_EXIT_Condition;
	information = DIA_NASZ_211_Hunt_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_211_Hunt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_211_Hunt_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_siema   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 1;
 	condition   = DIA_NASZ_211_Hunt_siema_Condition;
 	information = DIA_NASZ_211_Hunt_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_211_Hunt_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_211_Hunt_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_211_Hunt_siema_55_01"); //Nazywam siê Hunt. Wszystko, co produkuje nasz kowal znajdziesz u mnie. Oczywiœcie inne towary te¿ u mnie znajdziesz.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_siema_55_02"); //A, no i skupujê te¿ skóry od naszych ludzi. Jeœli bêdziesz mia³ jakieœ w dobrym stanie, to zapraszam do mnie. Lepiej nigdzie nie sprzedasz.
	AI_Output (other,self ,"DIA_NASZ_211_Hunt_siema_15_03"); //Co robisz póŸniej z tymi skórami?
	AI_Output (self, other,"DIA_NASZ_211_Hunt_siema_55_04"); //Suszê, czyszczê i wyszywam stroje. Poza tym robimy z nich ³ó¿ka, a nawet barykady.

	Log_CreateTopic (TOPIC_MysliwiTrader,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTrader,"Hunt handluje broni¹ wykut¹ przez Dobara i innymi rzeczami. Skupuje równie¿ skóry.");	
};

//*********************************************************************
//	Info Robota
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_robota   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 2;
 	condition   = DIA_NASZ_211_Hunt_robota_Condition;
 	information = DIA_NASZ_211_Hunt_robota_Info;
 	permanent   = FALSE;
 	description = "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_NASZ_211_Hunt_robota_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_211_Hunt_robota_Info()
{
	AI_Output (other,self ,"DIA_NASZ_211_Hunt_robota_15_00"); //Czy jest coœ, co móg³bym dla ciebie zrobiæ?
	AI_Output (self, other,"DIA_NASZ_211_Hunt_robota_55_01"); //Tak, w zasadzie tak.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_robota_55_02"); //Jesteœ tu nowy i nikt ciê nie zna.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_robota_55_03"); //Handlarz ³owców orków imieniem Johny ma na sprzeda¿ pewien amulet. Chcê go mieæ.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_robota_55_04"); //Kup go albo ukradnij. Jeœli jesteœ doœæ cwany, nie powinieneœ mieæ problemów.
	
	Log_CreateTopic (TOPIC_Hunt_amulet, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Hunt_amulet, LOG_RUNNING);
	B_LogEntry (TOPIC_Hunt_amulet, "Handlarz Hunt chce, bym przyniós³ mu amulet, w którego posiadaniu jest Johny, handlarz ³owców orków. Mam go uczciwie kupiæ albo po prostu ukraœæ.");
		
};


//*********************************************************************
//	         Koniec zadania
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_koniec   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 3;
 	condition   = DIA_NASZ_211_Hunt_koniec_Condition;
 	information = DIA_NASZ_211_Hunt_koniec_Info;
 	permanent   = FALSE;
 	description = "Oto amulet.";
};

FUNC INT DIA_NASZ_211_Hunt_koniec_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_211_Hunt_robota)
		&& npc_hasitems (other, ItNa_HuntAmulet) >=1) 
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_koniec_Info()
{
	AI_Output (other,self ,"DIA_NASZ_211_Hunt_koniec_15_00"); //Oto amulet.
	B_giveinvitems (other, self, ItNa_HuntAmulet, 1);
	Npc_RemoveInvItems   (self, ItNa_HuntAmulet, 1);
	AI_Output (self, other,"DIA_NASZ_211_Hunt_koniec_55_01"); //D³ugo czeka³em, by mieæ coœ takiego. Dziêki!
	AI_Output (self, other,"DIA_NASZ_211_Hunt_koniec_55_02"); //Ale o nagrodzie zapomnij. To ty siê masz przypodobaæ mi, nie ja tobie.

	B_LogEntry (TOPIC_Hunt_amulet, "Hunt nie okaza³ siê szczególnie hojny i nie dosta³em ¿adnej nagrody. Tak czy owak, mam nadziejê, ¿e moja reputacja w obozie myœliwych siê poprawi.");
	Log_SetTopicStatus (TOPIC_Hunt_amulet, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);
};


func void HuntSay_NoMoney() {
	AI_Output (self, other,"DIA_NASZ_211_Hunt_HuntSay_NoMoney_55_00"); //Nie masz doœæ z³ota.
};

func void HuntSay_ForYou() {
	AI_Output (self, other,"DIA_NASZ_211_Hunt_HuntSay_ForYou_55_00"); //Proszê bardzo!
};

func void HuntSay_NoRepEnough() {
	AI_Output (self, other,"DIA_NASZ_211_Hunt_HuntSay_NoRepEnough_55_00"); //Jeszcze nie zas³ugujesz na ten pancerz.
};


var int KapturMysliwegoKupiony;
//*********************************************************************
//	Info Kaptur
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_Kaptur   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 4;
 	condition   = DIA_NASZ_211_Hunt_Kaptur_Condition;
 	information = DIA_NASZ_211_Hunt_Kaptur_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi kaptur myœliwego. (200 szt. z³ota)";
};

FUNC INT DIA_NASZ_211_Hunt_Kaptur_Condition()	
{
	if (hero.guild == GIL_OUT)
	&& (KapturMysliwegoKupiony == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_Kaptur_Info()
{
	AI_Output (other, self,"DIA_NASZ_211_Hunt_Kaptur_15_00"); //Sprzedaj mi kaptur myœliwego.
	if (npc_hasitems (other, ItMi_Gold) >= 200) {
		Createinvitems (self, ITNA_KapturMysliwego, 1);
		B_GiveInvItems (other, self, ItMi_Gold, 200);
		Npc_RemoveInvItems   (self, ItMi_Gold, 200);
		HuntSay_ForYou();
		
		B_Giveinvitems (self, other, ITNA_KapturMysliwego, 1);
		KapturMysliwegoKupiony = TRUE;
	}
	else {		
		HuntSay_NoMoney();
	};
};



var int SredniPancerzMysliwegoKupiony;
//*********************************************************************
//	Info SredniPancerz
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_SredniPancerz   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 4;
 	condition   = DIA_NASZ_211_Hunt_SredniPancerz_Condition;
 	information = DIA_NASZ_211_Hunt_SredniPancerz_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi zbrojê. (Œredni pancerz myœliwego: 600 szt. z³ota)";
};

FUNC INT DIA_NASZ_211_Hunt_SredniPancerz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_BeAMysliwy) && (hero.guild == GIL_OUT)
		&& (SredniPancerzMysliwegoKupiony == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_SredniPancerz_Info()
{
	AI_Output (other, self,"DIA_NASZ_211_Hunt_SredniPancerz_15_00"); //Sprzedaj mi zbrojê.
	if (npc_hasitems (other, ItMi_Gold) >= 600) {
		if (RepEnough(50,REP_MYSLIWI)) {
			Createinvitems (self, ITNA_OUT_M, 1);
			AI_EquipBestArmor (self);
			B_GiveInvItems (other, self, ItMi_Gold, 600);
			Npc_RemoveInvItems   (self, ItMi_Gold, 600);
			HuntSay_ForYou();
			
			B_Giveinvitems (self, other, ITNA_OUT_M, 1);
			AI_EquipBestArmor (other);
			
			AI_Output (self, other,"DIA_NASZ_211_Hunt_SredniPancerz_55_02"); //Le¿y jak ula³.
			AI_Output (other, self,"DIA_NASZ_211_Hunt_SredniPancerz_55_03"); //Mam nadziejê, ¿e wcale nie gorzej ochrania.
			SredniPancerzMysliwegoKupiony = TRUE;
		}
		else {
			PrintMissingRep(50,REP_MYSLIWI);
			HuntSay_NoRepEnough();
		};
	}
	else {		
		HuntSay_NoMoney();
	};
};

var int WzmocnionaZbrojaMysliwegoKupiona;
//*********************************************************************
//	Info WzmocnionaZbroja
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_WzmocnionaZbroja   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 5;
 	condition   = DIA_NASZ_211_Hunt_WzmocnionaZbroja_Condition;
 	information = DIA_NASZ_211_Hunt_WzmocnionaZbroja_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi zbrojê. (Wzmocniona zbroja myœliwego: 1500 szt. z³ota)";
};

FUNC INT DIA_NASZ_211_Hunt_WzmocnionaZbroja_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_KapThree) && (hero.guild == GIL_OUT)
		&& (WzmocnionaZbrojaMysliwegoKupiona == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_WzmocnionaZbroja_Info()
{
	AI_Output (other, self,"DIA_NASZ_211_Hunt_WzmocnionaZbroja_15_00"); //Sprzedaj mi zbrojê.
	if (npc_hasitems (other, ItMi_Gold) >= 1500) {
		if (RepEnough(80,REP_MYSLIWI)) {
			B_GiveInvItems (other, self, ItMi_Gold, 1500);
			Npc_RemoveInvItems   (self, ItMi_Gold, 1500);
			HuntSay_ForYou();
			Createinvitems (self, ITNA_OUT_S, 1);
			B_Giveinvitems (self, other, ITNA_OUT_S, 1);
			AI_EquipBestArmor (other);
			AI_Output (self, other,"DIA_NASZ_211_Hunt_WzmocnionaZbroja_55_02"); //Doskonale!
			WzmocnionaZbrojaMysliwegoKupiona = TRUE;
		}
		else {
			PrintMissingRep(80,REP_MYSLIWI);
			HuntSay_NoRepEnough();
		};
	}
	else {
		HuntSay_NoMoney();
	};
};

//*********************************************************************
//	        Drax
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_Drax   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 6;
 	condition   = DIA_NASZ_211_Hunt_Drax_Condition;
 	information = DIA_NASZ_211_Hunt_Drax_Info;
 	permanent   = FALSE;
 	description = "Nie wiesz, gdzie móg³ uciec Drax?";
};

FUNC INT DIA_NASZ_211_Hunt_Drax_Condition()	
{
	if (HUNT_DRAX == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_Drax_Info()
{
	AI_Output (other,self ,"DIA_NASZ_211_Hunt_Drax_15_00"); //Nie wiesz, gdzie móg³ uciec Drax?
	AI_Output (self, other,"DIA_NASZ_211_Hunt_Drax_55_01"); //Drax? ¯artujesz sobie! Chyba go nie wypuœciliœcie?!
	AI_Output (self, other,"DIA_NASZ_211_Hunt_Drax_55_02"); //Ehh... Niedaleko zamku na rzece jest pewna jaskinia. Tam czêsto chowaliœmy trofea, zanim zostawa³y sprzedane.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_Drax_55_03"); //Zamierzasz go schwytaæ i przyprowadziæ do obozu?
	AI_Output (other,self ,"DIA_NASZ_211_Hunt_Drax_15_04"); //To zale¿y od tego, czy bêdzie wspó³pracowa³. Nie mam zamiaru pieprzyæ siê z psychopat¹.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_Drax_55_05"); //Kiedyœ by³ dobrym kompanem. Nie wiem, co mu odwali³o. Jeœli ju¿ mia³byœ go zabiæ, to zrób to szybko, bez bólu.

	B_LogEntry (TOPIC_Drax_ucieczka, "Drax móg³ siê schowaæ gdzieœ w jaskini na rzece obok zamku.");

};


//*********************************************************************
//	        SellIce
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_SellIce   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 10;
 	condition   = DIA_NASZ_211_Hunt_SellIce_Condition;
 	information = DIA_NASZ_211_Hunt_SellIce_Info;
 	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_NASZ_211_Hunt_SellIce_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_co))
	  && (Npc_HasItems(other, ItNa_IceWolfFur) == 0)
	  && !(npc_knowsinfo (other, DIA_NASZ_213_Gestath_FurForYou))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_SellIce_Info()
{
	AI_Output (self, other,"DIA_NASZ_211_Hunt_SellIce_15_00"); //Hej, ty! Rozmawia³eœ z Gestathem.
	AI_Output (other, self,"DIA_NASZ_211_Hunt_SellIce_55_01"); //Tak. Czy to dziwne?
	AI_Output (self, other,"DIA_NASZ_211_Hunt_SellIce_15_02"); //Nie, dlatego doskonale wiem, o co ciê poprosi³. Masz mu przynieœæ skóry wszystkich wilków.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_SellIce_55_03"); //A chcia³bym ciê uœwiadomiæ, ¿e LODOWY WILK to twarda sztuka. Rozszarpie ciê na strzêpy.
	AI_Output (other, self,"DIA_NASZ_211_Hunt_SellIce_55_04"); //Do czego zmierzasz?
	AI_Output (self, other,"DIA_NASZ_211_Hunt_SellIce_55_05"); //Mogê odsprzedaæ ci jedn¹ ze skór.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_SellIce_55_06"); //Ty u³atwisz sobie zadanie, a ja trochê zarobiê.

	B_LogEntry (TOPIC_Gestath_wilki, "Hunt zaproponowa³ mi zakup skóry lodowego wilka. Mo¿e to nieg³upi pomys³? Ale drogo sobie liczy...");	
};

var int SellIceDone;
//*********************************************************************
//	        SellIce100szt
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_SellIce100szt   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 11;
 	condition   = DIA_NASZ_211_Hunt_SellIce100szt_Condition;
 	information = DIA_NASZ_211_Hunt_SellIce100szt_Info;
 	permanent   = TRUE;
	description	= "Sprzedaj mi skórê lodowego wilka. (100 szt. z³ota)";
};

FUNC INT DIA_NASZ_211_Hunt_SellIce100szt_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_211_Hunt_SellIce))
	&& (SellIceDone == FALSE)
	&& !(npc_knowsinfo (other, DIA_NASZ_213_Gestath_FurForYou))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_211_Hunt_SellIce100szt_Info()
{
	AI_Output (other, self,"DIA_NASZ_211_Hunt_SellIce100szt_15_00"); //Sprzedaj mi skórê lodowego wilka.
	
	if (Npc_HasItems(other, ItMi_Gold) >= 100)
	{
		B_GiveInvItems(other, self, ItMi_Gold,100);
		AI_Output (self, other,"DIA_NASZ_211_Hunt_SellIce100szt_15_01"); //Dobry zakup! Nie po¿a³ujesz.
		B_GiveInvItems(self, other, ItNa_IceWolfFur, 1);
		SellIceDone = TRUE;
		B_LogEntry (TOPIC_Gestath_wilki, "Kupi³em. Jeden problem z g³owy, a nie s¹dzê, by Gestath dopatrzy³ siê drobnego oszustwa.");	
	}
	else
	{
		AI_Output (other, self,"DIA_NASZ_211_Hunt_SellIce100szt_55_01"); //Cena wynosi sto sztuk z³ota, a ty tyle nie masz.
	};

};


// *******************************************************
//				 		SellFur
// *******************************************************	
INSTANCE DIA_NASZ_211_Hunt_SellFur (C_INFO)
{
	npc			= NASZ_211_Hunt;
	nr 			= 99;
	condition	= DIA_NASZ_211_Hunt_SellFur_Condition;
	information	= DIA_NASZ_211_Hunt_SellFur_Info;
	permanent	= TRUE;
	description	= "Mam dla ciebie kilka skór...";
};
func int DIA_NASZ_211_Hunt_SellFur_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_211_Hunt_siema))
	{
		return TRUE;
	};
};

func void HuntSay_WolfFur() {
	AI_Output (self, other, "HuntSay_WolfFur_11_00"); //Wilcza skóra, nieŸle...
};

func void HuntSay_BlackWolfFur() {
	AI_Output (self, other, "HuntSay_BlackWolfFur_11_00"); //Skóra czarnego wilka. Na kontynencie by³by to wyj¹tkowy okaz, ale tutaj to nic szczególnego.
	AI_Output (other, self, "HuntSay_BlackWolfFur_15_01"); //Gdy ju¿ siê st¹d wydostaniemy, zwrócisz mi nale¿yt¹ wartoœæ.
	AI_Output (self, other, "HuntSay_BlackWolfFur_11_02"); //Siê wie!
};

func void HuntSay_WhiteWolfFur() {
	AI_Output (self, other, "HuntSay_WhiteWolfFur_11_00"); //Bia³a skóra... Najmilsza dla ludzkiego cia³a.
};

func void DIA_NASZ_211_Hunt_SellFur_Info ()
{
	AI_Output (other, self, "DIA_NASZ_211_Hunt_SellFur_15_00"); //Mam dla ciebie kilka skór...

	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (((Npc_HasItems(other, ItAt_WolfFur) > 0) && (Mission_Gestath_Fur == FALSE)) || ((Npc_HasItems(other, ItAt_WolfFur) > 1) && (Mission_Gestath_Fur == TRUE)))
	|| (((Npc_HasItems(other, ItNa_BlackWolfFur) > 0) && (Mission_Gestath_Fur == FALSE)) || ((Npc_HasItems(other, ItNa_BlackWolfFur) > 1) && (Mission_Gestath_Fur == TRUE)))
	|| (((Npc_HasItems(other, ItNa_IceWolfFur) > 0) && (Mission_Gestath_Fur == FALSE)) || ((Npc_HasItems(other, ItNa_IceWolfFur) > 1) && (Mission_Gestath_Fur == TRUE)))
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_01"); //Skóra dzika! Wspaniale. Wytrzyma³a, idealna na zbrojê, chocia¿ niezbyt przyjemnie pachnie.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
			
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_02"); //Owcze skóry, co? Jesteœ jedynym, który mi takie przynosi.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0) && (Mission_Gestath_Fur == FALSE)
		{
			HuntSay_WolfFur();
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 1) && (Mission_Gestath_Fur == TRUE)
		{
			HuntSay_WolfFur();
			B_GiveInvItems(self, other, itmi_gold, ((Npc_HasItems(other, ItAt_WolfFur) - 1) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur) - 1);
		};

		if (Npc_HasItems(other, ItNa_BlackWolfFur) > 0) && (Mission_Gestath_Fur == FALSE)
		{
			HuntSay_BlackWolfFur();
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItNa_BlackWolfFur) * 10) );
			B_GiveInvItems(other, self, ItNa_BlackWolfFur, Npc_HasItems(other, ItNa_BlackWolfFur));
		};
		
		if (Npc_HasItems(other, ItNa_BlackWolfFur) > 1) && (Mission_Gestath_Fur == TRUE)
		{
			HuntSay_BlackWolfFur();
			B_GiveInvItems(self, other, itmi_gold, ((Npc_HasItems(other, ItNa_BlackWolfFur) - 1) * 10) );
			B_GiveInvItems(other, self, ItNa_BlackWolfFur, Npc_HasItems(other, ItNa_BlackWolfFur) - 1);
		};

		if (Npc_HasItems(other, ItNa_IceWolfFur) > 0) && (Mission_Gestath_Fur == FALSE)
		{
			HuntSay_WhiteWolfFur();
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItNa_IceWolfFur) * 15) );
			B_GiveInvItems(other, self, ItNa_IceWolfFur, Npc_HasItems(other, ItNa_IceWolfFur));
		};
		
		if (Npc_HasItems(other, ItNa_IceWolfFur) > 1) && (Mission_Gestath_Fur == TRUE)
		{
			HuntSay_WhiteWolfFur();
			B_GiveInvItems(self, other, itmi_gold, ((Npc_HasItems(other, ItNa_IceWolfFur) - 1) * 15) );
			B_GiveInvItems(other, self, ItNa_IceWolfFur, Npc_HasItems(other, ItNa_IceWolfFur) - 1);
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_08"); //Skóra warga? W Górniczej Dolinie jest ich a¿ za du¿o!
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItNa_SkoraOrkowegoPsa) > 0)
		{
			AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_15"); //Skóra orkowego psa... Bardzo cenne trofeum. Tych bestii nie spotyka siê ju¿ tak czêsto jak niegdyœ.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItNa_SkoraOrkowegoPsa) * 15) );
			B_GiveInvItems(other, self, ItNa_SkoraOrkowegoPsa, Npc_HasItems(other, ItNa_SkoraOrkowegoPsa));
		};

		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_09"); //Och, nawet skóra cieniostwora, takie s¹ sporo warte.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		{
			AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_10"); //Skóra trolla! Czy ty na nie polujesz?
			AI_Output (other, self, "DIA_NASZ_211_Hunt_SellFur_15_11"); //Nie, po prostu korzystam z ka¿dej okazji...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
			B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
		};

		if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_12"); //No proszê, skóra czarnego trolla!
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
			B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
		};
		
		AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_13"); //Dobra robota. PrzyjdŸ do mnie, jak bêdziesz mia³ nastêpne...
		
		Npc_RemoveInvItems (NASZ_211_Hunt, ItAt_Addon_KeilerFur, Npc_HasItems(NASZ_211_Hunt, ItAt_Addon_KeilerFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItAt_SheepFur, Npc_HasItems(NASZ_211_Hunt, ItAt_SheepFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItAt_WolfFur, Npc_HasItems(NASZ_211_Hunt, ItAt_WolfFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItNa_BlackWolfFur, Npc_HasItems(NASZ_211_Hunt, ItNa_BlackWolfFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItNa_IceWolfFur, Npc_HasItems(NASZ_211_Hunt, ItNa_IceWolfFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItAt_WargFur, Npc_HasItems(NASZ_211_Hunt, ItAt_WargFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItAt_ShadowFur, Npc_HasItems(NASZ_211_Hunt, ItAt_ShadowFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItAt_TrollFur, Npc_HasItems(NASZ_211_Hunt, ItAt_TrollFur));
		Npc_RemoveInvItems (NASZ_211_Hunt, ItAt_TrollBlackFur, Npc_HasItems(NASZ_211_Hunt, ItAt_TrollBlackFur));
	}

	else
	{
		AI_Output (self, other, "DIA_NASZ_211_Hunt_SellFur_11_14"); //Yyy... Ale przecie¿ nie masz ¿adnych skór.
	};
};

//*********************************************************************
//	         Sprzedaz 
//*********************************************************************
INSTANCE DIA_NASZ_211_Hunt_sprzedaz   (C_INFO)
{
	npc         = NASZ_211_Hunt;
 	nr          = 100;
 	condition   = DIA_NASZ_211_Hunt_sprzedaz_Condition;
 	information = DIA_NASZ_211_Hunt_sprzedaz_Info;
 	permanent   = TRUE;
	trade       = TRUE;
 	description = "Poka¿ mi swoje towary.";
};

FUNC INT DIA_NASZ_211_Hunt_sprzedaz_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_211_Hunt_sprzedaz_Info()
{
	B_GiveTradeInv(self);
	AI_Output (other,self ,"DIA_NASZ_211_Hunt_sprzedaz_15_00"); //Poka¿ mi swoje towary.
	AI_Output (self, other,"DIA_NASZ_211_Hunt_sprzedaz_55_01"); //Wybierz sobie.
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_211_Hunt_PICKPOCKET (C_INFO)
{
	npc			= NASZ_211_Hunt;
	nr			= 900;
	condition	= DIA_NASZ_211_Hunt_PICKPOCKET_Condition;
	information	= DIA_NASZ_211_Hunt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_211_Hunt_PICKPOCKET_Condition()
{
	C_Beklauen (36);
};
 
FUNC VOID DIA_NASZ_211_Hunt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_211_Hunt_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_211_Hunt_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_211_Hunt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_211_Hunt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_211_Hunt_PICKPOCKET_DoIt);
};

func void DIA_NASZ_211_Hunt_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,84);
	
	Info_ClearChoices (DIA_NASZ_211_Hunt_PICKPOCKET);
};
	
func void DIA_NASZ_211_Hunt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_211_Hunt_PICKPOCKET);
};