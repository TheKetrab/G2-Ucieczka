

func int BanditKilled(var int print_alive) {

	var int ammount; ammount = 0;
	var string alives; alives = "";
		
	// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
	if (npc_isdead (NASZ_306_Perrot)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_306_Perrot.id))); };
	
	if (npc_isdead (NASZ_315_Bandzior)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_315_Bandzior.id))); };
	
	if (npc_isdead (NASZ_316_Carry)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_316_Carry.id))); };
	
	if (npc_isdead (NASZ_317_Bandzior)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_317_Bandzior.id))); };
	
	if (npc_isdead (NASZ_318_Gobby)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_318_Gobby.id))); };
	
	if (npc_isdead (NASZ_326_Domenic)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_326_Domenic.id))); };
	
	if (npc_isdead (NASZ_327_Danny)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_327_Danny.id))); };
	// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

	if (print_alive == TRUE) { Print(alives); };
	
	return ammount;
};


