// Config
const string 	QS_BackgroundTexture 		= "QS.TGA";
const string 	QS_SlotFrameInInvTexture 	= "QS_ActiveSlotInv.TGA";
const int 		QS_posY_OpenInv				= 5000;
const int 		QS_SizeX					= 512;
const int 		QS_SizeY					= 128;

const int 		QS_SlotPosY					= 60;
const int 		QS_SlotSize					= 60;

// Debugging
var int QS_DebugLevel;	
const int QS_Debug_Off 			= 0;
const int QS_Debug_Only_zSpy 	= 1;
const int QS_Debug_All 			= 2;

func int QS_RenderOnScreen()
{
	var oCNpc her; her = Hlp_GetNpc(hero);
	
	if(MEM_Game.singleStep
	|| !Hlp_IsValidHandle(QS_BackgroundView)
	|| !InfoManager_hasFinished()
	|| hero.guild > GIL_SEPERATOR_HUM
	|| Npc_IsInState(hero, ZS_Dead)
	|| her.interactMob
	|| !MEM_GAME.showPlayerStatus)	{
		return false;
	};
	
	return true;
};

func int QS_CanUseItem(var oCNpc her)
{
	if(!QS_RenderOnScreen()
	|| !(C_BodyStateContains(hero, BS_STAND) 
		|| C_BodyStateContains(hero, BS_WALK)
		|| C_BodyStateContains(hero, BS_SNEAK) 
		|| C_BodyStateContains(hero, BS_RUN) 
		|| C_BodyStateContains(hero, BS_SPRINT))	
	|| QS_IsInvOpen()
	|| MEM_ReadInt(zCConsole__cur_console)
	|| Npc_IsInState(hero, ZS_Unconscious))
	{
		return false;
	};
	return true;
};	

// Get position for render item
func int QS_GetPosX(var int slot)
{
	var int x; x = 0;
	if(slot == 1)		{ x = 30; 	}
	else if(slot == 2)	{ x = 80; 	}
	else if(slot == 3)	{ x = 130 ; }
	else if(slot == 4)	{ x = 180 ; }
	else if(slot == 5)	{ x = 230 ; }
	else if(slot == 6)	{ x = 280 ; }
	else if(slot == 7)	{ x = 330 ; }
	else if(slot == 8)	{ x = 380 ; }
	else if(slot == 9)	{ x = 430 ; }
	else if(slot == 0)	{ x = 480 ; };
	return x;
};

func int QS_CanEquipItem(var C_NPC npc, var int itemPtr)
{
	var c_npc slf; slf = Hlp_GetNpc(npc);
	
	CALL_PtrParam	(itemPtr);
	CALL__thiscall	(_@(slf), oCNpc__CanUseItem);
	return CALL_RetValAsInt();
};

// Funkcja sprawdza, czy NPC jest w stanie wyciągnąć broń.
func int QS_CanDrawWeapon()
{
	var int canDrawWeapon; 
	CALL__thiscall(_@(hero), oCNpc__CanDrawWeapon);
	canDrawWeapon = CALL_RetValAsInt();
	
	var int checkAnis; checkAnis = 	QS_IsAniActive("T_MAG_2_MAGRUN") 	|| 
									QS_IsAniActive("T_MAGMOVE_2_MOVE") 	||
									QS_IsAniActive("T_MOVE_2_MAGMOVE") ;
	
	if(canDrawWeapon && !checkAnis) {
		return true;
	};
	
	return false;
};

// Set color of slot number (inventory)
func int QS_GetSlotColor()	{
	return RGBA(255, 180, 0, 255);
};