

func void hero_brakuje_kasy(var int kasa)
{
	var string hero_kasiora;
	var int haro_kasa;
	haro_kasa = kasa - npc_hasitems (other, ItMi_Gold);
		
	hero_kasiora = "Brakuje Ci ";
	hero_kasiora = ConcatStrings(hero_kasiora,IntToString(haro_kasa));
	hero_kasiora = ConcatStrings(hero_kasiora," szt. z³ota!");
	AI_PrintScreen(hero_kasiora,-1,-1,FONT_ScreenSmall,2);
};

FUNC VOID AI_RunToNPC(var C_NPC slf, var C_NPC oth)
{
	AI_SetWalkmode(slf,NPC_RUN);
	AI_GoToNPC(slf,oth);
};

func int Jan_Placenie_Mam(var int rodzaj) {

	var int suma;
	suma = 0;
	suma = suma
	+ npc_hasitems(hero,ItMw_1h_MISC_Sword)
	+ npc_hasitems(hero,ItMw_1h_Misc_Axe)
	+ npc_hasitems(hero,ItMw_2H_Sword_M_01)
	+ npc_hasitems(hero,ItMw_2H_OrcAxe_01)
	+ npc_hasitems(hero,ItMw_2H_OrcAxe_02)
	+ npc_hasitems(hero,ItMw_2H_OrcAxe_03)
	+ npc_hasitems(hero,ItMw_2H_OrcAxe_04)
	+ npc_hasitems(hero,ItMw_2H_OrcSword_01)
	;
	
	print(IntToString(rodzaj));
	print(IntToString(suma));
	
	
	if(rodzaj==1 || rodzaj==2) && (suma>=10) { return true; }
	else if(rodzaj==3) && (suma>=12) { return true; }
	else if(rodzaj==4) && (suma>=15) { return true; }
	else { return false; };

};


func void Jan_Placenie_Placenie(var int rodzaj) {

	var int ile;
	var int pozostalo;
	
	if(rodzaj==1 || rodzaj==2) { pozostalo=10; }
	else if(rodzaj==3) { pozostalo=12; }
	else { pozostalo=15; };
	
	// ----- ----- ----- 1
	ile = npc_hasitems(hero,ItMw_1h_MISC_Sword);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_1h_MISC_Sword,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_1h_MISC_Sword,ile);
		pozostalo-=ile;
	};
	
	// ----- ----- ----- 2
	ile = npc_hasitems(hero,ItMw_1h_Misc_Axe);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_1h_Misc_Axe,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_1h_Misc_Axe,ile);
		pozostalo-=ile;
	};
	
	// ----- ----- ----- 3
	ile = npc_hasitems(hero,ItMw_2H_Sword_M_01);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_Sword_M_01,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_Sword_M_01,ile);
		pozostalo-=ile;
	};
	
	// ----- ----- ----- 4
	ile = npc_hasitems(hero,ItMw_2H_OrcAxe_01);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_01,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_01,ile);
		pozostalo-=ile;
	};
	
	// ----- ----- ----- 5
	ile = npc_hasitems(hero,ItMw_2H_OrcAxe_02);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_02,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_02,ile);
		pozostalo-=ile;
	};
	
	// ----- ----- ----- 6
	ile = npc_hasitems(hero,ItMw_2H_OrcAxe_03);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_03,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_03,ile);
		pozostalo-=ile;
	};
	
	// ----- ----- ----- 7
	ile = npc_hasitems(hero,ItMw_2H_OrcAxe_04);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_04,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcAxe_04,ile);
		pozostalo-=ile;
	};
	
	// ----- ----- ----- 8
	ile = npc_hasitems(hero,ItMw_2H_OrcSword_01);
	if(pozostalo>0 && ile>0) {
		if(ile>pozostalo) {
			B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcSword_01,pozostalo);
			return;
		};
		B_GiveInvItems(hero,NASZ_106_Jan,ItMw_2H_OrcSword_01,ile);
		pozostalo-=ile;
	};
	

	
};




// TimeIsUp, ketrab
// albo dni, albo godziny
func int TimeIsUp(var int days, var int hours, var int start_day, var int start_hour) {

	// nie chcemy niezainicjowanych zmiennych!
	if (start_day < 0) && (start_hour < 0) { return FALSE; };
	
	// albo chcemy dni, albo chcemy godziny! nie to i to!
	if (days >= 0 && hours >= 0) {
		Print("Error - wrong parameters of TimeIfUp");
		Print("Days & hours simultaneously different than 0!");
		return TRUE;
	};
	
	// dni
	if (days >= 0) {
		if (Wld_GetDay() >= days+start_day) { return TRUE; };
		return FALSE;
	};
	
	// godziny
	if (hours >= 0) {
		var int hrs_from_beg_start;
		var int hrs_from_beg_now;
		hrs_from_beg_start = start_day * 24 + start_hour;
		hrs_from_beg_now = Wld_GetDay() * 24 + Wld_GetTimeHour();
		
		if ((hrs_from_beg_now - hrs_from_beg_start) >= hours) { return TRUE; };
		return FALSE;
	};

	return TRUE;
};