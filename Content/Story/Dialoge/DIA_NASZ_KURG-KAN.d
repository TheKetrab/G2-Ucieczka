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
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_00"); //Obcy cz�owiek nie bi�! Obcy cz�owiek nie mordowa�!
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_01");  //Gadaj�cy ork? Co tutaj robisz?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_02"); //By� dawniej niewolnik w Stara Kopalnia, teraz by� ork-wygnaniec. Cz�owiek czeka! Kopi�cy Will?
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_03"); //Zaraz! Kurg-Kan? To naprawd� ty? Przecie� by�e� w �rodku kopalni, jak si� zawali�a.
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_04"); //Kurg-Kan znale�� boczny tunel i wyj��. Kurg-Kan cieszy� si� na widok stary przyjaciel!
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_05"); //No tak, nigdy nie zrobi�em ci krzywdy, wi�c zas�uguj� na miano przyjaciela� Zaraz, dlaczego ork-wygnaniec?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_06"); //Wyj�� z kopalnia i uda� si� do swoich bracia. Ale szaman Hosh-Pak przep�dzi� niewolnika. M�wi�, �e niegodny i utraci� honor.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_07"); //Rozumiem, orkowie nie uznali ci� za swojego, bo sp�dzi�e� par� lat w kopalni z lud�mi. Ale dlaczego tutaj stoisz?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_08"); //Mieszka� tu od dawna. Unika� bracia. Cz�owiek-pirat zamieszka� przy wie�a ostatnio. Kurg-Kan pilnowa� w nocy cz�owiek, chcie� zaprzyja�ni�.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_09"); //Masz strasznie dziwne sposoby na zaprzyja�nienie si�. Facet poprosi� mnie, bym sprawdzi� okolic�, bo boi si� o swoje �ycie! Ka�dej nocy, co� szele�ci i nie pozwala mu zasn��. 
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_10"); //Kurg-Kan przeprasza�, nie chcie� wystraszy� cz�owiek. W nocy ostrzy� bro� z nuda. Will da� rada, co zrobi�?!
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_11"); //C�, trwa wojna. Niedaleko st�d za�o�ono ob�z�.
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_12"); //Kurg-Kan wie, Kurg-Kan widzie� budowa.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_13"); //A wiesz te�, �e nazywaj� si� �owcami ork�w i nie b�d� zadawa� pyta�, jak ci� tutaj zobacz�?
	AI_Output (self, other,"DIA_ORC_NASZ_Kurg_Kan_55_14"); //Will mie� racj�! Kurg-Kan zagro�ony. Co zrobi�, co zrobi�?
	Info_ClearChoices(DIA_ORC_NASZ_Kurg_Kan);
	Info_AddChoice	(DIA_ORC_NASZ_Kurg_Kan, "Bardzo mi przykro.", DIA_ORC_NASZ_Kurg_Kan_Die);
	Info_AddChoice	(DIA_ORC_NASZ_Kurg_Kan, "Pogadam z przyw�dc� �owc�w ork�w.", DIA_ORC_NASZ_Kurg_Kan_SaveHim);
	
};
var int SaveKurgKan;

func void DIA_ORC_NASZ_Kurg_Kan_Die()
{
	AI_ReadyMeleeWeapon	(other);
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Die_00");  //Bardzo mi przykro. Trwa wojna i nie mog� pozwoli� �adnemu orkowi �y�. �egnaj.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Die_01");  //Nie, Kurg-Kan nie chcie� walczy� z Will-przyjaciel.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Die_02");  //Przykro mi, ale mog�e� si� tego spodziewa� b��kaj�c si� przy obozie ludzi.
	SaveKurgKan = -1;
	AI_StopProcessInfos(self);
	//Npc_PercDisable	(self,	PERC_ASSESSTALK);
	self.guild = GIL_ORC;
	Npc_SetTrueGuild(self, GIL_ORC);
	Npc_SetTempAttitude (self, ATT_HOSTILE);
	self.start_aistate				= ZS_MM_AllScheduler;
	self.aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
	AI_Flee						(self);
	//TODO:bug z walk� z orkiem, trzeba najpewniej zrobi� zs.
	//AI_ReadyMeleeWeapon	(self);
	//Npc_SetTarget (self, other );
	//B_Attack (self, other, AR_KILL, 0);	
};

//TODO: Przenie�� do odpowiedniego pliku
const string	Topic_OrcInATrap	= "Ork w potrzasku";
//self,other, other,self,
func void DIA_ORC_NASZ_Kurg_Kan_SaveHim()
{
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_SaveHim_00");  //To co powiem, mo�e zabrzmie� troch� szalenie. Pogadam z przyw�dc� �owc�w ork�w.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_SaveHim_01");  //Ale niczego nie obiecuj� i nie jestem w stanie zagwarantowa�, �e jak Keroloth si� o tobie dowie, to czy od razu nie po�le za tob� �owc�w, wi�c b�d� gotowy w razie czego na ucieczk�.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_SaveHim_02");  //Kurg-Kan i tak dzi�kowa�! Will-przyjaciel porozmawia� z Keroloth-przyw�dca i spr�bowa� pom�c.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_SaveHim_03");  //W porz�dku, wielkoludzie. Czekaj na wie�ci ode mnie.
	Log_CreateTopic (Topic_OrcInATrap, LOG_MISSION);
	Log_SetTopicStatus(Topic_OrcInATrap, LOG_RUNNING);
	Log_AddEntry (Topic_OrcInATrap,"W �yciu bym nie pomy�la�, �e przyczyn� niepokoju Miecza jest m�j stary, orkowy przyjaciel z kopalni, Kurg-Kan. Niewolnik, po ucieczce ze Starej Kopalni, nie zosta� przyj�ty przez swoich braci i teraz b��ka si� po kolonii. Zgodzi�em si� mu pom�c i porozmawia� z Kerolothem. Nie wierz� w sukces, ale zawsze warto spr�bowa�.     "); 
	SaveKurgKan = true;
	AI_StopProcessInfos(self);
};

INSTANCE DIA_ORC_NASZ_Kurg_Kan_Follow(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 1;
	condition	= DIA_ORC_NASZ_Kurg_Kan_Follow_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_Follow_Info;
	description = "Mam dla ciebie dobre wie�ci.";
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
	
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_00");  //Mam dla ciebie dobre wie�ci. Keroloth przyjmie ci� do obozu, ale ma kilka warunk�w.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Follow_01");  //Kurg-Kan s�ucha�.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_02");  //Musisz mi odda� bro� i uda� si� tam ze mn� teraz. W obozie b�dziesz wykonywa� wszystkie zadania, jakie ci przydziel�. Sprz�tanie, mycie, tego typu sprawy.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_03");  //Zgadza� si�. Will bra� top�r.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Follow_04");  //Dobrze, no to idziemy do obozu. Postaraj si� nie robi� �adnych gwa�townych ruch�w. �owcy w twojej obecno�ci mog� by� troch� nerwowi. 
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Follow_05");  //Prowad�, przyjaciel.
	KurgKanFollowPC	= 1;
	AI_UnequipWeapons			(self);
	B_giveinvitems (self, other, ItMw_2H_OrcAxe_02,1);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self, "Follow");
};

// ***********************************************************************************************************************
// 	  	DIA_ORC_NASZ_Kurg_Kan_BRON
// ***********************************************************************************************************************
//TODO: doda� do globals
const string TOPIC_ORCWEAPON = "Bro� dla Orka";

INSTANCE DIA_ORC_NASZ_Kurg_Kan_BRON(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 1;
	condition	= DIA_ORC_NASZ_Kurg_Kan_BRON_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_BRON_Info;
	permanent	= false;
	description = "Mo�esz nosi� bro�?";
};                       
FUNC INT DIA_ORC_NASZ_Kurg_Kan_BRON_Condition()
{
	if(KAPITEL >=2 && KurgKanTanczy)
	{
		return TRUE;
	};
};
FUNC VOID DIA_ORC_NASZ_Kurg_Kan_BRON_Info()
{	
	//other,self,
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_00");  //Mo�esz nosi� bro�? Jak to si� sta�o?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_01");  //Tak, �owcy pozwoli�. Kurg-Kan pom�c, �owcy powiedzie�, �e zas�u�y�.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_02");  //Jak im pomog�e�?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_03");  //By� d�uga historia.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_04");  //Rozumiem. Nie chcesz za bardzo o tym m�wi�. Kto� inny mo�e mi o tym wi�cej powiedzie�?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_05");  //Tak, Godar-�owca.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_06");  //Dobrze, zapytam go. Bywaj. 
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_07");  //Will-przyjaciel, czeka�!
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_08");  //Tak?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_09");  //Kurg-Kan mie� pro�ba. Will du�o biega�, du�o zbiera�.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_10");  //Ha, ha! Tu masz racj�, przyjacielu. Co ci trzeba zatem przynie��?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_11");  //Kurg-Kan chcie� dobra bro�. Orki miecz elita. Top�r stary, rozpa��.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_12");  //Czemu nie poprosisz Jana, �eby zrobi� ci nowy miecz?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Bron_13");  //Pyta�. Jan-kowal powiedzie�, �e by� artysta, nie zrobi� orka bro�, bo nie by� kunsztu w tym.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Bron_14");  //Ca�y Jan. W porz�dku, rozejrz� si� i przynios� ci jaka� porz�dn� bro�.
	KurgKanGodarInfo = true;
	Log_CreateTopic (TOPIC_ORCWEAPON, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCWEAPON, LOG_RUNNING);
	Log_AddEntry (TOPIC_ORCWEAPON,"Kurg-Kan najwidoczniej mo�e ju� porusza� si� po obozie z broni� u pasa i �wiczy� walk�. Poprosi� mnie, bym poszuka� i przyni�s� mu miecz orka-elity. Chyba si� nie obrazi, jakbym znalaz� jednak co� lepszego."); 
	
};
// ***********************************************************************************************************************
// 	  	DIA_ORC_NASZ_Kurg_Kan_BRON_MAM
// ***********************************************************************************************************************
var int MamRekeTrolla;
INSTANCE DIA_ORC_NASZ_Kurg_Kan_BRON_MAM(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 1;
	condition	= DIA_ORC_NASZ_Kurg_Kan_BRON_MAM_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_BRON_MAM_Info;
	permanent	= false;
	description = "Mo�esz nosi� bro�?";
};                       
FUNC INT DIA_ORC_NASZ_Kurg_Kan_BRON_MAM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_ORC_NASZ_Kurg_Kan_BRON))
	{
		if(Npc_HasItems(other,ItNa_RekaTrolla) )
		{
			DIA_ORC_NASZ_Kurg_Kan_BRON_MAM.description = "Chcia�e� bro� elitarnego orka, ale mam naprawd� co� lepszego.";
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
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_01");  //Chcia�e� bro� elitarnego orka, ale mam naprawd� co� lepszego.
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_BRON_MAM_02");  //Nie rozumie�. Will pokaza�.
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_03");  //Prosz�.
		B_giveinvitems(other,self,ItNa_RekaTrolla,1);
		AI_EquipBestMeleeWeapon	(self);
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_BRON_MAM_03");  //To by� pi�kna bro�. Pasowa� do orka. Sk�d Will to mie�?
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_04");  //Walczy�em z pot�nym orkowym dow�dc�. To by�a jego bro�, ale jest za ci�ka, bym by� si� w stanie ni� pos�ugiwa�. No i wtedy pomy�la�em o tobie. Podoba ci si�, co?
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_BRON_MAM_05");  //Tak. Ale Kurg-Kan nie wiedzie�, czy j� bra�. By� niegodny.
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_06");  //Nie opowiadaj bzdur, przyjacielu. Jeste� godny, bo chcesz u�y� tej broni do obrony obozu. A teraz bierz j� i id� trenowa�. 
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_BRON_MAM_07");  //Will-przyjaciel mie� racja. Dzi�kowa�. Da� nagroda.
		DodajReputacje(5,REP_LOWCY);
		Log_SetTopicStatus(TOPIC_ORCWEAPON, LOG_SUCCESS);
		Log_AddEntry (TOPIC_ORCWEAPON,"Bro�, kt�r� sprezentowa� orkowi, zrobi�a na nim ogromne wra�enie. Na pocz�tku nie chcia� jej przyj��, ale po mojej namowie zgodzi� si� i mnie za to wynagrodzi�."); 
	

	}
	else 
	{
		AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_08");  //Mam dla ciebie miecz orka-elity.	
		B_giveinvitems(other,self,ItMw_2H_OrcSword_02,1);
		AI_EquipBestMeleeWeapon	(self);
		AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_BRON_MAM_09");  //Dzi�kowa�, Will-przyjaciel. By� dobra bro�, pozwoli� chroni� ob�z. Will bra� nagroda. 
		DodajReputacje(3,REP_LOWCY);
		Log_SetTopicStatus(TOPIC_ORCWEAPON, LOG_SUCCESS);
		Log_AddEntry (TOPIC_ORCWEAPON,"Kurg-Kan by� zadowolony z broni orkowego elity, kt�r� mu przynios�em."); 
	
	};
	CreateInvItems	(self, Itmi_gold, 100);
	B_giveinvitems(other,self,Itmi_gold, 100);
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_10");  //Z�oto? Sk�d ty masz z�oto?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_BRON_MAM_11");  //Will niem�dry. Ork zbiera� i dostawa�.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_BRON_MAM_12");  //No tak, g�upi ja.
		
	//AI_StopProcessInfos (self);
};

// ***********************************************************************************************************************
// 	  	DIA_ORC_NASZ_Kurg_Kan_Zbroja
// ***********************************************************************************************************************

INSTANCE DIA_ORC_NASZ_Kurg_Kan_Zbroja(C_INFO)
{
	npc		= NASZ_Kurg_Kan;
	nr		= 1;
	condition	= DIA_ORC_NASZ_Kurg_Kan_Zbroja_Condition;
	information	= DIA_ORC_NASZ_Kurg_Kan_Zbroja_Info;
	permanent	= TRUE;
	description = "Czy ty masz na sobie zbroj� zrobion� z blach paladyna?";
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
	PrintS_Ext("ZA�O�ENIE ZBROI JEST TODO", RGBA(255,255,255,0));
	
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_00");  //Czy ty masz na sobie zbroj� zrobion� z blach paladyna?
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Zbroja_01");  //Tak, Jan da�. Powiedzie�, �e potrzebna zbroja do walki, do ochrony. Atakowa� zamek z �owcy.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_02");  //Rozumiem, �e trzeba ci by�o da� zbroj�, ale wyb�r jest do�� nietypowy. Musz� zapyta� Jana, sk�d ten pomys�.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_03");  //Jeste� pewien, �e chcesz atakowa� swoich pobratymc�w? 
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Zbroja_04");  //Tak. Krug-Kan walczy� za orki i dosta� w niewola. Uciec i chcie� wr�ci� do bracia, bracia odrzuci�. Powiedzie� niegodny. �owcy przyj�� do obozu. Teraz �owcy bracia.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_05");  //Cieszy mnie, �e czujesz si� tu szcz�liwy.
	AI_Output (self,other,"DIA_ORC_NASZ_Kurg_Kan_55_Zbroja_06");  //Tak. Krug-Kan m�c walczy� o cz�owieki i ich chroni�. Pokona� bracia kochaj�cy Beliar. Beliar z�y, �mier�.
	AI_Output (other,self,"DIA_ORC_NASZ_Kurg_Kan_15_Zbroja_07");  //Tak, nie jest najprzyjemniejszym z bog�w.
	
	AI_StopProcessInfos (self);
};