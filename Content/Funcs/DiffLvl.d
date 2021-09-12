const string DiffLevelError = "B³¹d z ustawieniem poziomu trudnoœci. Zosta³ on automatycznie ustawiony na normalny. Mo¿esz zmieniæ go w menu.";
const string JusticeError = "B³¹d z ustawieniem trybu sprawiedliwoœci. Zosta³ on automatycznie ustawiony na zero. Mo¿esz zmieniæ go w menu.";

const int Easy = 0;			const int EasyDmg = 150; 		const int EasyEnemyDmg = 50;
const int Normal = 1; 		const int NormalDmg = 125; 		const int NormalEnemyDmg = 75;
const int Hard = 2;			const int HardDmg = 100; 		const int HardEnemyDmg = 100;
const int SuperHard = 2;	const int SuperHardDmg = 75; 	const int SuperHardEnemyDmg = 150;
const int Legendary = 4;	const int LegendaryDmg = 50; 	const int LegendaryEnemyDmg = 200;
const int defaultDMG = 5;
const int hundred = 100;

CONST INT SEL_ACTION_UNDEF			= 0;
CONST INT SEL_ACTION_BACK			= 1;
CONST INT SEL_ACTION_STARTMENU		= 2;
CONST INT SEL_ACTION_STARTITEM		= 3;
CONST INT SEL_ACTION_CLOSE			= 4;
CONST INT SEL_ACTION_CONCOMMANDS	= 5;			// -> console commands
CONST INT SEL_ACTION_PLAY_SOUND		= 6;
CONST INT SEL_ACTION_EXECCOMMANDS	= 7;			// -> dynamic build in func.


CONST INT MENU_ITEM_UNDEF		= 0;
CONST INT MENU_ITEM_TEXT		= 1;
CONST INT MENU_ITEM_SLIDER		= 2;
CONST INT MENU_ITEM_INPUT		= 3;
CONST INT MENU_ITEM_CURSOR		= 4;
CONST INT MENU_ITEM_CHOICEBOX	= 5;
CONST INT MENU_ITEM_BUTTON		= 6;
CONST INT MENU_ITEM_LISTBOX		= 7;

CONST INT IT_CHROMAKEYED		= 1;
CONST INT IT_TRANSPARENT		= 2;
CONST INT IT_SELECTABLE			= 4;
CONST INT IT_MOVEABLE			= 8;
CONST INT IT_TXT_CENTER			= 16;
CONST INT IT_DISABLED			= 32;
CONST INT IT_FADE				= 64;
const int IT_EFFECTS_NEXT		= 128;
CONST INT IT_ONLY_IN_GAME		= 512;
CONST INT IT_PERF_OPTION		= 1024;
const int IT_MULTILINE			= 2048;
const int IT_NEEDS_APPLY 		= 4096;			 // die mit dem Menuepunkt verknuepfte Option wird NUR ueber ein APPLY aktiv
const int IT_NEEDS_RESTART		= 8192; 		// die mit dem Menuepunkt verknuepfte Option wird NUR ueber ein RESTART aktiv
const int IT_EXTENDED_MENU		= 16384;

var int diffLevel;
var int JuiceMode;
instance m (zCMenuItem);

func int GetDiffLvl()
{		
	var int mPtr; mPtr =  MEM_GetMenuItemByString ("MENUITEM_OPT_JUSTICE");
	//var zCMenuItem m; 
	if(!mPtr) {return -1;};
	MEM_AssignInst (m, mPtr);
	//m.m_parItemFlags = m.m_parItemFlags | IT_SELECTABLE;
	
	var int section; section = MEM_GothOptExists ("UCIECZKA", "selectLevel");
	var int Justice; Justice = MEM_GothOptExists ("UCIECZKA", "useJustice");
	
	if(!Justice)
	{
		MEM_SetGothOpt ("UCIECZKA", "useJustice", "0");
		MEM_InfoBox(DiffLevelError);
	};
	
	if(!section)
	{
		MEM_SetGothOpt ("UCIECZKA", "selectLevel", "2");
		MEM_InfoBox(JusticeError);
	};
	
	diffLevel = STR_ToInt(MEM_GetGothOpt("UCIECZKA", "selectLevel"));
	
	if(diffLevel >= Hard)
	{
		MEM_SetGothOpt ("UCIECZKA", "useJustice", "1");
		m.m_parItemFlags = m.m_parItemFlags | IT_ONLY_OUT_GAME;
		JuiceMode = true;
	}
	else
	{
		m.m_parItemFlags = m.m_parItemFlags & ~IT_ONLY_OUT_GAME;
		if(!STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice")))
		{
			JuiceMode = false;
		};
	};
	
	return diffLevel;
};

func void Menu_Settings_apply()
{
	QS_CheckIfDisable();
	GetDiffLvl();
};

func int DiffCalcDmg(var int dmg)
{
	if(diffLevel == Easy)
	{
		dmg = (dmg*EasyDmg)/hundred;
	}
	else if(diffLevel == Normal)
	{
		//dmg= (dmg*NormalDmg)/hundred;
		return dmg;
	}
	else if (difflevel == hard)
	{
		dmg = (dmg*HardDmg)/hundred;
	}	
	else if (difflevel == superhard)
	{
		dmg = (dmg*SuperHardDmg)/hundred;
	}
	else
	{
		dmg = (dmg*LegendaryDmg)/hundred;
	};
	
	if(dmg < defaultDMG)
	{
		dmg = defaultDMG;
	};
	
	return dmg;
};

func int DiffEnemyDmg(var int dmg)
{
	if(diffLevel == Easy)
	{
		dmg = (dmg*EasyEnemyDmg)/hundred;
	}
	else if(diffLevel == Normal)
	{
		//dmg= (dmg*NormalEnemyDmg)/100;
		return dmg;
	}
	else if (diffLevel == hard)
	{
		dmg  = (dmg*HardEnemyDmg)/hundred;
	}	
	else if (difflevel == superhard)
	{
		dmg = (dmg*SuperHardEnemyDmg)/hundred;
	}
	else
	{
		dmg = (dmg*LegendaryEnemyDmg)/hundred;
	};
	
	if(dmg < defaultDMG)
	{
		dmg = defaultDMG;
	};
	
	return dmg;
};

func int DiffCalcDmgAll(var int dmg, var c_npc slf)
{
	if(Npc_IsPlayer(slf))
	{
		dmg = DiffCalcDmg(dmg);
		return dmg;
	};
	dmg = DiffEnemyDmg(dmg);
	return dmg;
};



func void Update_Menu_Item(var string name, var string val) 
{
    var int itPtr;
    itPtr = MEM_GetMenuItemByString(name);
        
    if (!itPtr) 
	{
        MEM_Error(ConcatStrings("Update_Menu_Item: Invalid Menu Item: ", name));
        return;
    };
        
    //void zCMenuItem::SetText(val = val, line = 0, drawNow = true)
    const int SetText = 5125360; // 0x004E34F0
        
    CALL_IntParam(true);
    CALL_IntParam(false);
    CALL_zStringPtrParam(val);
    CALL__thiscall(itPtr, SetText);

};

func void qpt()
{
	Print("ha");
};
 
const int oCMenu_Status__SetLearnPoints = 4707920;
const int oCMenu_Status__SetLearnPoints_Len = 6;

const int zCMenu__HandleEnterItem = 5103824;
const int zCMenu__HandleEnterItem_Len = 5;

const int zCMenuItemList__DrawFront = 5137744; // 0x004E6550
const int zCMenuItemList__DrawFront_Len = 6;

const int zCMenuItemList__InsertEnd = 5136144; // 0x004E5F10
const int zCMenuItemList__InsertEnd_Len = 7;


func void Install_Character_Menu_Hook() 
{

	const int done = false;
	if(!done) 
	{
	   HookEngineF(oCMenu_Status__SetLearnPoints, oCMenu_Status__SetLearnPoints_Len, Update_Character_Menu);
//	   HookEngineF(zCMenuItemList__DrawFront, zCMenuItemList__DrawFront_Len, U_OnEnter);
	   //HookEngineF(7547197, 5,qpt);
	   
	   //poziom trudnoœci
	   HookEngineF(cGameManager__ApplySomeSettings_rtn, 6, Menu_Settings_apply);
	   done = true;
	};

};








const int zTMenuItemListElement__zTMenuItemListElement = 5140928; // 0x004E71C0
func int CreateMenuItemListElementPtr( var string title, var string content, var int counterVieverPtr )
{
  var int ptr; ptr = MEM_Alloc(44);
  MEM_WriteString (ptr, title);
  MEM_WriteString (ptr + 20, content);
  MEM_WriteInt (ptr + 40, counterVieverPtr);
  return ptr;
};



func void U_OnEnter() {

	// ecx - 'this' w funkcji DrawFront 
	var int ptrECX; ptrECX = ECX;
	var zCMenuItem list; list = _^(ptrECX);

//	if (Hlp_StrCmp(list.m_parText,"ACHIEVEMENTS") == 0) {
	if (Hlp_StrCmp(list.m_parText,"Bie¿¹ce misje") == 0) {
		return;
	};
	
	/*
	// void zCMenuItemList::InsertEnd(zTMenuItemListElement & element)
	struct zTMenuItemListElement {
		zSTRING		title;	
		zSTRING		content;		
		zCMenuItem*	contentViewer;
		zTMenuItemListElement() { contentViewer=0; };	
	}
	*/

	// dodaj zawartosc do listy
	const int InsertEnd = 5136144; // 0x004E5F10
	var int ptr; ptr = CreateMenuItemListElementPtr("x","y",0);
	
	var int alpha; alpha = MEM_GetSymbolIndex("m_list");
	
	var int mParTextAddr; mParTextAddr = MEM_GetStringAddress(list.m_parText);

//	Print(ConcatStrings("offset = ",IntToString(alpha)));
//	Print(MEM_ReadString(ptrECX));
	//MEM_Error ("tu jestem 1");
//	CALL_IntParam(ptr);
//    CALL__thiscall(list, InsertEnd);
//	MEM_Error ("tu jestem 2");

};

func void Update_Character_Menu() {


	if (LevelMiner>=20 && LevelMiner<25) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 1); }
	else if (LevelMiner>=25 && LevelMiner<30) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 2); }
	else if (LevelMiner>=30 && LevelMiner<35) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 3); }
	else if (LevelMiner>=35 && LevelMiner<40) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 4); }
	else if (LevelMiner>=40 && LevelMiner<45) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 5); }
	else if (LevelMiner>=45 && LevelMiner<50) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 6); }
	else if (LevelMiner>=50 && LevelMiner<55) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 7); }
	else if (LevelMiner>=55 && LevelMiner<60) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 8); }
	else if (LevelMiner>=60 && LevelMiner<65) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 9); }
	else if (LevelMiner>=65 && LevelMiner<70) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 10); }
	else if (LevelMiner>=70 && LevelMiner<75) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 11); }
	else if (LevelMiner>=75 && LevelMiner<80) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 12); }
	else if (LevelMiner>=80 && LevelMiner<85) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 13); }
	else if (LevelMiner>=85 && LevelMiner<90) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 14); }
	else if (LevelMiner>=90 && LevelMiner<95) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 15); }
	else if (LevelMiner>=95 && LevelMiner<100) { Npc_SetTalentSkill (hero, NPC_TALENT_C, 16); }
	else if (LevelMiner>=100) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 17);  };   

   var string StatusReputacji;
	if (rep_lowcy_s) >= 0  { StatusReputacji = "Nikt"; };
	if (rep_lowcy_s) >= 10 { StatusReputacji = "Pomocnik"; };
	if (rep_lowcy_s) >= 25 { StatusReputacji = "Kompan"; };
	if (rep_lowcy_s) >= 50 { StatusReputacji = "Zaufany"; };
	if (rep_lowcy_s) >= 75 { StatusReputacji = "Przyjaciel"; };
	if (rep_lowcy_s) >= 90 { StatusReputacji = "Brat"; };

	Update_Menu_Item("MENU_ITEM_REPUTATION_1_RANGE", StatusReputacji);
	Update_Menu_Item("MENU_ITEM_REPUTATION_1_VAL", IntToString(rep_lowcy_s));

	
	if (rep_mysliwi_s) >= 0  { StatusReputacji = "Nikt"; };
	if (rep_mysliwi_s) >= 10 { StatusReputacji = "Pomocnik"; };
	if (rep_mysliwi_s) >= 25 { StatusReputacji = "Kompan"; };
	if (rep_mysliwi_s) >= 50 { StatusReputacji = "Zaufany"; };
	if (rep_mysliwi_s) >= 75 { StatusReputacji = "Przyjaciel"; };
	if (rep_mysliwi_s) >= 90 { StatusReputacji = "Brat"; };

    Update_Menu_Item("MENU_ITEM_REPUTATION_2_RANGE", StatusReputacji);
	Update_Menu_Item("MENU_ITEM_REPUTATION_2_VAL", IntToString(rep_mysliwi_s));

	if (WillKnowBanditReputation == TRUE)
	{
		if (rep_bandyci_s) >= 0  { StatusReputacji = "Nikt"; };
		if (rep_bandyci_s) >= 10 { StatusReputacji = "Pomocnik"; };
		if (rep_bandyci_s) >= 25 { StatusReputacji = "Kompan"; };
		if (rep_bandyci_s) >= 50 { StatusReputacji = "Zaufany"; };
		if (rep_bandyci_s) >= 75 { StatusReputacji = "Przyjaciel"; };
		if (rep_bandyci_s) >= 90 { StatusReputacji = "Brat"; };
		
		Update_Menu_Item("MENU_ITEM_REPUTATION_3_TITLE", "U bandytów:");
		Update_Menu_Item("MENU_ITEM_REPUTATION_3_RANGE", StatusReputacji);
		Update_Menu_Item("MENU_ITEM_REPUTATION_3_VAL", IntToString(rep_bandyci_s));
	} else {
		// nic sie nie wyswietla
		Update_Menu_Item("MENU_ITEM_REPUTATION_3_TITLE", "");
		Update_Menu_Item("MENU_ITEM_REPUTATION_3_RANGE", "");
		Update_Menu_Item("MENU_ITEM_REPUTATION_3_VAL", "");
	};

};