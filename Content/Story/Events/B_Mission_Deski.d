var int Deska_1;
var int Deska_2;
var int Deska_3;

func void B_Mission_Deski_1_S1 ()
{
	if (Deska_1 == FALSE) && (Deski_Mission) && (MIS_ROBOTNIK_READY == TRUE) {
		PrintScreen	("Naprawiono", -1, 45, FONT_Screen, 2);
		Deski_Mission = Deski_Mission + 1;
		Deska_1 = TRUE;
	};
	
	if (Deska_2 == TRUE) && (Deska_3 == TRUE) && (MIS_ROBOTNIK_READY == TRUE) {
		Npc_RemoveInvItems (hero, ItNa_PaczkaGwozdzi, 1);
	};
};

func void B_Mission_Deski_2_S1 ()
{
	if (Deska_2 == FALSE) && (Deski_Mission) && (MIS_ROBOTNIK_READY == TRUE) {
		PrintScreen	("Naprawiono", -1, 45, FONT_Screen, 2);
		Deski_Mission = Deski_Mission + 1;
		Deska_2 = TRUE;
	};
	
	if (Deska_1 == TRUE) && (Deska_3 == TRUE) && (MIS_ROBOTNIK_READY == TRUE) {
		Npc_RemoveInvItems (hero, ItNa_PaczkaGwozdzi, 1);
	};
};
func void B_Mission_Deski_3_S1 ()
{
	if (Deska_3 == FALSE) && (Deski_Mission) && (MIS_ROBOTNIK_READY == TRUE) {
		PrintScreen	("Naprawiono", -1, 45, FONT_Screen, 2);
		Deski_Mission = Deski_Mission + 1;
		Deska_3 = TRUE;
	};
	
	if (Deska_1 == TRUE) && (Deska_2 == TRUE) && (MIS_ROBOTNIK_READY == TRUE) {
		Npc_RemoveInvItems (hero, ItNa_PaczkaGwozdzi, 1);
	};
};

func int WillCanRepair()
{
	if (MIS_ROBOTNIK_READY == TRUE) {
	
	if (npc_hasitems (hero, ItNa_PaczkaGwozdzi) >=1)
	{
		return TRUE;
	}
	else {
		HeroSay_PotrzebujeGwozdzi();
	};
	
	};
};
