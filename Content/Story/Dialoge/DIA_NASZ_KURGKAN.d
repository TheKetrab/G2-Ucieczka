//////////////////////////////////////////////////////////////////
///	  			 
///
///			DIA_ORC_NASZ_Kurg_Kan
///
///
//////////////////////////////////////////////////////////////////

// ***********************************************************************************************************************
// 	  	DIA_ORC_NASZ_Kurg_Kan_EXIT
// ***********************************************************************************************************************

INSTANCE DIA_ORC_NASZ_Kurg_Kan_EXIT(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 999;
	condition	= DIA_ORC_NASZ_Kurg_Kan_EXIT_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_ORC_NASZ_Kurg_Kan_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_ORC_NASZ_Kurg_Kan_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ORC_NASZ_Kurg_Kan
///////////////////////////////////////////////////////////////////////
instance DIA_ORC_NASZ_Kurg_Kan		(C_INFO)
{
	npc		 	= 	NASZ_Kurg_Kan;
	nr		 	= 	1;
	condition		= 	DIA_ORC_NASZ_Kurg_Kan_Condition;
	information		= 	DIA_ORC_NASZ_Kurg_Kan_Info;
	important		 = 	TRUE;
};

func int DIA_ORC_NASZ_Kurg_Kan_Condition ()
{
	return TRUE;			
};

func void DIA_ORC_NASZ_Kurg_Kan_Info ()
{	
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_00"); //Obcy cz³owiek nie biæ! Obcy cz³owiek nie mordowaæ!
	AI_Output (other, self,"DIA_ORC_NASZ_Kurg_Kan_15_01"); //Gadaj¹cy ork? Co tutaj robisz?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_02"); //Byæ dawniej niewolnik w Stara Kopalnia, teraz byæ ork-wygnaniec. Cz³owiek czeka! Kopi¹cy Will?
	AI_Output (other, self,"DIA_ORC_NASZ_Kurg_Kan_15_03"); //Zaraz! Kurg-Kan? To naprawdê ty? Przecie¿ by³eœ w œrodku kopalni, jak siê zawali³a.
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_04"); //Kurg-Kan znaleŸæ boczny tunel i wyjœæ. Kurg-Kan cieszyæ siê na widok stary przyjaciel!
	AI_Output (other, self,"DIA_ORC_NASZ_Kurg_Kan_15_05"); //No tak, nigdy nie zrobi³em ci krzywdy, wiêc zas³ugujê na miano przyjaciela... Zaraz, dlaczego ork-wygnaniec?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_06"); //Wyjœæ z kopalnia i udaæ siê do swoich bracia. Ale szaman Hosh-Pak przepêdziæ niewolnika. Mówiæ, ¿e niegodny i utraciæ honor.
	AI_Output (other, self,"DIA_ORC_NASZ_Kurg_Kan_15_07"); //Rozumiem, orkowie nie uznali ciê za swojego, bo spêdzi³eœ parê lat w kopalni z ludŸmi. Ale dlaczego tutaj stoisz?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_08"); //Mieszkaæ tu od dawna. Unikaæ bracia. Cz³owiek-pirat zamieszkaæ przy wie¿a ostatnio. Kurg-Kan pilnowaæ w nocy cz³owiek, chcieæ zaprzyjaŸniæ.
	AI_Output (other, self,"DIA_ORC_NASZ_Kurg_Kan_15_09"); //Masz strasznie dziwne sposoby na zaprzyjaŸnienie siê. Facet poprosi³ mnie, bym sprawdzi³ okolicê, bo boi siê o swoje ¿ycie! Ka¿dej nocy, coœ szeleœci i nie pozwala mu zasn¹æ. 
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_10"); //Kurg-Kan przepraszaæ, nie chcieæ wystraszyæ cz³owiek. W nocy ostrzyæ broñ z nuda. Will daæ rada, co zrobiæ?!
	AI_Output (other, self,"DIA_ORC_NASZ_Kurg_Kan_15_11"); //Có¿, trwa wojna. Niedaleko st¹d za³o¿ono obóz...
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_12"); //Kurg-Kan wie, Kurg-Kan widzieæ budowa.
	AI_Output (other, self,"DIA_ORC_NASZ_Kurg_Kan_15_13"); //A wiesz te¿, ¿e nazywaj¹ siê ³owcami orków i nie bêd¹ zadawaæ pytañ, jak ciê tutaj zobacz¹?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_14"); //Will mieæ racjê! Kurg-Kan zagro¿ony. Co zrobiæ, co zrobiæ?
	
	Info_ClearChoices(DIA_ORC_NASZ_Kurg_Kan);
	Info_AddChoice	(DIA_ORC_NASZ_Kurg_Kan, "Bardzo mi przykro.", DIA_ORC_NASZ_Kurg_Kan_Die);
	Info_AddChoice	(DIA_ORC_NASZ_Kurg_Kan, "Pogadam z przywódc¹ ³owców orków.", DIA_ORC_NASZ_Kurg_Kan_SaveHim);
	
};
var int SaveKurgKan;

func void DIA_ORC_NASZ_Kurg_Kan_Die()
{
	AI_ReadyMeleeWeapon	(other);
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Die_00"); //Bardzo mi przykro. Trwa wojna i nie mogê pozwoliæ ¿adnemu orkowi ¿yæ. ¯egnaj.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Die_01"); //Nie, Kurg-Kan nie chcieæ walczyæ z Will-przyjaciel.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Die_02"); //Przykro mi, ale mog³eœ siê tego spodziewaæ b³¹kaj¹c siê przy obozie ludzi.
	SaveKurgKan = -1;
	AI_StopProcessInfos(self);
	//Npc_PercDisable	(self,	PERC_ASSESSTALK);
	self.guild = GIL_ORC;
	Npc_SetTrueGuild(self, GIL_ORC);
	Npc_SetTempAttitude (self, ATT_HOSTILE);
	self.start_aistate				= ZS_MM_AllScheduler;
	self.aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
	//AI_Flee						(self);
	
	Perception_Set_Normal();
	//TODO:bug z walk¹ z orkiem, trzeba najpewniej zrobiæ zs.
	//AI_ReadyMeleeWeapon	(self);
	//Npc_SetTarget (self, other );
	//B_Attack (self, other, AR_KILL, 0);

	B_LogEntry (TOPIC_Miecz_ork, "Problemem okaza³ siê byæ ork, stary znajomy o imieniu Kurg-Kan. Niestety, na wojnie nie mo¿na nikomu ufaæ, wiêc zaj¹³em siê tym problemem jak mog³em.");

};


func void DIA_ORC_NASZ_Kurg_Kan_SaveHim()
{
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_SaveHim_00");  //To co powiem, mo¿e zabrzmieæ trochê szalenie. Pogadam z przywódc¹ ³owców orków.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_SaveHim_01");  //Ale niczego nie obiecujê i nie jestem w stanie zagwarantowaæ, ¿e jak Keroloth siê o tobie dowie, to czy od razu nie poœle za tob¹ ³owców, wiêc b¹dŸ gotowy w razie czego na ucieczkê.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_SaveHim_02");  //Kurg-Kan i tak dziêkowaæ! Will-przyjaciel porozmawiaæ z Keroloth-przywódca i spróbowaæ pomóc.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_SaveHim_03");  //W porz¹dku, wielkoludzie. Czekaj na wieœci ode mnie.
	
	Log_CreateTopic (Topic_OrcInATrap, LOG_MISSION);
	Log_SetTopicStatus(Topic_OrcInATrap, LOG_RUNNING);
	B_LogEntry (Topic_OrcInATrap,"W ¿yciu bym nie pomyœla³, ¿e przyczyn¹ niepokoju Miecza jest mój stary, orkowy przyjaciel z kopalni, Kurg-Kan. Niewolnik, po ucieczce ze Starej Kopalni, nie zosta³ przyjêty przez swoich braci i teraz b³¹ka siê po kolonii. Zgodzi³em siê mu pomóc i porozmawiaæ z Kerolothem. Nie wierzê w sukces, ale zawsze warto spróbowaæ.     "); 
	
	B_StartOtherRoutine(NASZ_110_Keroloth,"PreStart"); // bedzie stal w domu
	B_StartOtherRoutine(NASZ_Kurg_Kan,"Start2"); // caly czas nad mieczem

	SaveKurgKan = true;
	AI_StopProcessInfos(self);
};






///////////////////////////////////////////////////////////////////////
//	Info Follow
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_ORC_NASZ_Kurg_Kan_Follow(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 2;
	condition	= DIA_ORC_NASZ_Kurg_Kan_Follow_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_Follow_Info;
	description = "Mam dla ciebie dobre wieœci.";
};                       
FUNC INT DIA_ORC_NASZ_Kurg_Kan_Follow_Condition()
{
	if(KurgKanUratowany == 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_ORC_NASZ_Kurg_Kan_Follow_Info()
{	
	
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_00");  //Mam dla ciebie dobre wieœci. Keroloth przyjmie ciê do obozu, ale ma kilka warunków.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Follow_01");  //Kurg-Kan s³uchaæ.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_02");  //Musisz mi oddaæ broñ i udaæ siê tam ze mn¹ teraz. W obozie bêdziesz wykonywa³ wszystkie zadania, jakie ci przydziel¹. Sprz¹tanie, mycie, tego typu sprawy.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_03");  //Zgadzaæ siê. Will braæ topór.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_04");  //Dobrze, no to idziemy do obozu. Postaraj siê nie robiæ ¿adnych gwa³townych ruchów. £owcy w twojej obecnoœci mog¹ byæ trochê nerwowi. 
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Follow_05");  //ProwadŸ, przyjaciel.
	KurgKanFollowPC	= 1;
	AI_UnequipWeapons			(self);
	B_giveinvitems (self, other, ItMw_2H_OrcAxe_02,1);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self, "Follow");
};



func void KurgKanRoutine_TickTock30s() {
	if (TimeIsUp(5,-1,KurgKanTanczyDay,-1) || (KAPITEL >= 3)) // 5 dni lub rozdzial 3
	&& (Npc_GetDistToNPC(hero,NASZ_Kurg_Kan) > 2000) // hero jest przynajmniej 20m od orka, zeby tego nie widzial
	{
		if (KAPITEL < 3) {
			B_StartOtherRoutine(NASZ_Kurg_Kan,"WithSword"); // rutyna na drugi rozdzial
		};

		KurgKanWithSword = TRUE;
		ff_remove(KurgKanRoutine_TickTock30s);
	};
};



///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_61000_KurgKan_Success		(C_INFO)
{
	npc		 	= 	NASZ_Kurg_Kan;
	nr		 	= 	3;
	condition		= 	DIA_NASZ_61000_KurgKan_Success_Condition;
	information		= 	DIA_NASZ_61000_KurgKan_Success_Info;
	important		 = 	FALSE;
	description   = "Widzisz? Uda³o siê!";
};

func int DIA_NASZ_61000_KurgKan_Success_Condition ()
{
	if (KurgKanTanczy)
	{
		return TRUE;			
	};
};

func void DIA_NASZ_61000_KurgKan_Success_Info ()
{	
	AI_Output (other, self,"DIA_NASZ_61000_KurgKan_Success_55_00"); //Widzisz? Uda³o siê!
	AI_Output (self, other,"DIA_NASZ_61000_KurgKan_Success_15_01"); //Kurg-Kan wdziêczny, ale nie mieæ czasu. Musieæ pracowaæ. Dziêkowaæ, Will-przyjaciel.
	
	Log_SetTopicStatus(Topic_OrcInATrap, LOG_SUCCESS);

};


// ***********************************************************************************************************************
// 	  	DIA_ORC_NASZ_Kurg_Kan_BRON
// ***********************************************************************************************************************

INSTANCE DIA_ORC_NASZ_Kurg_Kan_BRON(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 4;
	condition	= DIA_ORC_NASZ_Kurg_Kan_BRON_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_BRON_Info;
	permanent	= false;
	description = "Mo¿esz nosiæ broñ?";
};                       
FUNC INT DIA_ORC_NASZ_Kurg_Kan_BRON_Condition()
{
	if (KurgKanWithSword == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_ORC_NASZ_Kurg_Kan_BRON_Info()
{	
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_00"); //Mo¿esz nosiæ broñ? Jak to siê sta³o?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_01"); //Tak, ³owcy pozwoliæ. Kurg-Kan pomóc, ³owcy powiedzieæ, ¿e zas³u¿yæ.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_02"); //Jak im pomog³eœ?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_03"); //Byæ d³uga historia.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_04"); //Rozumiem. Nie chcesz za bardzo o tym mówiæ. Ktoœ inny mo¿e mi o tym wiêcej powiedzieæ?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_05"); //Tak, Godar-³owca.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_06"); //Dobrze, zapytam go. Bywaj. 
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_07"); //Will-przyjaciel, czekaæ!
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_08"); //Tak?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_09"); //Kurg-Kan mieæ proœba. Will du¿o biegaæ, du¿o zbieraæ.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_10"); //Ha, ha! Tu masz racjê, przyjacielu. Co ci trzeba zatem przynieœæ?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_11"); //Kurg-Kan chcieæ dobra broñ. Orki miecz elita. Topór stary, rozpaœæ.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_12"); //Czemu nie poprosisz Jana, ¿eby zrobi³ ci nowy miecz?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_13"); //Pytañ. Jan-kowal powiedzieæ, ¿e byæ artysta, nie zrobiæ orka broñ, bo nie byæ kunsztu w tym.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_14"); //Ca³y Jan. W porz¹dku, rozejrzê siê i przyniosê ci jakaœ porz¹dn¹ broñ.
	
	KurgKanGodarInfo = true;
	Log_CreateTopic (TOPIC_ORCWEAPON, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCWEAPON, LOG_RUNNING);
	B_LogEntry (TOPIC_ORCWEAPON,"Kurg-Kan najwidoczniej mo¿e ju¿ poruszaæ siê po obozie z broni¹ u pasa i æwiczyæ walkê. Poprosi³ mnie, bym poszuka³ i przyniós³ mu miecz orka-elity. Chyba siê nie obrazi, jakbym znalaz³ jednak coœ lepszego."); 
	
};
// ***********************************************************************************************************************
// 	  	DIA_ORC_NASZ_Kurg_Kan_BRON_MAM
// ***********************************************************************************************************************
var int MamRekeTrolla;
INSTANCE DIA_ORC_NASZ_Kurg_Kan_BRON_MAM(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 5;
	condition	= DIA_ORC_NASZ_Kurg_Kan_BRON_MAM_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_BRON_MAM_Info;
	permanent	= false;
	description = "xxx";
};                       
FUNC INT DIA_ORC_NASZ_Kurg_Kan_BRON_MAM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_ORC_NASZ_Kurg_Kan_BRON))
	{
		if(Npc_HasItems(other,ItNa_RekaTrolla) )
		{
			DIA_ORC_NASZ_Kurg_Kan_BRON_MAM.description = "Chcia³eœ broñ elitarnego orka, ale mam naprawdê coœ lepszego.";
			MamRekeTrolla	= true;
			return TRUE;
		}
		else if(Npc_HasItems(other,ItMw_2H_OrcSword_02))
		{
			DIA_ORC_NASZ_Kurg_Kan_BRON_MAM.description = "Mam dla ciebie miecz orka-elity.";
			return TRUE;
		};
	};
};
FUNC VOID DIA_ORC_NASZ_Kurg_Kan_BRON_MAM_Info()
{	
	
	if(MamRekeTrolla == true)
	{
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_01");  //Chcia³eœ broñ elitarnego orka, ale mam naprawdê coœ lepszego.
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_02");  //Nie rozumieæ. Will pokazaæ.
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_03");  //Proszê.
		B_giveinvitems(other,self,ItNa_RekaTrolla,1);
		AI_EquipBestMeleeWeapon	(self);
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_04");  //To byæ piêkna broñ. Pasowaæ do orka. Sk¹d Will to mieæ?
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_05");  //Walczy³em z potê¿nym orkowym dowódc¹. To by³a jego broñ, ale jest za ciê¿ka, bym by³ siê w stanie ni¹ pos³ugiwaæ. No i wtedy pomyœla³em o tobie. Podoba ci siê, co?
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_06");  //Tak. Ale Kurg-Kan nie wiedzieæ, czy j¹ braæ. Byæ niegodny.
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_07");  //Nie opowiadaj bzdur, przyjacielu. Jesteœ godny, bo chcesz u¿yæ tej broni do obrony obozu. A teraz bierz j¹ i idŸ trenowaæ. 
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_08");  //Will-przyjaciel mieæ racja. Dziêkowaæ. Daæ nagroda.
		DodajReputacje(5,REP_LOWCY);
		Log_SetTopicStatus(TOPIC_ORCWEAPON, LOG_SUCCESS);
		Log_AddEntry (TOPIC_ORCWEAPON,"Broñ, któr¹ sprezentowa³ orkowi, zrobi³a na nim ogromne wra¿enie. Na pocz¹tku nie chcia³ jej przyj¹æ, ale po mojej namowie zgodzi³ siê i mnie za to wynagrodzi³."); 
	

	}
	else 
	{
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_09");  //Mam dla ciebie miecz orka-elity.
		B_giveinvitems(other,self,ItMw_2H_OrcSword_02,1);
		AI_EquipBestMeleeWeapon	(self);
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_10");  //Dziêkowaæ, Will-przyjaciel. Byæ dobra broñ, pozwoliæ chroniæ obóz. Will braæ nagroda. 
		DodajReputacje(3,REP_LOWCY);
		Log_SetTopicStatus(TOPIC_ORCWEAPON, LOG_SUCCESS);
		Log_AddEntry (TOPIC_ORCWEAPON,"Kurg-Kan by³ zadowolony z broni orkowego elity, któr¹ mu przynios³em."); 
	
	};
	CreateInvItems	(self, Itmi_gold, 100);
	B_giveinvitems(other,self,Itmi_gold, 100);
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_11");  //Z³oto? Sk¹d ty masz z³oto?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_12");  //Will niem¹dry. Ork zbieraæ i dostawaæ.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_13");  //No tak, g³upi ja.
		
	//AI_StopProcessInfos (self);
};

// ***********************************************************************************************************************
// 	  	DIA_ORC_NASZ_Kurg_Kan_Zbroja
// ***********************************************************************************************************************

INSTANCE DIA_ORC_NASZ_Kurg_Kan_Zbroja(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 6;
	condition	= DIA_ORC_NASZ_Kurg_Kan_Zbroja_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_Zbroja_Info;
	permanent	= FALSE;
	description = "Czy ty masz na sobie zbrojê zrobion¹ z blach paladyna?";
};                       
FUNC INT DIA_ORC_NASZ_Kurg_Kan_Zbroja_Condition()
{
	if(KAPITEL >=3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_ORC_NASZ_Kurg_Kan_Zbroja_Info()
{	
	
	
	// zbroje zak³ada w trzecim rozdziale - sprawdzic TODO
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_00");  //Czy ty masz na sobie zbrojê zrobion¹ z blach paladyna?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Zbroja_01");  //Tak, Jan daæ. Powiedzieæ, ¿e potrzebna zbroja do walki, do ochrony. Atakowaæ zamek z ³owcy.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_02");  //Rozumiem, ¿e trzeba ci by³o daæ zbrojê, ale wybór jest doœæ nietypowy. Muszê zapytaæ Jana, sk¹d ten pomys³.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_03");  //Jesteœ pewien, ¿e chcesz atakowaæ swoich pobratymców? 
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Zbroja_04");  //Tak. Krug-Kan walczyæ za orki i dostaæ w niewola. Uciec i chcieæ wróciæ do bracia, bracia odrzuciæ. Powiedzieæ niegodny. £owcy przyj¹æ do obozu. Teraz ³owcy bracia.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_05");  //Cieszy mnie, ¿e czujesz siê tu szczêœliwy.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Zbroja_06");  //Tak. Krug-Kan móc walczyæ o cz³owieki i ich chroniæ. Pokonaæ bracia kochaj¹cy Beliar. Beliar z³y, œmieræ.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_07");  //Tak, nie jest najprzyjemniejszym z bogów.
	
	AI_StopProcessInfos (self);
};