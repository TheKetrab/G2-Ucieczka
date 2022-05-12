
func void ApplyKurgKanArmor() {

	if (KURG_KAN_REFRESH_ARMOR_IS_NECESSARY && Npc_GetDistToNPC(hero,NASZ_452_KurgKan) < 2000) {
		KURG_KAN_REFRESH_ARMOR_IS_NECESSARY = FALSE;
		B_SetVisuals_OrcPal(NASZ_452_KurgKan);
		//ff_remove(ApplyKurgKanArmor); // FIX U12 - niech ten tick tock odœwie¿a do koñca gry, bo trzeba odœwie¿aæ co wczytanie
	};
};


// ***********************************************************************************************************************
// 	  	DIA_NASZ_452_KurgKan_EXIT
// ***********************************************************************************************************************

INSTANCE DIA_NASZ_452_KurgKan_EXIT(C_INFO)
{
	npc		= NASZ_452_KurgKan;
	nr		= 999;
	condition	= DIA_NASZ_452_KurgKan_EXIT_Condition;
	information	= DIA_NASZ_452_KurgKan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_NASZ_452_KurgKan_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NASZ_452_KurgKan_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_452_KurgKan_Hello		(C_INFO)
{
	npc		 	= 	NASZ_452_KurgKan;
	nr		 	= 	1;
	condition		= 	DIA_NASZ_452_KurgKan_Hello_Condition;
	information		= 	DIA_NASZ_452_KurgKan_Hello_Info;
	important		 = 	TRUE;
};

func int DIA_NASZ_452_KurgKan_Hello_Condition ()
{
	return TRUE;			
};

func void DIA_NASZ_452_KurgKan_Hello_Info ()
{	
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_00"); //Obcy cz³owiek nie biæ! Obcy cz³owiek nie mordowaæ!
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Hello_15_01"); //Gadaj¹cy ork? Co tutaj robisz?
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_02"); //Byæ dawniej niewolnik w Stara Kopalnia, teraz byæ ork-wygnaniec. Cz³owiek czeka! Kopi¹cy Will?
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Hello_15_03"); //Zaraz! Kurg-Kan? To naprawdê ty? Przecie¿ by³eœ w œrodku kopalni, jak siê zawali³a.
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_04"); //Kurg-Kan znaleŸæ boczny tunel i wyjœæ. Kurg-Kan cieszyæ siê na widok stary przyjaciel!
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Hello_15_05"); //No tak, nigdy nie zrobi³em ci krzywdy, wiêc zas³ugujê na miano przyjaciela... Zaraz, dlaczego ork-wygnaniec?
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_06"); //Wyjœæ z kopalnia i udaæ siê do swoich bracia. Ale szaman Hosh-Pak przepêdziæ niewolnika. Mówiæ, ¿e niegodny i utraciæ honor.
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Hello_15_07"); //Rozumiem, orkowie nie uznali ciê za swojego, bo spêdzi³eœ parê lat w kopalni z ludŸmi. Ale dlaczego tutaj stoisz?
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_08"); //Mieszkaæ tu od dawna. Unikaæ bracia. Cz³owiek-pirat zamieszkaæ przy wie¿a ostatnio. Kurg-Kan pilnowaæ w nocy cz³owiek, chcieæ zaprzyjaŸniæ.
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Hello_15_09"); //Masz strasznie dziwne sposoby na zaprzyjaŸnienie siê. Facet poprosi³ mnie, bym sprawdzi³ okolicê, bo boi siê o swoje ¿ycie! Ka¿dej nocy, coœ szeleœci i nie pozwala mu zasn¹æ. 
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_10"); //Kurg-Kan przepraszaæ, nie chcieæ wystraszyæ cz³owiek. W nocy ostrzyæ broñ z nuda. Will daæ rada, co zrobiæ?!
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Hello_15_11"); //Có¿, trwa wojna. Niedaleko st¹d za³o¿ono obóz...
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_12"); //Kurg-Kan wie, Kurg-Kan widzieæ budowa.
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Hello_15_13"); //A wiesz te¿, ¿e nazywaj¹ siê ³owcami orków i nie bêd¹ zadawaæ pytañ, jak ciê tutaj zobacz¹?
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Hello_55_14"); //Will mieæ racjê! Kurg-Kan zagro¿ony. Co zrobiæ, co zrobiæ?
	
	Info_ClearChoices(DIA_NASZ_452_KurgKan_Hello);
		Info_AddChoice	(DIA_NASZ_452_KurgKan_Hello, "Bardzo mi przykro.", DIA_NASZ_452_KurgKan_Die);
		if (KAPITEL < 3) {
			Info_AddChoice	(DIA_NASZ_452_KurgKan_Hello, "Pogadam z przywódc¹ ³owców orków.", DIA_NASZ_452_KurgKan_SaveHim);
		};
	
};
var int SaveKurgKan;

func void DIA_NASZ_452_KurgKan_Die()
{
	AI_ReadyMeleeWeapon	(other);
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Die_15_00"); //Bardzo mi przykro. Trwa wojna i nie mogê pozwoliæ ¿adnemu orkowi ¿yæ. ¯egnaj.
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Die_55_01"); //Nie, Kurg-Kan nie chcieæ walczyæ z Will-przyjaciel.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Die_15_02"); //Przykro mi, ale mog³eœ siê tego spodziewaæ b³¹kaj¹c siê przy obozie ludzi.
	SaveKurgKan = -1;

	B_LogEntry (TOPIC_Miecz_ork, "Problemem okaza³ siê byæ ork, stary znajomy o imieniu Kurg-Kan. Niestety, na wojnie nie mo¿na nikomu ufaæ, wiêc zaj¹³em siê tym problemem jak mog³em.");

	// FIX UCIECZKA 1.1 - udalo sie naprawic to, ze KurgKan nie atakowal.
	// Problemem bylo to, ze aivar AIV_FightDistCancel byl ustawiony na 0...
	Info_ClearChoices(DIA_NASZ_452_KurgKan_Hello);
	Info_AddChoice	(DIA_NASZ_452_KurgKan_Hello, DIALOG_ENDE, DIA_NASZ_452_KurgKan_DeadEnd);

};

func void DIA_NASZ_452_KurgKan_DeadEnd() {
	
	var c_npc kurgkan; kurgkan = Hlp_GetNpc(NASZ_452_KurgKan);
	kurgkan.aivar[AIV_LASTTARGET] = PC_Hero;
	
	kurgkan.aivar[AIV_FightDistCancel] = 2000; // 20m
	
	AI_StopProcessInfos(self);
	Perception_Set_Normal();
	self.guild = GIL_ORC;
	Npc_SetTrueGuild(self, GIL_ORC);
	B_Attack(self,hero,AR_KILL,0);
};


func void DIA_NASZ_452_KurgKan_SaveHim()
{
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_SaveHim_15_00");  //To co powiem, mo¿e zabrzmieæ trochê szalenie. Pogadam z przywódc¹ ³owców orków.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_SaveHim_15_01");  //Ale niczego nie obiecujê i nie jestem w stanie zagwarantowaæ, ¿e jak Keroloth siê o tobie dowie, to czy od razu nie poœle za tob¹ ³owców, wiêc b¹dŸ gotowy w razie czego na ucieczkê.
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_SaveHim_55_02");  //Kurg-Kan i tak dziêkowaæ! Will-przyjaciel porozmawiaæ z Keroloth-przywódca i spróbowaæ pomóc.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_SaveHim_15_03");  //W porz¹dku, wielkoludzie. Czekaj na wieœci ode mnie.
	
	Log_CreateTopic (Topic_OrcInATrap, LOG_MISSION);
	Log_SetTopicStatus(Topic_OrcInATrap, LOG_RUNNING);
	B_LogEntry (Topic_OrcInATrap,"W ¿yciu bym nie pomyœla³, ¿e przyczyn¹ niepokoju Miecza jest mój stary, orkowy przyjaciel z kopalni, Kurg-Kan. Niewolnik, po ucieczce ze Starej Kopalni, nie zosta³ przyjêty przez swoich braci i teraz b³¹ka siê po kolonii. Zgodzi³em siê mu pomóc i porozmawiaæ z Kerolothem. Nie wierzê w sukces, ale zawsze warto spróbowaæ.     "); 
	
	B_StartOtherRoutine(NASZ_110_Keroloth,"PreStart"); // bedzie stal w domu
	B_StartOtherRoutine(NASZ_452_KurgKan,"Start2"); // caly czas nad mieczem

	SaveKurgKan = true;
	AI_StopProcessInfos(self);
};






///////////////////////////////////////////////////////////////////////
//	Info Follow
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_452_KurgKan_Follow(C_INFO)
{
	npc		= NASZ_452_KurgKan;
	nr		= 2;
	condition	= DIA_NASZ_452_KurgKan_Follow_Condition;
	information	= DIA_NASZ_452_KurgKan_Follow_Info;
	description = "Mam dla ciebie dobre wieœci.";
};                       
FUNC INT DIA_NASZ_452_KurgKan_Follow_Condition()
{
	if(KurgKanUratowany == 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_452_KurgKan_Follow_Info()
{	
	
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Follow_15_00");  //Mam dla ciebie dobre wieœci. Keroloth przyjmie ciê do obozu, ale ma kilka warunków.
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Follow_55_01");  //Kurg-Kan s³uchaæ.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Follow_15_02");  //Musisz mi oddaæ broñ i udaæ siê tam ze mn¹ teraz. W obozie bêdziesz wykonywa³ wszystkie zadania, jakie ci przydziel¹. Sprz¹tanie, mycie, tego typu sprawy.
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Follow_15_03");  //Zgadzaæ siê. Will braæ topór.
	B_giveinvitems (self, other, ItMw_2H_OrcAxe_02,1);
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Follow_15_04");  //Dobrze, no to idziemy do obozu. Postaraj siê nie robiæ ¿adnych gwa³townych ruchów. £owcy w twojej obecnoœci mog¹ byæ trochê nerwowi. 
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Follow_55_05");  //ProwadŸ, przyjaciel.
	KurgKanFollowPC	= 1;
	AI_UnequipWeapons			(self);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self, "Follow");
};



func void KurgKanRoutine_TickTock30s() {
	if (TimeIsUp(5,-1,KurgKanTanczyDay,-1) || (KAPITEL >= 3)) // 5 dni lub rozdzial 3
	&& (Npc_GetDistToNPC(hero,NASZ_452_KurgKan) > 2000) // hero jest przynajmniej 20m od orka, zeby tego nie widzial
	{
		if (KAPITEL < 3) {
			B_StartOtherRoutine(NASZ_452_KurgKan,"WithSword"); // rutyna na drugi rozdzial
		};

		KurgKanWithSword = TRUE;
		ff_remove(KurgKanRoutine_TickTock30s);
	};
};



///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_452_KurgKan_Success		(C_INFO)
{
	npc		 	= 	NASZ_452_KurgKan;
	nr		 	= 	3;
	condition		= 	DIA_NASZ_452_KurgKan_Success_Condition;
	information		= 	DIA_NASZ_452_KurgKan_Success_Info;
	important		 = 	FALSE;
	description   = "Widzisz? Uda³o siê!";
};

func int DIA_NASZ_452_KurgKan_Success_Condition ()
{
	if (KurgKanTanczy)
	{
		return TRUE;			
	};
};

func void DIA_NASZ_452_KurgKan_Success_Info ()
{	
	AI_Output (other, self,"DIA_NASZ_452_KurgKan_Success_55_00"); //Widzisz? Uda³o siê!
	AI_Output (self, other,"DIA_NASZ_452_KurgKan_Success_15_01"); //Kurg-Kan wdziêczny, ale nie mieæ czasu. Musieæ pracowaæ. Dziêkowaæ, Will-przyjaciel.
	
	B_GivePlayerXP(300);
	Log_SetTopicStatus(Topic_OrcInATrap, LOG_SUCCESS);

};


// ***********************************************************************************************************************
// 	  	DIA_NASZ_452_KurgKan_BRON
// ***********************************************************************************************************************

INSTANCE DIA_NASZ_452_KurgKan_BRON(C_INFO)
{
	npc		= NASZ_452_KurgKan;
	nr		= 4;
	condition	= DIA_NASZ_452_KurgKan_BRON_Condition;
	information	= DIA_NASZ_452_KurgKan_BRON_Info;
	permanent	= false;
	description = "Mo¿esz nosiæ broñ?";
};                       
FUNC INT DIA_NASZ_452_KurgKan_BRON_Condition()
{
	if (KurgKanWithSword == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_452_KurgKan_BRON_Info()
{	
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_00"); //Mo¿esz nosiæ broñ? Jak to siê sta³o?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Bron_55_01"); //Tak, ³owcy pozwoliæ. Kurg-Kan pomóc, ³owcy powiedzieæ, ¿e zas³u¿yæ.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_02"); //Jak im pomog³eœ?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Bron_55_03"); //Byæ d³uga historia.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_04"); //Rozumiem. Nie chcesz za bardzo o tym mówiæ. Ktoœ inny mo¿e mi o tym wiêcej powiedzieæ?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Bron_55_05"); //Tak, Godar-³owca.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_06"); //Dobrze, zapytam go. Bywaj. 
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Bron_55_07"); //Will-przyjaciel, czekaæ!
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_08"); //Tak?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Bron_55_09"); //Kurg-Kan mieæ proœba. Will du¿o biegaæ, du¿o zbieraæ.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_10"); //Ha, ha! Tu masz racjê, przyjacielu. Co ci trzeba zatem przynieœæ?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Bron_55_11"); //Kurg-Kan chcieæ dobra broñ. Orki miecz elita. Topór stary, rozpaœæ.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_12"); //Czemu nie poprosisz Jana, ¿eby zrobi³ ci nowy miecz?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Bron_55_13"); //Pytaæ. Jan-kowal powiedzieæ, ¿e byæ artysta, nie zrobiæ orka broñ, bo nie byæ kunsztu w tym.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Bron_15_14"); //Ca³y Jan. W porz¹dku, rozejrzê siê i przyniosê ci jak¹œ porz¹dn¹ broñ.
	
	KurgKanGodarInfo = true;
	Log_CreateTopic (TOPIC_OrcWeapon, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcWeapon, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcWeapon,"Kurg-Kan najwidoczniej mo¿e ju¿ poruszaæ siê po obozie z broni¹ u pasa i æwiczyæ walkê. Poprosi³ mnie, bym poszuka³ i przyniós³ mu miecz orka-elity. Chyba siê nie obrazi, jakbym znalaz³ jednak coœ lepszego."); 
	
};
// ***********************************************************************************************************************
// 	  	DIA_NASZ_452_KurgKan_BRON_MAM
// ***********************************************************************************************************************
var int MamRekeTrolla;
INSTANCE DIA_NASZ_452_KurgKan_BRON_MAM(C_INFO)
{
	npc		= NASZ_452_KurgKan;
	nr		= 5;
	condition	= DIA_NASZ_452_KurgKan_BRON_MAM_Condition;
	information	= DIA_NASZ_452_KurgKan_BRON_MAM_Info;
	permanent	= false;
	description = "xxx";
};                       
FUNC INT DIA_NASZ_452_KurgKan_BRON_MAM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NASZ_452_KurgKan_BRON))
	{
		if(Npc_HasItems(other,ItNa_RekaTrolla) )
		{
			DIA_NASZ_452_KurgKan_BRON_MAM.description = "Chcia³eœ broñ elitarnego orka, ale mam naprawdê coœ lepszego.";
			MamRekeTrolla	= true;
			return TRUE;
		}
		else if(Npc_HasItems(other,ItMw_2H_OrcSword_02))
		{
			DIA_NASZ_452_KurgKan_BRON_MAM.description = "Mam dla ciebie miecz orka-elity.";
			return TRUE;
		};
	};
};
FUNC VOID DIA_NASZ_452_KurgKan_BRON_MAM_Info()
{	
	
	if(MamRekeTrolla == true)
	{
		AI_Output (other,self,"DIA_NASZ_452_KurgKan_MamBron_15_01");  //Chcia³eœ broñ elitarnego orka, ale mam naprawdê coœ lepszego.
		AI_Output (self,other,"DIA_NASZ_452_KurgKan_MamBron_15_02");  //Nie rozumieæ. Will pokazaæ.
		AI_Output (other,self,"DIA_NASZ_452_KurgKan_MamBron_15_03");  //Proszê.
		B_giveinvitems(other,self,ItNa_RekaTrolla,1);
		AI_EquipBestMeleeWeapon	(self);
		AI_Output (self,other,"DIA_NASZ_452_KurgKan_MamBron_15_04");  //To byæ piêkna broñ. Pasowaæ do orka. Sk¹d Will to mieæ?
		AI_Output (other,self,"DIA_NASZ_452_KurgKan_MamBron_15_05");  //Walczy³em z potê¿nym orkowym dowódc¹. To by³a jego broñ, ale jest za ciê¿ka, bym by³ siê w stanie ni¹ pos³ugiwaæ. No i wtedy pomyœla³em o tobie. Podoba ci siê, co?
		AI_Output (self,other,"DIA_NASZ_452_KurgKan_MamBron_15_06");  //Tak. Ale Kurg-Kan nie wiedzieæ, czy j¹ braæ. Byæ niegodny.
		AI_Output (other,self,"DIA_NASZ_452_KurgKan_MamBron_15_07");  //Nie opowiadaj bzdur, przyjacielu. Jesteœ godny, bo chcesz u¿yæ tej broni do obrony obozu. A teraz bierz j¹ i idŸ trenowaæ. 
		AI_Output (self,other,"DIA_NASZ_452_KurgKan_MamBron_15_08");  //Will-przyjaciel mieæ racja. Dziêkowaæ. Daæ nagroda.
		DodajReputacje(2,REP_LOWCY);
		Log_SetTopicStatus(TOPIC_OrcWeapon, LOG_SUCCESS);
		Log_AddEntry (TOPIC_OrcWeapon,"Broñ, któr¹ sprezentowa³em orkowi, zrobi³a na nim ogromne wra¿enie. Na pocz¹tku nie chcia³ jej przyj¹æ, ale po mojej namowie zgodzi³ siê i mnie za to wynagrodzi³."); 
	

	}
	else 
	{
		AI_Output (other,self,"DIA_NASZ_452_KurgKan_MamBron_15_09");  //Mam dla ciebie miecz orka-elity.
		B_giveinvitems(other,self,ItMw_2H_OrcSword_02,1);
		AI_EquipBestMeleeWeapon	(self);
		AI_Output (self,other,"DIA_NASZ_452_KurgKan_MamBron_15_10");  //Dziêkowaæ, Will-przyjaciel. Byæ dobra broñ, pozwoliæ chroniæ obóz. Will braæ nagroda. 
		DodajReputacje(1,REP_LOWCY);
		Log_SetTopicStatus(TOPIC_OrcWeapon, LOG_SUCCESS);
		Log_AddEntry (TOPIC_OrcWeapon,"Kurg-Kan by³ zadowolony z broni orkowego elity, któr¹ mu przynios³em."); 
	
	};
	
	B_GivePlayerXP(700);
	CreateInvItems	(self, Itmi_gold, 100);
	B_giveinvitems(self,other,Itmi_gold, 100);
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_MamBron_15_11");  //Z³oto? Sk¹d ty masz z³oto?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_MamBron_55_12");  //Will niem¹dry. Ork zbieraæ i dostawaæ.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_MamBron_15_13");  //No tak, g³upi ja.
		
	//AI_StopProcessInfos (self);
};

// ***********************************************************************************************************************
// 	  	DIA_NASZ_452_KurgKan_Zbroja
// ***********************************************************************************************************************

INSTANCE DIA_NASZ_452_KurgKan_Zbroja(C_INFO)
{
	npc		= NASZ_452_KurgKan;
	nr		= 6;
	condition	= DIA_NASZ_452_KurgKan_Zbroja_Condition;
	information	= DIA_NASZ_452_KurgKan_Zbroja_Info;
	permanent	= FALSE;
	description = "Czy ty masz na sobie zbrojê zrobion¹ z blach paladyna?";
};                       
FUNC INT DIA_NASZ_452_KurgKan_Zbroja_Condition()
{
	if(KAPITEL >=3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_452_KurgKan_Zbroja_Info()
{	
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Zbroja_15_00");  //Czy ty masz na sobie zbrojê zrobion¹ z blach paladyna?
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Zbroja_55_01");  //Tak, Jan daæ. Powiedzieæ, ¿e potrzebna zbroja do walki, do ochrony. Atakowaæ zamek z ³owcy.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Zbroja_15_02");  //Rozumiem, ¿e trzeba by³o ci daæ zbrojê, ale wybór jest doœæ nietypowy. Muszê zapytaæ Jana, sk¹d ten pomys³.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Zbroja_15_03");  //Jesteœ pewien, ¿e chcesz atakowaæ swoich pobratymców? 
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Zbroja_55_04");  //Tak. Kurg-Kan walczyæ za orki i dostaæ w niewola. Uciec i chcieæ wróciæ do bracia, bracia odrzuciæ. Powiedzieæ niegodny. £owcy przyj¹æ do obozu. Teraz ³owcy bracia.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Zbroja_15_05");  //Cieszy mnie, ¿e czujesz siê tu szczêœliwy.
	AI_Output (self,other,"DIA_NASZ_452_KurgKan_Zbroja_55_06");  //Tak. Kurg-Kan móc walczyæ o cz³owieki i ich chroniæ. Pokonaæ bracia kochaj¹cy Beliar. Beliar z³y, œmieræ.
	AI_Output (other,self,"DIA_NASZ_452_KurgKan_Zbroja_15_07");  //Tak, nie jest najprzyjemniejszym z bogów.
	
	AI_StopProcessInfos (self);
};