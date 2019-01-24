// ***** ***** ***** ***** *****
var int Mov_OrcCity10Ready;
var int Mov_OrcCity11Ready;
var int Mov_OrcCity12Ready;
var int Mov_OrcCity13Ready;
var int Mov_OrcCity14Ready;
var int Mov_OrcCity15Ready;

// ***** ***** ***** ***** *****


//*******************************************************
//					I
//*******************************************************
FUNC VOID ORCCITYPIEDESTAL1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_PIEDESTAL1;
		Ai_ProcessInfos (her);
	};
}; 

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal1_Exit (C_INFO)
{
	nr       		= 999;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal1_Exit_Condition;
	information		= PC_OrcCityPiedestal1_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_OrcCityPiedestal1_Exit_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL1)
	{
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal1_Exit_Info ()
{
	B_ENDPRODUCTIONDIALOG ();		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal1_Left (C_INFO)
{
	nr       		= 1;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal1_Left_Condition;
	information		= PC_OrcCityPiedestal1_Left_Info;
	permanent		= TRUE;
	description		= "Po³ó¿ monetê na lew¹ pochodniê."; 
};

FUNC INT PC_OrcCityPiedestal1_Left_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL1) 
	&& (npc_hasitems (hero, ItNa_MagicznaMoneta) >=1) && (Mov_OrcCity10Ready == FALSE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal1_Left_Info ()
{
	Mov_OrcCity10Ready = TRUE;

	Npc_RemoveInvItems (hero,ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_10");
	
	if (Mov_OrcCity10Ready == TRUE) && (Mov_OrcCity11Ready == TRUE) && (Mov_OrcCity14Ready == TRUE)
	{
		CameraOrcCity_01_Redi = TRUE;
	};

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal1_Right (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal1_Right_Condition;
	information		= PC_OrcCityPiedestal1_Right_Info;
	permanent		= TRUE;
	description		= "Po³ó¿ monetê na praw¹ pochodniê."; 
};

FUNC INT PC_OrcCityPiedestal1_Right_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL1) 
	&& (npc_hasitems (hero, ItNa_MagicznaMoneta) >=1) && (Mov_OrcCity11Ready == FALSE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal1_Right_Info ()
{
	Mov_OrcCity11Ready = TRUE;

	Npc_RemoveInvItems (hero,ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_11");
	
	if (Mov_OrcCity10Ready == TRUE) && (Mov_OrcCity11Ready == TRUE) && (Mov_OrcCity14Ready == TRUE)
	{
		CameraOrcCity_01_Redi = TRUE;
	};

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal1_TakeLeft (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal1_TakeLeft_Condition;
	information		= PC_OrcCityPiedestal1_TakeLeft_Info;
	permanent		= TRUE;
	description		= "Zabierz monetê z lewej pochodni."; 
};

FUNC INT PC_OrcCityPiedestal1_TakeLeft_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL1) 
	&& (Mov_OrcCity10Ready == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal1_TakeLeft_Info ()
{
	Mov_OrcCity10Ready = FALSE;

	CreateInvItems (hero, ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_10");

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal1_TakeRight (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal1_TakeRight_Condition;
	information		= PC_OrcCityPiedestal1_TakeRight_Info;
	permanent		= TRUE;
	description		= "Zabierz monetê z prawej pochodni."; 
};

FUNC INT PC_OrcCityPiedestal1_TakeRight_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL1) 
	&& (Mov_OrcCity11Ready == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal1_TakeRight_Info ()
{
	Mov_OrcCity11Ready = FALSE;

	CreateInvItems (hero, ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_11");

};


//*******************************************************
//					II
//*******************************************************
FUNC VOID ORCCITYPIEDESTAL2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_PIEDESTAL2;
		Ai_ProcessInfos (her);
	};
}; 

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal2_Exit (C_INFO)
{
	nr       		= 999;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal2_Exit_Condition;
	information		= PC_OrcCityPiedestal2_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_OrcCityPiedestal2_Exit_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL2)
	{
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal2_Exit_Info ()
{
	B_ENDPRODUCTIONDIALOG ();		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal2_Left (C_INFO)
{
	nr       		= 1;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal2_Left_Condition;
	information		= PC_OrcCityPiedestal2_Left_Info;
	permanent		= TRUE;
	description		= "Po³ó¿ monetê na lew¹ pochodniê."; 
};

FUNC INT PC_OrcCityPiedestal2_Left_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL2) 
	&& (npc_hasitems (hero, ItNa_MagicznaMoneta) >=1) && (Mov_OrcCity12Ready == FALSE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal2_Left_Info ()
{
	Mov_OrcCity12Ready = TRUE;

	Npc_RemoveInvItems (hero,ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_12");

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal2_Right (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal2_Right_Condition;
	information		= PC_OrcCityPiedestal2_Right_Info;
	permanent		= TRUE;
	description		= "Po³ó¿ monetê na praw¹ pochodniê."; 
};

FUNC INT PC_OrcCityPiedestal2_Right_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL2) 
	&& (npc_hasitems (hero, ItNa_MagicznaMoneta) >=1) && (Mov_OrcCity13Ready == FALSE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal2_Right_Info ()
{
	Mov_OrcCity13Ready = TRUE;

	Npc_RemoveInvItems (hero,ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_13");

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal2_TakeLeft (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal2_TakeLeft_Condition;
	information		= PC_OrcCityPiedestal2_TakeLeft_Info;
	permanent		= TRUE;
	description		= "Zabierz monetê z lewej pochodni."; 
};

FUNC INT PC_OrcCityPiedestal2_TakeLeft_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL2) 
	&& (Mov_OrcCity12Ready == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal2_TakeLeft_Info ()
{
	Mov_OrcCity12Ready = FALSE;

	CreateInvItems (hero, ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_12");

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal2_TakeRight (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal2_TakeRight_Condition;
	information		= PC_OrcCityPiedestal2_TakeRight_Info;
	permanent		= TRUE;
	description		= "Zabierz monetê z prawej pochodni."; 
};

FUNC INT PC_OrcCityPiedestal2_TakeRight_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL2) 
	&& (Mov_OrcCity13Ready == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal2_TakeRight_Info ()
{
	Mov_OrcCity13Ready = FALSE;

	CreateInvItems (hero, ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_13");

};


//*******************************************************
//					III
//*******************************************************
FUNC VOID ORCCITYPIEDESTAL3_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_PIEDESTAL3;
		Ai_ProcessInfos (her);
	};
}; 

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal3_Exit (C_INFO)
{
	nr       		= 999;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal3_Exit_Condition;
	information		= PC_OrcCityPiedestal3_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_OrcCityPiedestal3_Exit_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL3)
	{
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal3_Exit_Info ()
{
	B_ENDPRODUCTIONDIALOG ();		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal3_Left (C_INFO)
{
	nr       		= 1;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal3_Left_Condition;
	information		= PC_OrcCityPiedestal3_Left_Info;
	permanent		= TRUE;
	description		= "Po³ó¿ monetê na lew¹ pochodniê."; 
};

FUNC INT PC_OrcCityPiedestal3_Left_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL3) 
	&& (npc_hasitems (hero, ItNa_MagicznaMoneta) >=1) && (Mov_OrcCity14Ready == FALSE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal3_Left_Info ()
{
	Mov_OrcCity14Ready = TRUE;

	Npc_RemoveInvItems (hero,ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_14");

	if (Mov_OrcCity10Ready == TRUE) && (Mov_OrcCity11Ready == TRUE) && (Mov_OrcCity14Ready == TRUE)
	{
		CameraOrcCity_01_Redi = TRUE;
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal3_Right (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal3_Right_Condition;
	information		= PC_OrcCityPiedestal3_Right_Info;
	permanent		= TRUE;
	description		= "Po³ó¿ monetê na praw¹ pochodniê."; 
};

FUNC INT PC_OrcCityPiedestal3_Right_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL3) 
	&& (npc_hasitems (hero, ItNa_MagicznaMoneta) >=1) && (Mov_OrcCity15Ready == FALSE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal3_Right_Info ()
{
	Mov_OrcCity15Ready = TRUE;

	Npc_RemoveInvItems (hero,ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_15");

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal3_TakeLeft (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal3_TakeLeft_Condition;
	information		= PC_OrcCityPiedestal3_TakeLeft_Info;
	permanent		= TRUE;
	description		= "Zabierz monetê z lewej pochodni."; 
};

FUNC INT PC_OrcCityPiedestal3_TakeLeft_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL3) 
	&& (Mov_OrcCity14Ready == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal3_TakeLeft_Info ()
{
	Mov_OrcCity14Ready = FALSE;

	CreateInvItems (hero, ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_14");

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_OrcCityPiedestal3_TakeRight (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_OrcCityPiedestal3_TakeRight_Condition;
	information		= PC_OrcCityPiedestal3_TakeRight_Info;
	permanent		= TRUE;
	description		= "Zabierz monetê z prawej pochodni."; 
};

FUNC INT PC_OrcCityPiedestal3_TakeRight_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PIEDESTAL3) 
	&& (Mov_OrcCity15Ready == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcCityPiedestal3_TakeRight_Info ()
{
	Mov_OrcCity15Ready = FALSE;

	CreateInvItems (hero, ItNa_MagicznaMoneta,1);
	Wld_SendTrigger ("MOVER_ORCCITY_15");

};