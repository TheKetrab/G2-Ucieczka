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