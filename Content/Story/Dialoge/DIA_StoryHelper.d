
//***************************************************************************
//	Rahmen-Infos
//***************************************************************************
instance  KapitelHelper_Exit (C_INFO)
{
	npc			=  KapitelHelper;
	nr			=  999;
	condition	=  KapitelHelper_Exit_Condition;
	information	=  KapitelHelper_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KapitelHelper_Exit_Condition()
{
	return 1;
};

FUNC VOID  KapitelHelper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 1
//							--------------------
//***************************************************************************
INSTANCE KapitelHelper_INFO1 (C_INFO)
{
	npc				= KapitelHelper;
	condition		= KapitelHelper_INFO1_Condition;
	information		= KapitelHelper_INFO1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 1"; 
};

FUNC INT KapitelHelper_INFO1_Condition()
{		
	return TRUE;
};

func VOID KapitelHelper_INFO1_Info()
{

	Info_ClearChoices	( KapitelHelper_INFO1 );
	Info_AddChoice		( KapitelHelper_INFO1, DIALOG_BACK			                			, KapitelHelper_BACK1);
	Info_AddChoice		( KapitelHelper_INFO1, "KAPITELANFANG"			                			, KapitelHelper_KAPITEL1ANFANG);
};

//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_BACK1()
{
	Info_ClearChoices	( KapitelHelper_INFO1 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_KAPITEL1ANFANG()
{
	B_Kapitelwechsel		(1, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};
//**************************************************************************
//								KAPITEL 2
//							--------------------
//***************************************************************************
INSTANCE KapitelHelper_INFO2 (C_INFO)
{
	npc				= KapitelHelper;
	condition		= KapitelHelper_INFO2_Condition;
	information		= KapitelHelper_INFO2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 2"; 
};

FUNC INT KapitelHelper_INFO2_Condition()
{		
	return TRUE;
};

func VOID KapitelHelper_INFO2_Info()
{

	Info_ClearChoices	( KapitelHelper_INFO2 );
	Info_AddChoice		( KapitelHelper_INFO2, DIALOG_BACK			                			, KapitelHelper_BACK2);
	Info_AddChoice		( KapitelHelper_INFO2, "KAPITELANFANG"			                			, KapitelHelper_KAPITEL2ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_BACK2()
{
	Info_ClearChoices	( KapitelHelper_INFO2 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_KAPITEL2ANFANG()
{
	B_Kapitelwechsel		(2, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 3
//							--------------------
//***************************************************************************
INSTANCE KapitelHelper_INFO3 (C_INFO)
{
	npc				= KapitelHelper;
	condition		= KapitelHelper_INFO3_Condition;
	information		= KapitelHelper_INFO3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 3"; 
};

FUNC INT KapitelHelper_INFO3_Condition()
{		
	return TRUE;
};

func VOID KapitelHelper_INFO3_Info()
{

	Info_ClearChoices	( KapitelHelper_INFO3 );
	Info_AddChoice		( KapitelHelper_INFO3, DIALOG_BACK			                			, KapitelHelper_BACK3);
	Info_AddChoice		( KapitelHelper_INFO3, "KAPITELANFANG"			                			, KapitelHelper_KAPITEL3ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_BACK3()
{
	Info_ClearChoices	( KapitelHelper_INFO3 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_KAPITEL3ANFANG()
{

	B_Kapitelwechsel		(3, NEWWORLD_ZEN );	
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 4
//							--------------------
//***************************************************************************
INSTANCE KapitelHelper_INFO4 (C_INFO)
{
	npc				= KapitelHelper;
	condition		= KapitelHelper_INFO4_Condition;
	information		= KapitelHelper_INFO4_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 4"; 
};

FUNC INT KapitelHelper_INFO4_Condition()
{		
	return TRUE;
};

func VOID KapitelHelper_INFO4_Info()
{

	Info_ClearChoices	( KapitelHelper_INFO4 );
	Info_AddChoice		( KapitelHelper_INFO4, DIALOG_BACK			                			, KapitelHelper_BACK4);
	Info_AddChoice		( KapitelHelper_INFO4, "KAPITELANFANG"			                			, KapitelHelper_KAPITEL4ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_BACK4()
{
	Info_ClearChoices	( KapitelHelper_INFO4 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID KapitelHelper_KAPITEL4ANFANG()
{
	B_Kapitelwechsel		(4, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};
