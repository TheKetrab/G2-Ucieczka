

func int GetMunitionAmmount(var C_NPC slf)
{
	var int ammount;

	// jesli ma wyciagniety luk, to ma jedna strzale w rece a nie ekwipunku
	if (Npc_HasReadiedRangedWeapon(slf)) { ammount = 1; }
	else { ammount = 0; };
	
	ammount += Npc_HasItems(slf,ItRw_Arrow);
	ammount += Npc_HasItems(slf,ItRw_Bolt);
	ammount += Npc_HasItems(slf,ItNa_OstraStrzala);
	ammount += Npc_HasItems(slf,ItRw_SharpBolt);
	ammount += Npc_HasItems(slf,ItNa_OgnistaStrzala);
	ammount += Npc_HasItems(slf,ItNa_LodowaStrzala);
	
	return ammount;
};

