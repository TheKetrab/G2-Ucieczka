var int Osiagniecie18OneTime;

// "magic constants"
const int zCModel_AniIsActive 			= 	 5727888;//0x00576690
const int oCNpc__GetModel               = 	 7571232; //0x00738720
const int zCModel__AniIDFromAniName    =    6365296; //0x00612070
const int zCModel__GetAniFromAniID     =    4665168; //0x00472F50

var int secSkaluj;

func string exitDialoge(var string i)
{
	var c_npc npc; npc = _^(MEM_InformationMan.npc);
	AI_StopProcessInfos	(npc);
	AI_StopProcessInfos	(hero);
	return "";
};

func int Pressed(var int key)
{
	if(MEM_KeyState(key)==KEY_PRESSED)
	{
		return 1;
	};
	return 0;
};

// KETRAB
const int oCMobContainer__Remove = 7495808;
func void ClearMobContainer(var string mobContainerName) {

	var int mobContainerPtr; mobContainerPtr = MEM_SearchVobByName(mobContainerName);

	if (mobContainerPtr) {
		var oCMobContainer chest; chest = MEM_PtrToInst(mobContainerPtr);
		var int listPtr; listPtr = chest.containList_next;
		if (listPtr) {
			var zCListSort list; list = MEM_PtrToInst(listPtr);
			var int itemPtr; itemPtr = list.data;
			if (itemPtr) {
				CALL_IntParam(1);
				CALL_PtrParam(itemPtr);
				CALL__thiscall(mobContainerPtr, oCMobContainer__Remove);
				
				// RESURSIVE CALL untill data exists
				ClearMobContainer(mobContainerName);
			};
		};
	} else {
		MEM_Info(CS("ClearMobContainer > Chest not found: ",mobContainerName));
	};

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

func void AddMunitionText(var int isBow) 
{
  if (!Hlp_IsValidHandle(MunitionName)) 
  {
    MunitionName = View_Create(0, 0, 8000, 8000);
    var string str;
    str = G2U_you_use;
    if (isBow) {
      // wykomentowane, bo to tylko ewentualnie do magicznego luku,
      // ale to psulo reszte i i tak nie ma magicznego luku w ucieczce
      //if(BowMunition != RangedWeapon.Munition)
      //{
      //	BowMunition = RangedWeapon.Munition;
      //};

      if (BowMunition == FireArrow) 
	  {
        str = CS(str, G2U_fire_arrow);
        View_AddText(MunitionName, 700, 7000, str, PF_FONT);
      }
	  else if (BowMunition == IceArrow) 
	  {
	  
        str = CS(str, G2U_ice_arrow);
        View_AddText(MunitionName, 700, 7000, str, PF_FONT);
      }
	  else if (BowMunition == SharpArrow) 
	  {
        str = CS(str, G2U_sharp_arrow);
        View_AddText(MunitionName, 700, 7000, str, PF_FONT);
      }
	  else {
        str = CS(str, G2U_normal_arrow);
        View_AddText(MunitionName, 700, 7000, str, PF_FONT);
      };
    } 
	else {
      // wykomentowane, bo to tylko ewentualnie do magicznej kuszy
      // ale to psulo reszte i i tak nie ma magicznej kuszy w ucieczce
      //if(CBowMunition != RangedWeapon.Munition)
      //{
      //	CBowMunition = RangedWeapon.Munition;
      //};

      if (CBowMunition == SharpBolt) 
	  {
        str = CS(str, G2U_sharp_bolt);
        View_AddText(MunitionName, 700, 7000, str, PF_FONT);
      } 
	  else 
	  {
        str = CS(str, G2U_normal_bolt);
        View_AddText(MunitionName, 700, 7000, str, PF_FONT);
      };
    };
    View_Open(MunitionName);
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
				AddMunitionText(RangedWeapon.flags & ITEM_BOW );
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
			View_DeleteText(MunitionName);
			View_Close(MunitionName);
			View_Delete(MunitionName);
			MunitionName = 0; //NULL
			
		};
	};
};


func int MunitionVarToInstanceID(var int mun, var int isBow)
{
	if(!isBow)
	{
		if(mun == NormalBolt)
		{
			return ItRw_Bolt;
		}
		else
		{
			return ItRw_SharpBolt;
		};
	}
	else
	{
		if(mun == NormalArrow)
		{
			return ItRw_Arrow;
		}
		else if(mun == FireArrow)
		{
			return ItNa_OgnistaStrzala;
		}
		else if(mun == SharpArrow)
		{
			return ItNa_OstraStrzala;
		}
		else
		{
			return ItNa_LodowaStrzala;
		};
	};
};

func void Npc_DoRemoveMunition(var c_npc slf)
{
	var int pNpc; pNpc = _@(slf);
	
	if(!pNpc){return;};
	
	const int oCNpc__DoRemoveMunition = 7619696;
	
	CALL__Thiscall(pNpc,oCNpc__DoRemoveMunition);
};



func int Npc_HasInHand(var c_npc slf, var int inst)
{
	var int pNpc; pNpc = _@(slf);
	
	if(!pNpc || inst == -1){return 0;};
	
	
	const int oCNpc__HasInHand = 7566176;
	
	CALL_IntParam(inst);
	CALL__Thiscall(pNpc,oCNpc__HasInHand);
	
	return CALL_RetValAsInt();

};

func void Npc_DoInsertMunition(var c_npc slf, var string node)
{
	var int pNpc; pNpc = _@(slf);
	
	CALL_zStringPtrParam(node);
	CALL__Thiscall(pNpc,7618960);
};

func void CheckMunition()
{
	
	var C_ITEM RangedWeapon;
	
	RangedWeapon = NPC_GetEquippedRangedWeapon(hero);
	
	if(!Hlp_IsValidItem(rangedWeapon))
	{
		RangedWeapon = Npc_GetReadiedWeapon(hero);
		
		if(!Hlp_IsValidItem(RangedWeapon) || rangedWeapon.mainflag != ITEM_KAT_FF)
		{
			return;
		};
	};

	Npc_DoRemoveMunition(hero);
	
	if(rangedWeapon.flags & ITEM_BOW)
	{
		rangedWeapon.munition = MunitionVarToInstanceID(BowMunition,1);
	}
	else
	{
		rangedWeapon.munition = MunitionVarToInstanceID(CBowMunition,0);
	};
	

	Npc_DoRemoveMunition(hero);
	//if(Npc_HasReadiedRangedWeapon(hero))
	//{
		Npc_DoInsertMunition(hero,"ZS_RIGHTHAND");
	//};


};
/*
const int oCMsgDamage__classdef = 11217392;
const int zCEventManager__messagelist_offset = 48;
const int zCEventMessage__subtype_offset = 36;
const int RemoveWeapon_message = 3;
func int IsRunningMessage(var c_npc slf, var int classdef, var int type)
{
	var int pSlf; pSlf = _@(slf);
	
	if(!pSlf){return 0;};

	var int EM; EM 	= MEMINT_VobGetEM(pSlf);
	
	
	
	var zCArray arr; arr = _^(MEM_ReadInt(EM+zCEventManager__messagelist_offset));
	
	
	//var int list; list = MEM_ReadInt(EM+zCEventManager__messagelist_offset);
	var int num; num = MEM_ReadInt(EM+zCEventManager__messagelist_offset+8);
	
	
	var int i;
	repeat(i,arr.numinarray);
	
		var int message; message = MEM_ReadIntArray(arr.array,i);
		if(message && MEM_GetClassDef(message) ==classdef )
		{
			return 1;
		};
	
	end;
	
	
	return 0;
	
	//MEM_InfoBox(IntToString(num));

	
	
	repeat(i,num);
	

		//var int message; message = MEM_ReadIntArray(list,i);
		
		if(!message){break;};
		
		//continue;
		if(MEM_GetClassDef(message) ==classdef )
		{
			var int mtype; mtype = MEM_ReadInt(message+zCEventMessage__subtype_offset);
			return 1;
			if(mtype == type)
			{
				//return is runing
				
				return 1;
			};
		};
		
		
		
	end;
	
	return 0;
	
	
	
};*/


const int zCPar_Symbol_content_offset = 24;

const int KEY_MOUSE_WHEELUP = 522;
const int KEY_MOUSE_WHEELDOWN = 523;

const string MunitionInstances[2] = {"BOWMUNITION","CBOWMUNITION"};
//var int Munition_LastSymbolIdx;
const int Munition_LastSymbolIdx = -1;


func int GetNextMunition(var int currMun, var int isBow, var int forward)
{
	var int mun_max;
	if(isBow)
	{
		mun_max = MaxArrow;
	}
	else
	{
		mun_max = MaxBolt;
	};
	

	
	
	var int currMunBack; currMunBack = currMun;
	
	//Printi(forward);
	var int i;
	repeat(i, mun_max);
	
		if(forward)
		{
			currMun+=1;
		}
		else
		{
			currMun-=1;
		};
		
	//	Printi(currMun);
		
		if(currMun >= mun_max) {currMun = 0;}
		else if(currMun < 0){currMun = mun_max;};
		
		var int inst;
		inst = MunitionVarToInstanceID(currMun,isBow);
		
		if(Npc_HasItems(hero,inst) && currMun != currMunBack)
		{
			return currMun;
		};

	end;
	
	return -1;
};

var int forceMunitionChange;
func void MunitionChange()
{

	if(!Npc_IsInFightMode(hero, FMODE_FAR)){return;};

	var c_item itm; 
	var int i;
	
	if(Npc_HasEquippedRangedWeapon(hero))
	{
		itm = Npc_GetEquippedRangedWeapon(hero);
	}
	else
	{
		if(Npc_HasReadiedRangedWeapon(hero))
		{
			itm =  Npc_GetReadiedWeapon(hero);
		}
		else
		{
			return;
		};
	};
	
	//if(!Hlp_IsValidItem(itm)){return;};
	
	i = (itm.flags & ITEM_CROSSBOW) > 0;
	
	var int instanz;
	const int symbol = 0; 
	if(i != Munition_LastSymbolIdx)
	{
		symbol = MEM_GetSymbol(MEM_ReadStatStringArr(MunitionInstances,i));
		
		if(symbol == 0)
		{
			MEM_Info("WeaponStatus : wrong symbol");
			return;
		};
		
		Munition_LastSymbolIdx = i;
	};
	
	//var zCPar_Symbol sym; sym = _^(symbol);
	
	var int mun; var int mun2;
	mun = MEM_ReadInt(symbol+zCPar_Symbol_content_offset);
	mun2 = mun;
	
	var int forward; forward = 1;
	
	
	if(Pressed(KEY_MOUSE_WHEELUP) || forceMunitionChange)
	{
		mun2+=1;
		//forward = true;
	}
	else if(Pressed(KEY_MOUSE_WHEELDOWN))
	{
		mun2-=1;
		forward = 0;
	};
	
	if(mun2 < 0)
	{
		mun2 = MaxArrow-1;
	}
	else if(mun2 >= MaxArrow)
	{
		mun2 = 0;
		forward = true;
	};
	
	if(mun2 != mun)
	{
		//if(IsRunningMessage(hero,oCMsgDamage__classdef,RemoveWeapon_message) ||  IsRunningMessage(hero,oCMsgDamage__classdef,0) )
		//{
			//Print("run");
			//return;
		//};
		
		var int isBow; isBow = i ==0;
		var int inst; inst = MunitionVarToInstanceID(mun2,isBow);
		
		if(!Npc_HasItems(hero,inst))
		{
			mun2 = GetNextMunition(mun2,isBow,forward);
			if(mun2 == -1)
			{
				return;
			};
		};
		
		
		
		MEM_WriteInt(symbol+zCPar_Symbol_content_offset,mun2);
		if(forceMunitionChange == false)
		{
			AI_Function(hero,CheckMunition);
		}
		else
		{
			CheckMunition();
		};
		

		if(Hlp_IsValidHandle(MunitionName))
		{
			View_DeleteText(MunitionName);
			View_Close(MunitionName);
			View_Delete(MunitionName);
			MunitionName = 0; //NULL
		};
		AddMunitionText(isBow);
	};
};

func void WeaponStatus()
{

};



func int GetItemSlot (var C_NPC slf, var string slotName) 
{
    const int oCNpc__GetSlotItem = 7544560;
	CALL_zStringPtrParam (STR_Upper(slotName));
    CALL__thiscall (_@(slf), oCNpc__GetSlotItem);
    return CALL_RetValAsPtr ();
};

func int IsItemRusted(var c_item itm) {

	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_1h_MISC_Sword))	{ return 1; };
	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_1h_Misc_Axe))		{ return 1; };
	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_2H_Sword_M_01))	{ return 1; };
	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_2H_OrcAxe_01))		{ return 1; };
	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_2H_OrcAxe_02))		{ return 1; };
	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_2H_OrcAxe_03))		{ return 1; };
	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_2H_OrcAxe_04))		{ return 1; };
	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_2H_OrcSword_01))	{ return 1; };
	
	return 0;

};

func void TakeFocusVob_hook()
{
	if(ECX != MEM_ReadInt(_hero) || !Hlp_Is_oCItem(MEM_ReadInt(ESP+4))) { return; };
	
	var c_item itm; itm = _^(MEM_ReadInt(ESP+4));
	
	if (IsItemRusted(itm)) {
		ZardzewialeMieczePodniesione += 1;
	};
	
	if(Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItNa_FragmentZwoju))
	{
		Wld_InsertNpc(Skeleton_Lord,Npc_GetNearestWP(hero));
	};		
	if(Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItNa_KoloZebate))
	{
		B_LogEntry (TOPIC_Rethon_kurgan, "Znalaz³em ko³o zêbate. Mogê wracaæ do Kurgana.");
	};	
	
	PrintS_Ext(ConcatStrings(G2U_you_take,itm.description/*MEM_ReadString(focus+312)*/), RGBA(255,255,255,0));
	
};

var int FragmentZwoju1_OneTime;
func void FRAGMENTZWOJU1_S1() {
	if (FragmentZwoju1_OneTime == FALSE) {
		FragmentZwoju1_OneTime = TRUE;
		Wld_InsertNpc(Skeleton_Lord,Npc_GetNearestWP(hero));
	};
};
var int FragmentZwoju2_OneTime;
func void FRAGMENTZWOJU2_S1() {
	if (FragmentZwoju2_OneTime == FALSE) {
		FragmentZwoju2_OneTime = TRUE;
		Wld_InsertNpc(Skeleton_Lord,Npc_GetNearestWP(hero));
	};
};
var int FragmentZwoju3_OneTime;
func void FRAGMENTZWOJU3_S1() {
	if (FragmentZwoju3_OneTime == FALSE) {
		FragmentZwoju3_OneTime = TRUE;
		Wld_InsertNpc(Skeleton_Lord,Npc_GetNearestWP(hero));
	};
};
var int FragmentZwoju4_OneTime;
func void FRAGMENTZWOJU4_S1() {
	if (FragmentZwoju4_OneTime == FALSE) {
		FragmentZwoju4_OneTime = TRUE;
		Wld_InsertNpc(Skeleton_Lord,Npc_GetNearestWP(hero));
	};
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
	if(!Hlp_ISValidNpc(slf)) {return 0;};

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
 * texName darf h?hstens 11 Zeichen lang sein
 * (also nicht l?ger als "loading.tga") */
 
const int LOADINGTEXNAME_OFFSET = 9118980; //0x8B2504;

func void SetLoadTexName (var string texName) {
	/*L?ge ermitteln und pr?en ob passend */
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
	
	/*  Nullbyte anh?gen */
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

func void StartFlyDamage (var c_npc slf, var int speed, var int x, var int y, var int z)
{
    const int oCAIHuman__StartFlyDamage = 6936896; //0x69D940
	var oCNpc _slf; _slf = Hlp_GetNpc(slf);
    var int vec[3];
    vec[0] = _slf._zCVob_trafoObjToWorld[zCVob_trafoObjToWorld_X] + mkf (x);
    vec[1] = _slf._zCVob_trafoObjToWorld[zCVob_trafoObjToWorld_Y] + mkf (y);
    vec[2] = _slf._zCVob_trafoObjToWorld[zCVob_trafoObjToWorld_Z] + mkf (z);
    CALL_PtrParam (_@(vec));
    CALL_IntParam (mkf (speed));
    CALL__thiscall (_slf.human_ai, oCAIHuman__StartFlyDamage);
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
    CALL__stdcall(adr); 
};
//-

var int bll; // iterator
var int bll500; // iterator po petli w srodku
const int afdf = 0; // 1 -> zaciemnianie, 2 -> stop, 3 -> rozjasnianie
var int fs; // screen
var int pre; // stan
const int darknessSpeed = 3;
//nie chce mi siê kombinowaæ XD
var int bll2; // iterator
var int bll5002; // iterator po petli w srodku
const int afdf2 = 0; // 1 -> zaciemnianie, 2 -> stop, 3 -> rozjasnianie
var int fs2; // screen
var int pre2; // stan
var int setKerolothRoutineOneTime;
func void BlackScreen(var int i)
{
	//if(MEM_GAME.load_screen || ) {return;};
	
	//Print(IntToString(bll));
	
	if(!afdf) // init afdf
	{
		bll = 255;
		Print_GetScreenSize();
		fs = View_Create(PS_X, PS_Y, 8192 , 8192 );
		View_SetTexture(fs,"black.tga");
		View_Open(fs);	
		//MEM_Game.game_drawall = false;
		
		afdf = 1;	
	};

	if (afdf == 1) // zaciemnianie
	{	
		View_SetAlpha(fs,RGBA(bll,bll,bll,255));
		bll += darknessSpeed;
		//Print(IntToString(bll));
	
		if (bll >= 500) {
			bll = 500;
			afdf = 2;
			View_SetAlpha(fs,RGBA(255,255,255,255));
		};
	}
	
	else if (afdf == 2)
	{			
		bll500 += 1;
		
		if (bll500 == 5) {
			AI_Teleport	(hero, "OC_CENTER_04");
			AI_Teleport	(NASZ_110_Keroloth, "OC_CENTER_04");
		};
		
		if (bll500 == 10) {
			PlayVideo ("G2UCIECZKAAFTERKAP3.BIK");
			return;
		};
	
		if (bll500 == 15) {
			afdf = 3;
			Npc_ClearAIQueue (hero);
		};
	
	
	}
	
	else // afdf == 3 -> rozjasnianie
	{
		if (setKerolothRoutineOneTime == FALSE) {
			setKerolothRoutineOneTime = TRUE;
			Npc_ClearAIQueue (NASZ_110_Keroloth);
			B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");
		};
	
		View_SetAlpha(fs,RGBA(bll,bll,bll,255));
		View_SetTexture(fs,"black.tga");
		bll -= darknessSpeed;

		if(bll <= 256) // calkiem jasno
		{
			bll = 256;
			Npc_ClearAIQueue (hero);
			view_delete(fs);
			pre = 2;
			//MEM_Game.game_drawall = true;
			fs = 0;
			ff_remove(blackscreen);
			return;
		
		};
	};



};
func void BlackScreen2(var int i)
{
	//if(MEM_GAME.load_screen || ) {return;};
	
	//Print(IntToString(bll));
	
	if(!afdf2) // init afdf
	{
		bll2 = 255;
		Print_GetScreenSize();
		fs2 = View_Create(PS_X, PS_Y, 8192 , 8192 );
		View_SetTexture(fs2,"black.tga");
		View_Open(fs2);	
		//MEM_Game.game_drawall = false;
		
		afdf2 = 1;	
	};

	if (afdf == 1) // zaciemnianie
	{	
		View_SetAlpha(fs2,RGBA(bll,bll,bll,255));
		bll2 += darknessSpeed;
		//Print(IntToString(bll));
	
		if (bll2 >= 500) {
			bll2 = 500;
			afdf2 = 2;
			View_SetAlpha(fs2,RGBA(255,255,255,255));
		};
	}
	
	else if (afdf2 == 2)
	{			
		bll5002 += 1;
	
		if (bll5002 == 15) {
			afdf2 = 3;
			Npc_ClearAIQueue (hero);
		};
	
	
	}
	
	else // afdf == 3 -> rozjasnianie
	{
		View_SetAlpha(fs2,RGBA(bll,bll,bll,255));
		View_SetTexture(fs2,"black.tga");
		bll2 -= darknessSpeed;

		if(bll2 <= 256) // calkiem jasno
		{
			bll2 = 256;
			Npc_ClearAIQueue (hero);
			view_delete(fs2);
			pre2 = 2;
			//MEM_Game.game_drawall = true;
			fs2 = 0;
			ff_remove(blackscreen2);
			return;
		
		};
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


func int HasHeroPoison()
{
	/*
	if(Buff_Has(hero,Poison1HP) || Buff_Has(hero,Poison5HP) || Buff_Has(hero,Poison10HP))
	{
		return true;
	};
	*/

	//return false;
	return WillZatruty;
};






func void _AI_FUNCTION_EVENT() {
    var string s0; var string s1;
    var int i0; var int i1; var int i2; var int i3; var int fnc;
    var int ptr; ptr = EBP+88;
    MEMINT_StackPushVar(ptr);
    var string AniName; AniName = MEMINT_PopString();

    if(!STR_StartsWith(AniName, "CALL ")) {
        return;
    };

    // Provide global instances (will be reverted by HookEngine afterwards)
    self = _^(ECX);
    other = MEM_NullToInst(); // Invalidate to avoid misuse
    item = MEM_NullToInst();

    var string argc; argc = STR_Split(AniName, " ", 1);
    if (Hlp_StrCmp(argc, "I")) {
        i0 = STR_ToInt(STR_Split(AniName, " ", 2));
        fnc = STR_ToInt(STR_Split(AniName, " ", 3));
        MEM_PushIntParam(i0);
    }
    else if (Hlp_StrCmp(argc, "S")) {
        s0 = STR_Unescape(STR_Split(AniName, " ", 2));
        fnc = STR_ToInt(STR_Split(AniName, " ", 3));
        MEM_PushStringParam(s0);
    }
    else if (Hlp_StrCmp(argc, "II")) {
        i0 = STR_ToInt(STR_Split(AniName, " ", 2));
        i1 = STR_ToInt(STR_Split(AniName, " ", 3));
        fnc = STR_ToInt(STR_Split(AniName, " ", 4));
        MEM_PushIntParam(i0);
        MEM_PushIntParam(i1);
    }
    else if (Hlp_StrCmp(argc, "SS")) {
        s0 = STR_Unescape(STR_Split(AniName, " ", 2));
        s1 = STR_Unescape(STR_Split(AniName, " ", 3));
        fnc = STR_ToInt(STR_Split(AniName, " ", 4));
        MEM_PushStringParam(s0);
        MEM_PushStringParam(s1);
    }
    else if (Hlp_StrCmp(argc, "SI")) {
        s0 = STR_Unescape(STR_Split(AniName, " ", 2));
        i1 = STR_ToInt(STR_Split(AniName, " ", 3));
        fnc = STR_ToInt(STR_Split(AniName, " ", 4));
        MEM_PushStringParam(s0);
        MEM_PushIntParam(i1);
    }
    else if (Hlp_StrCmp(argc, "IS")) {
        i0 = STR_ToInt(STR_Split(AniName, " ", 2));
        s1 = STR_Unescape(STR_Split(AniName, " ", 3));
        fnc = STR_ToInt(STR_Split(AniName, " ", 4));
        MEM_PushIntParam(i0);
        MEM_PushStringParam(s1);
    }
	else if (Hlp_StrCmp(argc, "NI")) { // G2U
        i0 = STR_ToInt(STR_Split(AniName, " ", 2));
        i1 = STR_ToInt(STR_Split(AniName, " ", 3));
        fnc = STR_ToInt(STR_Split(AniName, " ", 4));
        MEM_PushInstParam(i0);
        MEM_PushIntParam(i1);
	}
	else if (Hlp_StrCmp(argc, "NNII")) { // G2U

	    i0 = STR_ToInt(STR_Split(AniName, " ", 2));
        i1 = STR_ToInt(STR_Split(AniName, " ", 3));
        i2 = STR_ToInt(STR_Split(AniName, " ", 4));
        i3 = STR_ToInt(STR_Split(AniName, " ", 5));
        fnc = STR_ToInt(STR_Split(AniName, " ", 6));
        MEM_PushInstParam(i0);
        MEM_PushInstParam(i1);
        MEM_PushIntParam(i2);
        MEM_PushIntParam(i3);
	}
	else if (Hlp_StrCmp(argc, "NII")) { // G2U
	
		i0 = STR_ToInt(STR_Split(AniName, " ", 2));
		i1 = STR_ToInt(STR_Split(AniName, " ", 3));
		i2 = STR_ToInt(STR_Split(AniName, " ", 4));
		fnc = STR_ToInt(STR_Split(AniName, " ", 5));
		 
		var c_npc npc; npc = _^(i0);
		 
		MEM_PushInstParam(npc);
		MEM_PushIntParam(i1);
		MEM_PushIntParam(i2);
	
		
	}
    else {
        fnc = STR_ToInt(argc);
    };
	
    MEM_CallByID(fnc);
};
