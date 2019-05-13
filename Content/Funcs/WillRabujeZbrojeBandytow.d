// WillRabujeZbrojeBandytow

func void WillRabujeZbrojeBandytow(var C_Npc bandit) {

	AI_RemoveWeapon (hero);
	AI_RunToNpc (hero, bandit);
	B_TurnToNpc (hero, bandit);
	AI_PlayAni (hero, "T_PLUNDER");

	AI_UnequipArmor (bandit);
	CreateInvItems(hero,ItNa_BAN_M,1);
	PrintS_Ext(ConcatStrings(G2U_you_take,"Pancerz bandyty"), RGBA(255,255,255,0));
};