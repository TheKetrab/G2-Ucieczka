
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
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_03"); //Torturowali mnie... By�em wi�niem. Przez ca�y ten czas my�la�em tylko o szybkiej �mierci.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_04"); //Co chcieli wiedzie� orkowie?
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_05"); //O ludziach w G�rniczej Dolinie... Mia�em im wszystko powiedzie�, a ja nic nie wiedzia�em. Musia�em co� wymy�li�.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_06"); //I co im powiedzia�e�?
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_07"); //�e w G�rniczej Dolinie jest pe�no paladyn�w, mimo �e opu�cili zamek. Chyba si� wystraszyli, bo zamkn�li bram� do zamku.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_08"); //Wiesz, jak j� otworzy�?
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_09"); //Pewnie trzeba ich wywabi�... Kiedy� pods�ucha�em, jak m�wili o jakim� wodzu Ur-Shaku.
	AI_Output			(self, other, "DIA_NASZ_003_Kopacz_hello_03_10"); //O ile si� nie myl�, to jego siedziba znajduje si� w fortecy g�rskiej.
	AI_Output			(other, self, "DIA_NASZ_003_Kopacz_hello_03_11"); //Dzi�ki za informacje. Wracaj z ch�opcami do twierdzy. Ja wyruszam zg�adzi� Ur-Shaka.
	
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

	B_LogEntry (TOPIC_Keroloth_Wojna, "Cholerni orkowie! Zamkn�li si� w zamku, tch�rze pieprzone. Jednak niewolnik, kt�rego uratowali�my, wyjawi� mi, �e jest pewien spos�b, by wywabi� ich z zamku. Musz� zg�adzi� orkowego wodza Ur-Shaka. Genera� przebywa gdzie� w fortecy g�rskiej.");

	B_GivePlayerXP(200);
	DodajReputacje(1,REP_LOWCY);
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Orkowie siedz� zamkni�ci w zamku. Musz� zg�adzi� orkowego genera�a - Ur-Shaka - i stan�� przed bram� zamku z za�o�onym kosturem szamana.");
	
};
