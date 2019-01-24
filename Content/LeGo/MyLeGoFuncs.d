// "magic constants"
const int zCModel_AniIsActive 			= 	 5727888;//0x00576690
const int oCNpc__GetModel               = 	 7571232; //0x00738720
const int zCModel__AniIDFromAniName    =    6365296; //0x00612070
const int zCModel__GetAniFromAniID     =    4665168; //0x00472F50

var int secSkaluj;

func int oCNpc_GetModel(var c_npc npc)
{
    CALL__thiscall(_@(npc), oCNpc__GetModel);
    return CALL_RetValAsPtr();
};

func int Get_AniIDFromAniName(var c_npc slf,  var string aniName)
{
    var int model; model = oCNpc_GetModel(slf);
    
    CALL_zStringPtrParam(Str_Upper(aniName));
    CALL__thiscall(model,zCModel__AniIDFromAniName);
    return CALL_RetValAsInt();    
};

func int GetAniFromAniID(var c_npc slf, var string aniName)
{ 
    var int model; model = oCNpc_GetModel(slf);
    var int ani; ani = Get_AniIDFromAniName(slf,aniName);

    CALL_PtrParam(ani);
    CALL__thiscall(model,zCModel__GetAniFromAniID);
    return CALL_RetValAsPtr();
};

func void Set_AniSpeed(var c_npc slf, var string aniName, var int FPS)
{
    var int ptr;  ptr = GetAniFromAniID(slf,aniName);
    MEM_WriteInt(ptr+176, mkf(FPS));
};




func int Get_AniSpeed(var c_npc slf, var string aniName, var int FPS)
{
    var int ptr;  ptr = GetAniFromAniID(slf,aniName);
    return roundf(MEM_ReadInt(ptr+176));
}; 

var int NpcsInFight;
func void ZmienStylWalki( /*var c_npc master*/ ) {
  
  if (!ECX) {return;};
  var c_npc master; master = _^ (ECX);
  var c_item itm; itm = Npc_GetEquippedMeleeWeapon(master);

  if ((!Npc_IsPlayer(master)) && master.guild < GIL_SEPERATOR_HUM || master.guild == 31 || master.guild == 32 || master.guild == 33) {
    //1h
   // if (itm.flags & ITEM_SWD || itm.flags & ITEM_AXE) {
      if ((master.HitChance[NPC_TALENT_1H] >= 75) && (master.attribute[ATR_HITPOINTS] > 10)) //&& (Npc_HasReadiedMeleeWeapon (master))
      {
        master.aivar[AIV_COMBO] = Hlp_Random(100);
		//Print(IntToString(master.aivar[AIV_COMBO]));

        if ((master.aivar[AIV_COMBO] < 40) && (master.aivar[AIV_UBRANATROJKA] == FALSE)) {
          Mdl_RemoveOverlayMds(master, "HUMANS_1HST2.MDS");
          Mdl_ApplyOverlayMds(master, "HUMANS_1HST3.MDS");
          master.aivar[AIV_UBRANATROJKA] = TRUE;
          master.fight_tactic = FAI_HUMAN_COMBO;
        } else if (master.aivar[AIV_COMBO] >= 40) && (master.aivar[AIV_UBRANATROJKA] == TRUE) {
          Mdl_RemoveOverlayMds(master, "HUMANS_1HST3.MDS");
          Mdl_ApplyOverlayMds(master, "HUMANS_1HST2.MDS");
          master.aivar[AIV_UBRANATROJKA] = FALSE;

          if (master.aivar[AIV_COMBO] >= 80) {
            master.fight_tactic = FAI_HUMAN_MASTER2;
          } else {
            master.fight_tactic = FAI_HUMAN_MASTER;
          };
        };
      };
   // }
    //2h
   // else if (itm.flags & ITEM_2HD_AXE || itm.flags & ITEM_2HD_SWD) {
      if ((master.HitChance[NPC_TALENT_2H] >= 60) && (master.attribute[ATR_HITPOINTS] > 10)) // && (Npc_HasReadiedMeleeWeapon (master))
      {
        master.aivar[AIV_COMBO] = Hlp_Random(100);

        if (master.aivar[AIV_COMBO] < 40) && (master.aivar[AIV_UBRANATROJKA] == FALSE) {
          Mdl_RemoveOverlayMds(master, "HUMANS_2HST2.MDS");
          Mdl_ApplyOverlayMds(master, "HUMANS_2HST3.MDS");
          master.aivar[AIV_UBRANATROJKA] = TRUE;
          master.fight_tactic = FAI_HUMAN_COMBO;
        }
        else if (master.aivar[AIV_COMBO] >= 40) && (master.aivar[AIV_UBRANATROJKA] == TRUE) {
          Mdl_RemoveOverlayMds(master, "HUMANS_2HST3.MDS");
          Mdl_ApplyOverlayMds(master, "HUMANS_2HST2.MDS");
          master.aivar[AIV_UBRANATROJKA] = FALSE;

          if (master.aivar[AIV_COMBO] >= 80) {
            master.fight_tactic = FAI_HUMAN_MASTER2;
          } else {
            master.fight_tactic = FAI_HUMAN_MASTER;
          };
        };
      };
   // };
  };
}; 


func void PrintMunitionType()
{
	/*pointer to hero*/
	if(MEM_READINT(_hero) == ECX)
	{
		if(Npc_IsInFightMode(hero, FMODE_FAR)) 
		{
			var C_Item RangedWeapon; RangedWeapon = Npc_GetReadiedWeapon(hero);

			if(RangedWeapon)
			{
				
				
				if(!Hlp_IsValidHandle(MunitionName))
				{
					MunitionName = View_Create(0, 0, 8000, 8000);
					View_Open(MunitionName);
				};
	
				if(Hlp_IsValidHandle(MunitionName))
				{
					if(RangedWeapon.flags & ITEM_BOW)
					{
						if(BowMunition != RangedWeapon.Munition)
						{
							BowMunition = RangedWeapon.Munition;
						};
						
						if (BowMunition == FireArrow)
						{
							View_AddText(MunitionName, 700, 7000, "U?wasz ogniste strza?", PF_FONT);
						}
						else if (BowMunition == IceArrow)
						{
							View_AddText(MunitionName, 700, 7000, "U?wasz lodowe strza?", PF_FONT);
						}
						else if (BowMunition == SharpArrow)
						{
							View_AddText(MunitionName, 700, 7000, "U?wasz ostre strza?", PF_FONT);
						}
						else
						{
							View_AddText(MunitionName, 700, 7000, "U?wasz zwyk? strza?", PF_FONT);
						};
					}
					else
					{
						if(CBowMunition != RangedWeapon.Munition)
						{
							CBowMunition = RangedWeapon.Munition;
						};
						
						
						if (CBowMunition == SharpBolt)
						{
							View_AddText(MunitionName, 700, 7000, "U?wasz ostre be?y", PF_FONT);
						}
						else
						{
							View_AddText(MunitionName, 700, 7000, "U?wasz zwyk? be?y", PF_FONT);
						};
					};
				};
			};

		};
	};
	
			/*pointer to hero*/
	if(ECX && MEM_READINT(_hero) !=	ECX)
	{
		var c_npc slf;  slf = _^(ECX);
		if(Npc_IsInFightMode(slf, FMODE_MELEE))
		{
			ZmienStylWalki();
		};
	};
};

func void RemovePrintedMunitionType()
{
	/*pointer to hero*/
	if(MEM_READINT(_hero) == ECX)
	{
		if(Hlp_IsValidHandle(MunitionName))
		{
			View_Close(MunitionName);
			View_Delete(MunitionName);
			MunitionName = 0; //NULL
		};
	};
};

func int Pressed(var int key)
{
	if(MEM_KeyState(key)==KEY_PRESSED)
	{
		return 1;
	};
	return 0;
};

func int GetItemSlot (var C_NPC slf, var string slotName) 
{
    const int oCNpc__GetSlotItem = 7544560;
	CALL_zStringPtrParam (STR_Upper(slotName));
    CALL__thiscall (_@(slf), oCNpc__GetSlotItem);
    return CALL_RetValAsPtr ();
};

func void TakeFocusVob_hook()
{
	if(!ECX || ECX != MEM_ReadInt(_hero) || !Hlp_Is_oCItem(MEM_ReadInt(ESP+4))) { return; };
	
	var c_item itm; itm = _^(MEM_ReadInt(ESP+4));
	
	if(Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItNa_FragmentZwoju))
	{
		Wld_InsertNpc(Skeleton_Lord,Npc_GetNearestWP(hero));
	};	
	
	PrintS_Ext(ConcatStrings("Podnios³eœ: ",itm.name/*MEM_ReadString(focus+312)*/), RGBA(255,255,255,0));
	
};


func void ThrowVob(var c_npc slf, var c_item itm, var int odleglosc)
{
	const int oCNpc__DoThrowVob = 7622832;
	CALL_FloatParam(mkf(odleglosc));
	CALL_PtrParam(_@(itm));
	CALL__thiscall(_@(slf),oCNpc__DoThrowVob);
};


func int HeroTakefocusVob()
{	
	var int focus; focus = Mem_ReadInt(MEM_ReadInt(_hero)+2476/*player.focus_vob*/);
	if(Hlp_Is_oCItem(focus))
	{
		const int oCNpc__DoTakeVob = 7621056;
		var C_Item it; it = _^(focus);
		CALL_PtrParam(focus);
		CALL__Thiscall(MEM_READINT(_hero),oCNpc__DoTakeVob);
		return CALL_RetValAsInt();
	}; 

	return 0;
};

func void TakeItemsDuringDiving()
{	
	if(!ECX || !MEM_READINT(_hero) || hero.attribute[0]<=0) { return; };
	
	if(ECX != Mem_ReadInt(MEM_ReadInt(_hero)+2432)/*player.anictrl*/) { return; };
	
	if(MEM_KeyPressed(MEM_GetKey("keyAction")) || MEM_KeyPressed(MEM_GetSecondaryKey("keyAction")))
	{
		HeroTakefocusVob();
	};	
};

func int HasShield(var c_npc slf)
{
	if(!slf) {return 0;};

	/*if(GetItemSlot (slf, "ZS_SHIELD"))
	{
			return TRUE;
	}
	else if(GetItemSlot (slf, "ZS_LEFTHAND") && Npc_IsInFightMode (other, FMODE_MELEE)/*)
	{
		var c_item itm; itm = _^(GetItemSlot (slf, "ZS_LEFTHAND"));
		
		if(itm.flags & ITEM_SHIELD)
		{
			return TRUE;
		};
	
	};
	return FALSE;
	*/

	return slf.aivar[AIV_TARCZA];

};


/***********************************\
               SHIELDS
\***********************************/

const int    Shield_AIVar0    = 97;             // Eine freie AI-Var
const int    Shield_AIVar1    = 98;             // Eine weitere freie AI-Var
const int    Shield_AIVar2    = 99;             // Und noch eine freie AI-Var  |  Bei Gelegenheit wird das durch ein weiteres Savegame ersetzt.
const string Shield_WP        = "TOT";          // Irgendein Waypoint der in jeder Welt existiert (TOT zB.)

const string Shield_SlotEquip = "ZS_LONGSWORD"; // Wohin wenn das Schild equipped wird?
const string Shield_SlotDrawn = "ZS_LEFTHAND";  // Wohin wenn das Schild gezogen wird?
const int    Shield_Slot      = 4;              // Genutzter Model-Slot

//========================================
// Schild ablegen
//========================================
func void Shield_Unequip(var c_npc slf) {
    if(!slf.aivar[Shield_AIVar0]) { return; };
    oCNpc_UnequipItem(slf, slf.aivar[Shield_AIVar1]);
};

//========================================
// [intern] Wenn Schild angelegt wird
//========================================
func void _EVT_Shield_Equip() {
    if(!ECX||!ESP) { return; };
    var int shieldPtr; shieldPtr = MEM_ReadInt(ESP+4);
    if(!shieldPtr) { return; };
    var c_item shield; shield = MEM_PtrToInst(shieldPtr);
    if(!(shield.flags&ITEM_SHIELD)) { return; };
    var c_npc slf; slf = MEM_PtrToInst(ECX);
    slf.protection[0] += shield.protection[0];
    slf.protection[1] += shield.protection[1];
    slf.protection[2] += shield.protection[2];
    slf.protection[3] += shield.protection[3];
    slf.protection[4] += shield.protection[4];
    slf.protection[5] += shield.protection[5];
    slf.protection[6] += shield.protection[6];
    slf.protection[7] += shield.protection[7];
    var int vobPtr; vobPtr = MEM_InsertVob(shield.visual, MEM_GetAnyWP()); // Nun hat diese Funktion doch noch einen Nutzen ;)
    slf.aivar[Shield_AIVar0] = oCNpc_PutInSlot(slf, Shield_SlotEquip, vobPtr, Shield_Slot);
    slf.aivar[Shield_AIVar1] = MEM_InstToPtr(shield);
    slf.aivar[Shield_AIVar2] = 0;
};

//========================================
// [intern] Wenn Schild abgelegt wird
//========================================
func void _EVT_Shield_Unequip() {
    if(!ECX||!ESP) { return; };
    var int shieldPtr; shieldPtr = MEM_ReadInt(ESP+4);
    if(!shieldPtr) { return; };
    var c_item shield; shield = MEM_PtrToInst(shieldPtr);
    if(!(shield.flags&ITEM_SHIELD)) { return; };
    var c_npc slf; slf = MEM_PtrToInst(ECX);
    if(!slf.aivar[Shield_AIVar0]) { return; };
    slf.protection[0] -= shield.protection[0];
    slf.protection[1] -= shield.protection[1];
    slf.protection[2] -= shield.protection[2];
    slf.protection[3] -= shield.protection[3];
    slf.protection[4] -= shield.protection[4];
    slf.protection[5] -= shield.protection[5];
    slf.protection[6] -= shield.protection[6];
    slf.protection[7] -= shield.protection[7];
    var string name;
    if(slf.aivar[Shield_AIVar2]) { name = Shield_SlotDrawn; }
    else                         { name = Shield_SlotEquip; };
    oCNpc_RemoveFromSlot(slf, name, slf.aivar[Shield_AIVar0], Shield_Slot);
    slf.aivar[Shield_AIVar0] = 0;
};

//========================================
// [intern] Schild ziehen
//========================================
func void _Shield_Draw(var c_npc slf) {
    if(slf.aivar[Shield_AIVar2]) { return; };
    oCNpc_RemoveFromSlot(slf, Shield_SlotEquip, slf.aivar[Shield_AIVar0], Shield_Slot);
    var c_item shield; shield = MEM_PtrToInst(slf.aivar[Shield_AIVar1]);
    var int vobPtr;    vobPtr = MEM_InsertVob(shield.visual, MEM_GetAnyWP());
    slf.aivar[Shield_AIVar0] = oCNpc_PutInSlot(slf, Shield_SlotDrawn, vobPtr, Shield_Slot);
    slf.aivar[Shield_AIVar2] = 1;
};

//========================================
// [ntern] Schild wegstecken
//========================================
func void _Shield_Remove(var c_npc slf) {
    if(!slf.aivar[Shield_AIVar2]) { return; };
    oCNpc_RemoveFromSlot(slf, Shield_SlotDrawn, slf.aivar[Shield_AIVar0], Shield_Slot);
    var c_item shield; shield = MEM_PtrToInst(slf.aivar[Shield_AIVar1]);
    var int vobPtr;    vobPtr = MEM_InsertVob(shield.visual, MEM_GetAnyWP());
    slf.aivar[Shield_AIVar0] = oCNpc_PutInSlot(slf, Shield_SlotEquip, vobPtr, Shield_Slot);
    slf.aivar[Shield_AIVar2] = 0;
};

//========================================
// [intern] Wenn Schild angezogen wird
//========================================
func void _EVT_Shield_Draw() {
    if(!ECX) { return; };
    var c_npc slf; slf = MEM_PtrToInst(ECX);
    if(slf.aivar[Shield_AIVar0]) {
        _Shield_Draw(slf);
    };
};

//========================================
// [intern] Wenn Schild weggesteckt wird
//========================================
func void _EVT_Shield_Remove() {
    if(!ECX) { return; };
    var c_npc slf; slf = MEM_PtrToInst(ECX);
    if(slf.aivar[Shield_AIVar0]) {
        _Shield_Remove(slf);
    };
};

//========================================
// [intern] Wenn Schild weggeschmissen wird
//========================================
func void _EVT_Shield_Drop() {
    if(!ECX) { return; };
    var c_npc slf; slf = MEM_PtrToInst(ECX);
    if(slf.aivar[Shield_AIVar0]) {
        var c_item shield; shield = MEM_PtrToInst(slf.aivar[Shield_AIVar1]);
        Shield_Unequip(slf);
        if(Npc_IsInFightMode(slf, FMode_None)) { return; };
        var zCVob npc; npc = MEM_PtrToInst(ECX);
        MEM_InsertItem(shield, npc.trafoObjToWorld[3], npc.trafoObjToWorld[7], npc.trafoObjToWorld[11]);
        Npc_RemoveInvItem(slf, Hlp_GetInstanceID(shield));
    };
};

//========================================
// Script initialisieren
//========================================
func void Shields_Init() {
	HookEngineF(oCNpc__EV_DrawWeapon,    6, _EVT_SHIELD_DRAW);
	HookEngineF(oCNpc__EV_DrawWeapon1,   5, _EVT_SHIELD_DRAW);
	HookEngineF(oCNpc__EV_RemoveWeapon,  7, _EVT_SHIELD_REMOVE);
	HookEngineF(oCNpc__EV_RemoveWeapon1, 7, _EVT_SHIELD_REMOVE);
	HookEngineF(oCNpc__EquipItem,        7, _EVT_SHIELD_EQUIP);
	HookEngineF(oCNpc__UnequipItem,      6, _EVT_SHIELD_UNEQUIP);
	HookEngineF(oCNpc__DropUnconscious,  7, _EVT_SHIELD_DROP);
};












func void ScaleWorldTime (var int factor) {
	//worldTime += frameTime * (factor - 1);

	//Global instances have to be intialised!

		var int deltaT; deltaT = MEM_Timer.frameTimeFloat;
		deltaT = mulf (deltaT, subf (factor, mkf (1)));
		MEM_WorldTimer.worldTime = addf (MEM_WorldTimer.worldTime, deltaT);

};



func void rainThroughVobs(var int bool) {
    MemoryProtectionOverride(6169210, 4);
    if (!bool) {
        // bool == false -> Es regnet nicht mehr durch
        MEM_WriteByte(6169210, 224);
    } else {
        MEM_WriteByte(6169210, 226);
};
};








//------------------------------------------------
//  Siehe auch http://forum.worldofplayers.de/forum/showthread.php?p=13842523&#post13842523
//------------------------------------------------

/* Statt "loading.tga" wird beim Laden texName angezeigt.
 * texName darf höchstens 11 Zeichen lang sein
 * (also nicht länger als "loading.tga") */
 
const int LOADINGTEXNAME_OFFSET = 9118980; //0x8B2504;

func void SetLoadTexName (var string texName) {
	/*Länge ermitteln und prüfen ob passend */
	var int len; len = STR_Len (texName);
	
	if (len < 5) {
		MEM_Error ("SetLoadTexName: texName too short. Empty or forgotten '.tga' extension?");
		return;
	} else if (len > 11) { //11 == STR_Len ("loading.tga");
		MEM_Error ("SetLoadTexName: texName is too long. Truncate it to 11 chars (including '.tga' extension)!");
		return;
	};
	
	/* Daten kopieren */
	var int sPtr; sPtr = STRINT_ToChar (texName);
	MEM_CopyBytes (sPtr, LOADINGTEXNAME_OFFSET, len);
	
	/*  Nullbyte anhängen */
	//MEM_WriteByte (LOADINGTEXNAME_OFFSET + len, 0);
	MEM_WriteInt (LOADINGTEXNAME_OFFSET + len, MEM_ReadInt (LOADINGTEXNAME_OFFSET + len) & ~ 255);
};


func int Npc_UseFireSpell(var C_NPC attacker)
{
	if (Npc_IsInFightMode(attacker, FMODE_MAGIC))
	{
		var int RuneSpell; RuneSpell = Npc_GetActiveSpell(attacker);
		
		if(RuneSpell == SPL_FIREBOLT)
		||(RuneSpell == SPL_InstantFireball)
		||(RuneSpell == SPL_ChargeFireball)
		||(RuneSpell == SPL_PYROKINESIS)
		||(RuneSpell == SPL_FIRESTORM)
		||(RuneSpell == SPL_FIRERAIN)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else
	{
		return FALSE;
	};
};

func int Npc_UseWaterSpell(var C_NPC attacker)
{
	if (Npc_IsInFightMode(attacker, FMODE_MAGIC))
	{
		var int RuneSpell; RuneSpell = Npc_GetActiveSpell(attacker);
		
		if(RuneSpell == SPL_Icebolt)
		||(RuneSpell == SPL_ICECUBE)
		||(RuneSpell == SPL_ICEWAVE)
		||(RuneSpell == SPL_Icelance)
		||(RuneSpell == SPL_Geyser)
		||(RuneSpell == SPL_Waterfist)
		||(RuneSpell == SPL_Thunderstorm)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else
	{
		return FALSE;
	};
};



 const int _hero = 11216516;

func int C_NpcIsBoss(var c_npc slf)
{
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Giant_Bug_Boss))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Wisp_Boss))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Skeleton_Lord_Garrel))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (NASZ_409_Nieznany))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Kamashi))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (MinecrawlerWarrior_Boss))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Ozywieniec))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (PanCieniostworow))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (NASZ_430_StaryTrup))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Nasz_Potwor))
	{
		return true;
	};
	
	if (Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Troll_Black_Plaskowyz))
	{
		return true;
	};
	return false;
 
};
 
func int AniIsActive(var c_npc slf, var string aniname)
{
	var int ptr; ptr = oCNpc_GetModel(slf);

	CALL_zStringPtrParam(Str_Upper(aniname));
	CALL__thiscall(ptr,zCModel_AniIsActive);
	return CALL_RetValAsInt();	
};
 
//var int random;
func int DMG_OnDmg(var int victimPtr, var int attackerPtr, var int dmg) { 
	    
	if(!victimPtr || !attackerPtr) {return 0;};
	
	Var c_npc slf; slf = _^(attackerPtr);
	var c_npc oth; oth = _^(victimPtr);
	
	
	var C_ITEM ReadiedWeapon; ReadiedWeapon = Npc_GetReadiedWeapon(slf);

		
		if(oth.flags == 2 || oth.flags ==6) {dmg = 0; return dmg;};
		if (oth.aivar[AIV_TARCZA]  == TRUE)
		{
			if (C_BodyStateContains(oth,BS_PARADE)) && Npc_CanSeeNpc(oth,slf) &&  (oth.HitChance[NPC_TALENT_1H] >= 30)
			{
				dmg = 0;
				return dmg;
			};
	};
	
	if(_@(slf) == _@(hero))
	{
		var int FightSkill; FightSkill = Hlp_Random(99);
		
		if(Npc_IsInFightMode(slf, FMODE_MELEE))
		{
			dmg = 0;
			
			if(ReadiedWeapon.flags & (ITEM_SWD | ITEM_AXE))
			{
				if((FightSkill >= 0) && (FightSkill <= ((slf.HitChance[NPC_TALENT_1H]) - 1)))
				{
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_BLUNT];
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_EDGE];
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_FIRE];
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_MAGIC];
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_POINT];
					};
				}
				else
				{
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_BLUNT])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_EDGE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_FIRE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_MAGIC])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_POINT])/10);
					};
				};
			}
			else
			{
				if((FightSkill >= 0) && (FightSkill <= ((slf.HitChance[NPC_TALENT_2H]) - 1)))
				{
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_BLUNT];
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_EDGE];
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_FIRE];
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_MAGIC];
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_POINT];
					};
				}
				else
				{
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_BLUNT])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_EDGE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_FIRE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_MAGIC])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_POINT])/10);
					};
				};
			};
			
			if (dmg <= 4)
			{
				dmg = 5;
			};
		}
		else if(Npc_IsInFightMode(slf, FMODE_FAR))
		{
			if(dmg >= 1)
			{
				dmg = 0;
				
				if(ReadiedWeapon.flags & ITEM_BOW)
				{
					if (BowMunition == FireArrow)
					{
						if((30 - (oth.protection[PROT_MAGIC])) <= 0)
						{
							MunitionDMG = 0;
						}
						else
						{
							MunitionDMG = (30 - (oth.protection[PROT_MAGIC]));
						};
						
						dmg = (slf.attribute[ATR_DEXTERITY]) + (ReadiedWeapon.damageTotal) - (oth.protection[PROT_POINT]) + MunitionDMG;
						Wld_PlayEffect ("spellFX_RingRitual1", oth, oth, 0, 0, 0, FALSE);
					}
					else if (BowMunition == IceArrow)
					{
						if((30 - (oth.protection[PROT_MAGIC])) <= 0)
						{
							MunitionDMG = 0;
						}
						else
						{
							MunitionDMG = (30 - (oth.protection[PROT_MAGIC]));
						};
						
						dmg = (slf.attribute[ATR_DEXTERITY]) + (ReadiedWeapon.damageTotal) - (oth.protection[PROT_POINT]) + MunitionDMG;
						
						Wld_PlayEffect ("SPELLFX_ICELANCE_COLLIDEFX", oth, oth, 0, 0, 0, FALSE);
						Wld_PlayEffect ("SPELLFX_WHIRLWIND_COLLIDE", oth, oth, 0, 0, 0, FALSE);
						
						if (!Npc_IsInState (oth, ZS_MagicFreeze))
						{
							Wld_PlayEffect ("SPELLFX_ICESPELL_SENDPERCEPTION", oth, oth, 0, 0, 0, FALSE);
							Npc_ClearAIQueue	(oth);
							B_ClearPerceptions	(oth);
							AI_StartState		(oth, ZS_MagicFreeze, 0, "");
						};
					}
					else
					{
						if (BowMunition == SharpArrow)
						{
							MunitionDMG = 10;
						}
						else if (BowMunition == NormalArrow)
						{
							MunitionDMG = 0;
						};
						
						dmg = (slf.attribute[ATR_DEXTERITY]) + ((ReadiedWeapon.damageTotal) + MunitionDMG) - (oth.protection[PROT_POINT]);
					};
				}
				else
				{
					if (CBowMunition == SharpBolt)
					{
						MunitionDMG = 10;
					}
					else if (CBowMunition == NormalBolt)
					{
						MunitionDMG = 0;
					};
					
					dmg = (slf.attribute[ATR_STRENGTH]) + ((ReadiedWeapon.damageTotal) + MunitionDMG) - (oth.protection[PROT_POINT]);
				};
				
				if (dmg <= 4)
				{
					dmg = 5;
				};
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_MAGIC))
		{
			
				var C_Spell spl; spl = GFA_GetActiveSpellInst(slf);// _^(Npc_GetSelectedSpell(slf));
	
				
				if(C_NpcIsUndead(oth) && spl.damage_per_level == SPL_Damage_DESTROYUNDEAD  && !C_NpcIsBoss(oth))
				{
					dmg = oth.attribute[0];
					return dmg;
				};
				
				/*if(slf.aivar[AIV_SpellLevel])
				{
					dmg = ((spl.damage_per_level*slf.aivar[AIV_SpellLevel]) - oth.protection[PROT_MAGIC]); 
				}
				else
				{
					dmg = spl.damage_per_level - oth.protection[PROT_MAGIC];
				};*/
				if(Npc_UseFireSpell(slf))
				{
					if(slf.aivar[AIV_SpellLevel])
					{
						dmg = (((spl.damage_per_level*slf.aivar[AIV_SpellLevel])/4) - (oth.protection[PROT_MAGIC]/3)); 
					}
					else
					{
						dmg = ((spl.damage_per_level/4) -  oth.protection[PROT_FIRE]- (oth.protection[PROT_MAGIC]/3));
					};
					
				}
				else if(Npc_UseWaterSpell(slf))
				{
					if(slf.aivar[AIV_SpellLevel])
					{
						dmg = ((spl.damage_per_level*slf.aivar[AIV_SpellLevel]) - oth.protection[PROT_MAGIC] +(slf.attribute[ATR_MANA_MAX]/20)+(slf.attribute[ATR_HITPOINTS_MAX]/50)) ; 
					}
					else
					{
						dmg = (spl.damage_per_level - oth.protection[PROT_MAGIC]+(slf.attribute[ATR_MANA_MAX]/20)+(slf.attribute[ATR_HITPOINTS_MAX]/50));
					};
				
				}
				else
				{
					if(slf.aivar[AIV_SpellLevel])
					{
						dmg = ((spl.damage_per_level*slf.aivar[AIV_SpellLevel]) - oth.protection[PROT_MAGIC] +(slf.attribute[ATR_MANA]/5)); 
					}
					else
					{
						dmg = (spl.damage_per_level - oth.protection[PROT_MAGIC] +(slf.attribute[ATR_MANA]/5));
					};
				
				};
				
			
		};
	};
	
	if (oth.guild == GIL_ICEGOLEM)
	{
		if (Npc_IsInFightMode(slf, FMODE_MELEE))
		{
			if(Hlp_GetInstanceID(ReadiedWeapon) != Hlp_GetInstanceID(ItNa_MieczRunicznyA))
			{
				dmg = 0;
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_FAR))
		{
			if(ReadiedWeapon.flags & ITEM_BOW) && (BowMunition == FireArrow)
			{
				dmg = 60;
			}
			else
			{
				dmg = 0;
				
				if(ReadiedWeapon.flags & ITEM_BOW) && (BowMunition == IceArrow)
				{
					if((oth.attribute[ATR_HITPOINTS] + 60) >= oth.attribute[ATR_HITPOINTS_MAX])
					{
						oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
					}
					else
					{
						oth.attribute[ATR_HITPOINTS] += 60;
					};
				};
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_MAGIC))
		{
			if (Npc_UseWaterSpell(slf))
			{
					dmg = ((dmg - ((slf.attribute[ATR_MANA_MAX])/2))*2) + ((slf.attribute[ATR_MANA_MAX])/2);
				
				if((oth.attribute[ATR_HITPOINTS] + dmg) >= oth.attribute[ATR_HITPOINTS_MAX])
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
				}
				else
				{
					oth.attribute[ATR_HITPOINTS] += dmg;
				};
				
				dmg = 0;
			}
			else if (!Npc_UseFireSpell(slf))
			{
				dmg = 0;
			};
		};
	}
	else if (oth.guild == GIL_FIREGOLEM)
	{
		if (Npc_IsInFightMode(slf, FMODE_MELEE))
		{
			if(Hlp_GetInstanceID(ReadiedWeapon) != Hlp_GetInstanceID(ItNa_MieczRunicznyB))
			{
				dmg = 0;
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_FAR))
		{
			if(ReadiedWeapon.flags & ITEM_BOW) && (BowMunition == IceArrow)
			{
				dmg = oth.attribute[ATR_MANA_MAX]+oth.attribute[ATR_DEXTERITY];
			}
			else
			{
				dmg = 0;
				
				if(ReadiedWeapon.flags & ITEM_BOW) && (BowMunition == FireArrow)
				{
					if((oth.attribute[ATR_HITPOINTS] + 60) >= oth.attribute[ATR_HITPOINTS_MAX])
					{
						oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
					}
					else
					{
						oth.attribute[ATR_HITPOINTS] += 60;
					};
				};
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_MAGIC))
		{
			if (Npc_UseFireSpell(slf))
			{
				//if(_@(slf) == _@(hero))
				//{
					dmg = ((dmg - ((slf.attribute[ATR_MANA_MAX])/2))*2) + ((slf.attribute[ATR_MANA_MAX])/2);
				//}
				//else
				//{
				//	dmg = dmg*2;
				//};
				
				if((oth.attribute[ATR_HITPOINTS] + dmg) >= oth.attribute[ATR_HITPOINTS_MAX])
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
				}
				else
				{
					oth.attribute[ATR_HITPOINTS] += dmg;
				};
				
				dmg = 0;
			}
			else if (!Npc_UseWaterSpell(slf))
			{
				dmg = 0;
			};
		};
	};
	
	if(oth && slf &&  _@(oth) == _@(hero) &&dmg)
	{
			if(slf.guild == gil_snapper && !AniIsActive(oth, "T_FALLB_2_FALLENB"))
			{
				slf.aivar[AIV_RandomDmg] = hlp_random(250);

				if(slf.aivar[AIV_RandomDmg] <=16 || slf.aivar[AIV_RandomDmg] >=236)
				{	
					//AI_WaitMS(hero,100);
					AI_PlayAni(oth,"T_FALLB_2_FALLENB");
					AI_Wait(oth,1);
					dmg += (oth.attribute[1]*7)/100;
					return dmg;
				};
			
			}
			else if (slf.guild == GIL_ZOMBIE && !AniIsActive(oth, "T_FALLB_2_FALLENB"))
			{
				slf.aivar[AIV_RandomDmg] = hlp_random(150);
				
				if(slf.aivar[AIV_RandomDmg] <=34 || slf.aivar[AIV_RandomDmg] >=130)
					{	
						//AI_WaitMS(hero,100);
						AI_PlayAni(oth,"T_FALLB_2_FALLENB");
						AI_Wait(oth,1);
						dmg += (oth.attribute[1]*10)/100;
						return dmg;
					};
			
			}
			else if (slf.guild == GIL_GIANT_BUG && !AniIsActive(oth, "T_FALLB_2_FALLENB"))
			{
					slf.aivar[AIV_RandomDmg] = hlp_random(200);
					if(slf.aivar[AIV_RandomDmg] <=34 || slf.aivar[AIV_RandomDmg] >=190)
					{	
						//AI_WaitMS(hero,100);
						AI_PlayAni(oth,"T_FALLB_2_FALLENB");
						AI_Wait(oth,1);
						dmg += (oth.attribute[1]*5)/100;
						return dmg;
					};
			
			}			
			else if (slf.guild == GIL_MINECRAWLER && !AniIsActive(oth, "T_FALLB_2_FALLENB"))
			{
					if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
					{
						slf.aivar[AIV_RandomDmg] = hlp_random(200);
						if(slf.aivar[AIV_RandomDmg] >=34 && slf.aivar[AIV_RandomDmg] <=69)
						{	
							//AI_WaitMS(hero,100);
							AI_PlayAni(oth,"T_FALLB_2_FALLENB");
							AI_Wait(oth,1);
							dmg += (oth.attribute[1]*2)/100;
							return dmg;
						};
					
					}
					else if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
					{
						slf.aivar[AIV_RandomDmg] = hlp_random(169);
						if(slf.aivar[AIV_RandomDmg] <=24 || slf.aivar[AIV_RandomDmg] >=150)
						{	
							//AI_WaitMS(hero,100);
							AI_PlayAni(oth,"T_FALLB_2_FALLENB");
							AI_Wait(oth,1);
							dmg += (oth.attribute[1]*4)/100;
							return dmg;
						};
					
					}
					else if(slf.aivar[AIV_MM_REAL_ID] == 	ID_BLATTCRAWLER)
					{
						slf.aivar[AIV_RandomDmg] = hlp_random(189);
						if(slf.aivar[AIV_RandomDmg] <=22 || slf.aivar[AIV_RandomDmg] >=170)
						{	
							//AI_WaitMS(hero,100);
							AI_PlayAni(oth,"T_FALLB_2_FALLENB");
							AI_Wait(oth,1);
							dmg += (oth.attribute[1]*3)/100;
							return dmg;
						};
					};
			};
		
		if(_@(slf) == _@(OrcBiterWsciekly01) ||  _@(slf) ==_@(SwampratWsciekly01) ||  _@(slf ) ==_@(BloodflyWsciekly01) || _@(slf ) == _@(MinecrawlerWarriorWsciekly1)  || _@(slf ) == _@(WaranWsciekly01))
		{
			slf.aivar[AIV_RandomDmg] = hlp_random(11);

			if(slf.aivar[AIV_RandomDmg] <= 3)
			{
				Buff_Apply(hero, Poison1HP);
				Print("Zosta³eœ zatruty! (-1HP/10S)");
				Snd_Play ("TRUCIZNA");
			};
		};

		if(_@(slf) == _@(Giant_Rat_Huge01) ||  _@(slf) ==_@(SwampDroneWsciekly01) ||  _@(slf ) ==_@(Topielec_Wsciekly_A) || _@(slf ) == _@(TrollWsciekly01)  || _@(slf ) == _@(WscieklyWilk1))
		{
			 slf.aivar[AIV_RandomDmg] = hlp_random(11);
			if(slf.aivar[AIV_RandomDmg] <= 5)
			{
				Buff_Apply(hero, Poison5HP);
				Print("Zosta³eœ zatruty! (-5HP/10S)");
				Snd_Play ("TRUCIZNA");
			};
		
		};
		
		if(_@(slf) == _@(WildBloodfly01) ||  _@(slf) ==_@(GroznyJaszczurWsciekly01))
		{			
			slf.aivar[AIV_RandomDmg] = hlp_random(11);
			if(slf.aivar[AIV_RandomDmg] <= 8 )
			{
				Buff_Apply(hero, Poison10HP);
				Print("Zosta³eœ zatruty! (-10HP/10S)");
				Snd_Play ("TRUCIZNA");
			};
		
		};
		
		if(_@(slf) == _@(Wisp_Boss))
		{
			if (hero.attribute[ATR_HITPOINTS] < HeroPreviousHP)
			{
				Wld_PlayEffect("spellFX_DESTROYUNDEAD",  hero, hero, 0, 0, 0, FALSE );
			};

			HeroPreviousHP = hero.attribute[ATR_HITPOINTS];
		
		};

		
	};
	//Print(IntToString(dmg));
	return dmg;
};



	
func void _DMG_OnDmg() {

	//if(EBP &&MEM_ReadInt(MEM_ReadInt(ESP+644)+8))
	//{
		EDI = DMG_OnDmg(EBP, MEM_ReadInt(MEM_ReadInt(ESP+644)+8), EDI);
	//};
};
func void InitDamage() {
	const int dmg = 0;
	if (dmg) { return; };
	HookEngineF(6736583/*0x66CAC7*/, 5, _DMG_OnDmg);
	dmg = 1;
};


/*var int bs;
var int BlackScreenCounter;

var int b;
func void BlackScreen(var int i)
{
	if(BlackScreenCounter==i)
	{
		MEM_GAME.game_drawall = true;
		View_Close(b);
		View_Delete(b);
		b = 0; //NULL
		BlackScreenCounter = 0;
		ff_remove(BlackScreen);
		return;
	};
	
	if(!Hlp_IsValidHandle(bs))
	{
		Print_GetScreenSize();
		b = View_Create(PS_X, PS_Y, 8192 , 8192 );
		View_SetTexture(b,"black.tga");
		View_Open(b);	
		MEM_GAME.game_drawall = false;		
	};
	
	AI_Waitms (hero, 3000);
	BlackScreenCounter+=1;
	

};*/

func void Sleep(var int ms) {
    var int adr;
    adr = GetProcAddress (LoadLibrary ("KERNEL32.DLL"), "Sleep");
    
    CALL_IntParam(ms);
    CALL__stdcall(adr); //0x007B47E6
};
//-

var int bll;
const int afdf = 0;
var int fs;
var int pre;
func void BlackScreen(var int i)
{
	//if(MEM_GAME.load_screen || ) {return;};
	
	if(bll==500)
	{
		//Print("koniec");
		View_SetAlpha(fs,RGBA(255,255,255,255));
		afdf = 2;
		if(pre==1)
		{
			B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");
			PlayVideo ("G2UCIECZKAAFTERKAP3.BIK");
			AI_Teleport	(hero, "OC_CENTER_04");
			AI_Teleport	(NASZ_110_Keroloth, "OC_CENTER_04");
			Npc_ClearAIQueue (hero);
			Sleep(2000);
			pre = 0;
		};
		//bll = 255;
		//ff_remove(bl);
		//return;
	
	};
	
	
	if(!afdf)
	{
		bll = 255;
		Print_GetScreenSize();
		fs = View_Create(PS_X, PS_Y, 8192 , 8192 );
		View_SetTexture(fs,"black.tga");
		View_Open(fs);	
		//MEM_Game.game_drawall = false;
		
		
		afdf = 1;
	
	};
	
	if(afdf == 2)
	{
		View_SetAlpha(fs,RGBA(bll,bll,bll,255));
		View_SetTexture(fs,"black.tga");
		bll -= 1;
		//Print(IntToString(bll));
		if(bll == 256)
		{
			Npc_ClearAIQueue (hero);
			view_delete(fs);
			pre = 2;
			//MEM_Game.game_drawall = true;
			fs = 0;
			ff_remove(blackscreen);
			return;
		
		};
	}
	else
	{	
		View_SetAlpha(fs,RGBA(bll,bll,bll,255));
		bll += 1;
		//Print(IntToString(bll));
	};

};

//Siemaczys
var int FadeScreen_Color_R;
var int FadeScreen_Color_G;
var int FadeScreen_Color_B;
var int FadeScreen_Color_A;
var int FadeScreen_Color_Over;
var int Fade_Pause_Counter; 


func void FadeScreen_Start(var int mult)
{
	MEM_InitGlobalInst();	
	
	MEM_GAME.array_view_visible[0]=true;
	MEM_GAME.array_view_enabled[0]=true;
	
	//Print("Dzialam stATR");
	MEM_CAMERA.screenFadeEnabled=true; 
	MEM_CAMERA.screenFadeColor=RGBA(0,0,0,FadeScreen_Color_A);

	var zCView ptr; ptr	= _^(MEM_GAME.array_view[0]);
	ptr.alphafunc	=	FadeScreen_Color_Over;

	if(Fade_Status==1)
	{
		if(FadeScreen_Color_A<255)
		{
		FadeScreen_Color_A += mult;
		}
		else if (FadeScreen_Color_A>=255)
		{
		FadeScreen_Color_A= 255;
		Fade_Status	= 2;
		};
	};

};

func void FadeScreen_End(var int mult)
{
	
	MEM_InitGlobalInst();	
	
	MEM_GAME.array_view_visible[0]=true;
	MEM_GAME.array_view_enabled[0]=true;
	
	//Print("Dzialam end");
	MEM_CAMERA.screenFadeEnabled=true; 
	MEM_CAMERA.screenFadeColor=RGBA(0,0,0,FadeScreen_Color_A);

	var zCView ptr; ptr	= _^(MEM_GAME.array_view[0]);
	ptr.alphafunc	=	FadeScreen_Color_Over;


	if (Fade_Status==3) 
	{
		if(FadeScreen_Color_A >= mult)
		{
		FadeScreen_Color_A -= mult;
		}
		else if (FadeScreen_Color_A <= mult)
		{
		FadeScreen_Color_A= 0;
		Fade_Status	=0;
		};
	};
};

func void FadeScreen_Pause() {

	MEM_CAMERA.screenFadeEnabled=true; 
	MEM_CAMERA.screenFadeColor=RGBA(0,0,0,255);

	//Print("Dzialam pause");
	var zCView ptr; ptr	= _^(MEM_GAME.array_view[0]);
	ptr.alphafunc	=	FadeScreen_Color_Over;

};

func void OrcSawYou_Active()
{
	
	//if(MEM_GAME.pause_screen) {return;}; 
	
	if (OrcSawYou_Activated == TRUE) {
		
		if (Fade_Status == 1) // stATR
		{
			if (Fade_Pause_Counter == 0) {
				Fade_Pause_Counter += 1;
				Snd_Play ("ORC_HAPPY");
			};
			
			FadeScreen_Start(1);
		}
		
		else if (Fade_Status == 2) // pause
		{
		
			
			
			FadeScreen_Pause();
			Fade_Pause_Counter += 1;
			
			
			if (Fade_Pause_Counter == 10) {
				Snd_Play ("ORC_HAPPY");
				OrcSawYou_InsertOrc();
			};
			
			if (Fade_Pause_Counter == 200) {
				Snd_Play ("ORC_HAPPY");
				ff_remove(OrcSawYou_Active);
			};
		};
		


	};

};
