
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_003_Kopacz_EXIT   (C_INFO)
{
	npc         = NASZ_003_Kopacz;
	nr          = 999;
	condition   = DIA_NASZ_003_Kopacz_EXIT_Condition;
	information = DIA_NASZ_003_Kopacz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_003_Kopacz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_003_Kopacz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_003_Kopacz_hello		(C_INFO)
{
	npc		 	 = 	NASZ_003_Kopacz;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_003_Kopacz_hello_Condition;
	information	 = 	DIA_NASZ_003_Kopacz_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int DIA_NASZ_003_Kopacz_hello_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_HelpIsReady))
	{
		return TRUE;
	};
};
func void DIA_NASZ_003_Kopacz_hello_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_00"); //Wybawcy!
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_01"); //Co tu robisz?
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_02"); //Orkowie, orkowie! To oni mnie porwali!
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_03"); //Torturowali mnie... By³em wiêŸniem. Przez ca³y ten czas myœla³em tylko o szybkiej œmierci.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_04"); //Co chcieli wiedzieæ orkowie?
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_05"); //O ludziach w Górniczej Dolinie... Mia³em im wszystko powiedzieæ, a ja nic nie wiedzia³em. Musia³em coœ wymyœliæ.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_06"); //I co im powiedzia³eœ?
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_07"); //¯e w Górniczej Dolinie jest pe³no paladynów, mimo ¿e opuœcili zamek. Chyba siê wystraszyli, bo zamknêli bramê do zamku.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_08"); //Wiesz, jak j¹ otworzyæ?
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_09"); //Pewnie trzeba ich wywabiæ... Kiedyœ pods³ucha³em, jak mówili o jakimœ wodzu Ur-Shaku.
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_10"); //O ile siê nie mylê, to jego siedziba znajduje siê w fortecy górskiej.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_11"); //Dziêki za informacje. Wracaj z ch³opcami do twierdzy. Ja wyruszam zg³adziæ Ur-Shaka.
	
	WillGoToUrShack = TRUE;
	Wld_SendTrigger("FORT_1_TRIGGER"); // CatSan otwiera krate
	
	WillIdziePierwszyRazNaZamek = FALSE;
	ff_applyonceext(BeforeUrShack,1000,-1);
	
	Npc_ExchangeRoutine (NASZ_003_Kopacz,"Twierdza");
	Npc_ExchangeRoutine (NASZ_113_Godar,"Twierdza");
	Npc_ExchangeRoutine (NASZ_114_Hokurn,"Twierdza");
	// Kurgan nie zmienia rutyny, bo musi jeszcze pogadac z Willem
	Npc_ExchangeRoutine (NASZ_116_Kjorn,"Twierdza");
	Npc_ExchangeRoutine (NASZ_117_Fed,"Twierdza");
	Npc_ExchangeRoutine (NASZ_118_Ferros,"Twierdza");

	//NASZ_113_Godar.aivar[AIV_PARTYMEMBER] = FALSE;	
	//NASZ_114_Hokurn.aivar[AIV_PARTYMEMBER] = FALSE;	
	//NASZ_115_Kurgan.aivar[AIV_PARTYMEMBER] = FALSE;	
	//NASZ_116_Kjorn.aivar[AIV_PARTYMEMBER] = FALSE;	
	//NASZ_117_Fed.aivar[AIV_PARTYMEMBER] = FALSE;	
	//NASZ_118_Ferros.aivar[AIV_PARTYMEMBER] = FALSE;	

	Druzyna (NASZ_113_Godar,0);
	Druzyna (NASZ_114_Hokurn,0);
	Druzyna (NASZ_115_Kurgan,0);
	Druzyna (NASZ_116_Kjorn,0);
	Druzyna (NASZ_117_Fed,0);
	Druzyna (NASZ_118_Ferros,0);

	B_LogEntry (TOPIC_Keroloth_Wojna, "Cholerni orkowie! Zamknêli siê w zamku, tchórze pieprzone. Jednak niewolnik, którego uratowaliœmy, wyjawi³ mi, ¿e jest pewien sposób, by wywabiæ ich z zamku. Muszê zg³adziæ orkowego wodza Ur-Shaka. Genera³ przebywa gdzieœ w fortecy górskiej.");

	B_GivePlayerXP(200);
	DodajReputacje(1,REP_LOWCY);
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Orkowie siedz¹ zamkniêci w zamku. Muszê zg³adziæ orkowego genera³a - Ur-Shaka - i stan¹æ przed bram¹ zamku z za³o¿onym kosturem szamana.");
	
};
