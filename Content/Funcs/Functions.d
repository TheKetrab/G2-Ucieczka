const int oCSpawnManager__DeleteNpc = 7837328;
func void DeleteNpc(var c_npc slf)
{
	var int ptr; ptr = _@(slf);
	CALL_PtrParam(ptr);
	CALL__thiscall(MEM_GAME.spawnman, oCSpawnManager__DeleteNpc );
};
func void QS_RemoveDeadWeapon()
{
	var int s[2];
	var int arg; arg = 1;
	arg;
	MEM_CallByString("QS_GetSlotItem");
	s[0] = MEM_PopIntResult();
	arg = 2; 
	arg;
	MEM_CallByString("QS_GetSlotItem");
	s[1] = MEM_PopIntResult();
	if(s[0])
	{
		oCNpc_UnequipItem(hero,s[0]);
		arg = 1;
		arg;
		MEM_CallByString("QS_RemoveSlot");
	}
	if(s[1])
	{
		oCNpc_UnequipItem(hero,s[1]);
		arg = 2;
		arg;
		MEM_CallByString("QS_RemoveSlot");
	};
};

// @Splash
func int Npc_GetSpellItem(var c_npc slf)
{
    const int Npc__GetSpellItem =	4692960;
	var oCNpc npc; npc = _^(MEM_InstToPtr(slf));
    var oCMag_Book magbook; magbook = _^(npc.mag_book);
    CALL_IntParam(magbook.spellnr);
    CALL__thiscall(npc.mag_book, Npc__GetSpellItem);
    return CALL_RetValAsPtr();
};
// bogu: W sumie nie potrzebne, bo jest GFA_GetActiveSpellInst(npc)
/*func int Npc_GetSelectedSpell(var c_npc slf)
{
    const int Npc__GetSelectedSpell =	4683648;
	var oCNpc npc; npc = _^(MEM_InstToPtr(slf));
    var oCMag_Book magbook; magbook = _^(npc.mag_book);
    CALL_IntParam(magbook.spellnr);
    CALL__thiscall(npc.mag_book, Npc__GetSelectedSpell);
    return (CALL_RetValAsPtr()+oCSpell_C_Spell_offset);
};*/


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


func int Get_AniSpeed(var c_npc slf, var string aniName)
{
    var int ptr;  ptr = GetAniFromAniID(slf,aniName);
    return roundf(MEM_ReadInt(ptr+176));
}; 


// TheKetrab
func int Hlp_GetMinFromSec(var int sec) {

	var int res; res = sec / 60;
	return res;
};


func int bIsHammer(var c_item itm) {

	if (Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_Kriegshammer1)
	 || Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_Kriegshammer2)
	 || Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_1H_Mace_L_04)
	 || Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItMw_Rabenschnabel)
	 || Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItNa_MlotOrkow))
	{
		return TRUE;
	};
	
	return FALSE;

};

func int bNpcHasHammer(var c_npc slf) {

	if (Npc_HasItems(slf,ItMw_Kriegshammer1)
	 || Npc_HasItems(hero,ItMw_Kriegshammer2)
	 || Npc_HasItems(hero,ItMw_1H_Mace_L_04)
	 || Npc_HasItems(hero,ItMw_Rabenschnabel) // kruczy dziób -> zręczność
	 || Npc_HasItems(hero,ItNa_MlotOrkow))
	{
		return TRUE;
	};
	
	return FALSE;

};

func int C_IsPlantSkill_FactorItem()
{

	if(Hlp_GetInstanceID(item) == Hlp_GetInstanceID(ItPl_Mana_Herb_01)
	|| Hlp_GetInstanceID(item) == Hlp_GetInstanceID(ItPl_Mana_Herb_02)
	|| Hlp_GetInstanceID(item) == Hlp_GetInstanceID(ItPl_Mana_Herb_03)
	|| Hlp_GetInstanceID(item) == Hlp_GetInstanceID(ItPl_Health_Herb_01)
	|| Hlp_GetInstanceID(item) == Hlp_GetInstanceID(ItPl_Health_Herb_02)
	|| Hlp_GetInstanceID(item) == Hlp_GetInstanceID(ItPl_Health_Herb_03)) 
	{
		return true;
	};
	
	return false;

};

// UWAGA -> to nie jest celowe procentowo, ale zostala nazwa funkcji
func void PercentHealSelf(var int proc, var int attrb)
{
	var int atrb; atrb = MEM_ReadStatArr(self.attribute,attrb+1);
	var int procent; procent = proc;//(atrb*proc)/100;
	if(!procent) { procent = 1; };
	
	if(C_IsPlantSkill_FactorItem() && level_zielarstwa == 2) {
		procent *= PlantSkill_Factor;
	};
	
	Npc_ChangeAttribute(self,attrb,procent);
};



func void Wld_VobEffect(var string effect, var string vobName)
{
	var int vob; vob = MEM_SearchVobByName(vobName);

	if (!vob) {
		Print(ConcatStrings("Wld_VobEffect - not found: ",vobName));
		return;
	};

	var zCVob destVob; destVob = _^(vob);
	Wld_PlayEffect(effect, destVob, destVob, 0, 0, 0, FALSE );
};


func void Wld_VobEffect_Vob(var string effect, var int vob) // vob = vobId
{
	if (!vob) {
		Print(ConcatStrings("Wld_VobEffect_Vob - not found: ",IntToString(destVob)));
		return;
	};

	var zCVob destVob; destVob = _^(vob);
	Wld_PlayEffect(effect, destVob, destVob, 0, 0, 0, FALSE );
};

//EngineAdr_GX.d containts it
//const int oCNpc__EquipItem = 7545792;
func void Engine_Npc_EquipItem(var int npcPtr, var int itemPtr)
{
	Call_PtrParam(itemPtr);
	CALL__thiscall(npcPtr,oCNpc__EquipItem);
};

func void Npc_EquipHelmet(var c_npc npc, var int helmetInst)
{
	if(!Hlp_IsValidNpc(npc)){return;};
	
	if(!Npc_GetInvItem(npc,helmetInst))
	{
		CreateInvItems(npc,helmetInst,1);
	};	
	
	var int npcPtr; npcPtr = _@(npc);
	var int itemPtr; itemPtr = _@(item);
	
	
	if(!npcPtr || !ItemPtr){return;};
	
	Engine_Npc_EquipItem(npcPtr,itemPtr);
};

//funkcja powinna być wywołana za pomocą AI_Engine_EquipWeapon
func void Engine_EquipWeapon(var c_npc slf, var int inst, var int createItemIfNotValid)
{
	var int npcPtr; npcPtr = ECX;//_@(self);
	if(!npcPtr)
	{
		MEM_Info("NPC_InsepctWeapon: npc is null");
		return;
	};
	
	
	if(!Npc_GetInvItem(self,inst) && createItemIfNotValid)
	{	 
		CreateInvItem(self,inst);
	};
	
	var int itemPtr; itemPtr = _@(item);

	var c_item weapon;
	weapon = Npc_GetEquippedMeleeWeapon(self);
		
	if(!Hlp_IsValidItem(weapon))
	{
		weapon = Npc_GetReadiedWeapon(self);
	};
		
	
	if(Hlp_IsValidItem(weapon) && Hlp_GetInstanceId(weapon) != inst && inst != -1)
	{
		if(weapon.mainflag == item.mainflag)
		{
			//unequip current item
			var int weaponPtr; weaponPtr = _@(weapon);
			oCNpc_UnequipItem(self,weaponPtr);
		};
		
		
		Engine_Npc_EquipItem(npcPtr,itemPtr);
	};
	
};

func void AI_Engine_EquipWeapon(var c_npc slf, var int inst, var int createItemIfNotValid)
{
	AI_RemoveWeapon (slf);
	AI_Function_II(slf,Engine_EquipWeapon,ItMw_Orkschlaechter,createItemIfNotValid);
};

func void Npc_InspectWeapon(var c_npc slf, var int inst, var int createItemIfNotvalid)
{
	AI_RemoveWeapon (slf);
	AI_Function_II(slf,Engine_EquipWeapon,ItMw_Orkschlaechter,createItemIfNotValid);
	AI_ReadyMeleeWeapon	(slf);
	AI_PlayAni		(slf, "T_1HSINSPECT");
	AI_RemoveWeapon (slf);
};

func void OnLoadUpdateHeroFightSkill() {

	// Fix U12: RemoveOverlayMds uniemożliwiał strzelanie, trzeba było schować łuk i wyciągnąć
	if (Npc_HasReadiedRangedWeapon(hero)) {
		return;
	};

	if (hero.HitChance[NPC_TALENT_1H] < 10)		{	Npc_SetTalentSkill (hero, NPC_TALENT_1H, 0);		Mdl_ApplyOverlayMds (hero, "HUMANS_X.MDS");	};
	if (hero.HitChance[NPC_TALENT_1H] >=10)		{	Mdl_RemoveOverlayMds (hero, "HUMANS_X.MDS");		Npc_SetTalentSkill (hero, NPC_TALENT_1H, 0);		};
	if (hero.HitChance[NPC_TALENT_1H] >=30)		{	Npc_SetTalentSkill (hero, NPC_TALENT_1H, 1);		};
	if (hero.HitChance[NPC_TALENT_1H] >=60)		{	Npc_SetTalentSkill (hero, NPC_TALENT_1H, 1);		};

	ff_remove(OnLoadUpdateHeroFightSkill);

};


func int GetItemSlot_(var int slfPtr, var string slotName) 
{
    const int oCNpc__getitemslot = 7544560;
	slotName = Str_Upper(slotName);
	CALL_zStringPtrParam(slotName);
    CALL__thiscall (slfPtr, oCNpc__getitemslot);
    return CALL_RetValAsPtr();
};

const string ShieldEquippedSlot = "ZS_SHIELD";
const string ShieldReadiedSlot  = "ZS_LEFTARM";
func int HasNpcShieldActive(var c_npc slf, var int inst)
{
	if(!Hlp_IsValidNpc(slf)){return 0;};
	
	var int pNpc; pNpc = _@(slf);
	
	var int slotItem; slotItem = GetItemSlot_(pNpc,ShieldEquippedSlot);
	
	if(!slotItem)
	{
		slotItem = GetItemSlot_(pNpc,ShieldReadiedSlot);
	};
		
	if(Hlp_Is_oCItem(slotItem))
	{
		var c_item itm; itm = _^(slotItem);
		
		if(Hlp_GetInstanceID(itm) ==  inst)
		{
			return TRUE;
		};	
	};
	
	return FALSE;
};

func int IsSpellTransformation(var int spellId)
{
	return spellId >= SPL_TrfSheep && spellID <= SPL_TrfDragonSnapper;
};


func int IsPlayerOrSavedPlayer(var c_npc slf)
{
	if(Npc_IsPlayer(slf)){ return TRUE; };
	
	if(Hlp_IsValidNpc(hero))
	{
		var oCNpc her;	her = HLp_GetNpc(hero);
		var int spellList; spellList = her.activeSpells_next;
		var int slfPtr; slfPtr = _@(slf);

		while(spellList);
		
			var int spell; spell = MEM_ReadInt(spellList);
			
			if(spell)
			{
				//var int spellId; spellId = MEM_ReadInt(spell+84);
				//if(IsSpellTransformation(spellId))
				//{
					var int saveNpc; saveNpc = MEM_ReadInt(spell+64);
					
					if(saveNpc == slfPtr) 
					{ 
						return TRUE;
					};
				//};
					
			};	
			
			spellList = MEM_ReadInt(spellList+4);
			
		end;
		
	};
	
	return FALSE;
};