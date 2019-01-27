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
// @bogu W sumie nie potrzebne, bo jest GFA_GetActiveSpellInst(npc)
/*func int Npc_GetSelectedSpell(var c_npc slf)
{
    const int Npc__GetSelectedSpell =	4683648;
	var oCNpc npc; npc = _^(MEM_InstToPtr(slf));
    var oCMag_Book magbook; magbook = _^(npc.mag_book);
    CALL_IntParam(magbook.spellnr);
    CALL__thiscall(npc.mag_book, Npc__GetSelectedSpell);
    return (CALL_RetValAsPtr()+oCSpell_C_Spell_offset);
};*/



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


func void PercentHealSelf(var int proc, var int attrb)
{
	const int atrb = attrb;
	var int procent; procent = (self.attribute[atrb]*proc)/100;
	Npc_ChangeAttribute(self,atrb,procent);
};
