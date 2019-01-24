// ***********************************************************
// B_GetLearnCostAttribute
// -----------------------
// ermittelt die Kosten eines Attributspunktes (abh. v. Gilde)
// ***********************************************************
	
func int B_GetLearnCostAttribute (var C_NPC oth, var int attribut)
{
	var int kosten; kosten = 0;

	// ------ Kosten f�r St�rke ------
	if (attribut == ATR_STRENGTH) 
	{
		if (oth.aivar[REAL_STRENGTH] >= 120)		{	kosten = (2);	}
		else if (oth.aivar[REAL_STRENGTH] >= 90) 	{	kosten = (2);	}
		else if (oth.aivar[REAL_STRENGTH] >= 50) 	{	kosten = (2);	}
		else if (oth.aivar[REAL_STRENGTH] >= 30) 	{	kosten = (1);	}
		else 										{	kosten = (1);	};
	};
	
	// ------ Kosten f�r Dexterity ------
	if (attribut == ATR_DEXTERITY) 
	{
		if (oth.aivar[REAL_DEXTERITY] >= 120)		{	kosten = (2);	}
		else if (oth.aivar[REAL_DEXTERITY] >= 90)	{	kosten = (2);	}
		else if (oth.aivar[REAL_DEXTERITY] >= 50)	{	kosten = (2);	}
		else if (oth.aivar[REAL_DEXTERITY] >= 30)	{	kosten = (1);	}
		else 										{	kosten = (1);	};
	};
	
	// ------ Kosten f�r Mana MAX ------
	if (attribut == ATR_MANA_MAX)
	{		
		if (oth.aivar[REAL_MANA_MAX] >= 120)		{	kosten = (2);	}
		else if (oth.aivar[REAL_MANA_MAX] >= 90) 	{	kosten = (2);	}
		else if (oth.aivar[REAL_MANA_MAX] >= 50) 	{	kosten = (2);	}
		else if (oth.aivar[REAL_MANA_MAX] >= 30) 	{	kosten = (1);	}
		else 										{	kosten = (1);	};
	};
	
	return kosten;
};