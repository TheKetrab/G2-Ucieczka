
var C_NPC tarcza;
func void ZS_Practice_Bow ()
{
	//tarcza = Hlp_GetNPC(self.id == 800);
	
	Perception_Set_Normal();
	B_ResetAll (self);
	tarcza = Hlp_GetNPC(self.aivar[43]);
	self.aivar[44]=1;
	AI_SetWalkmode 	(self, NPC_WALK);	
	AI_EquipBestRangedWeapon (self);
	AI_ReadyRangedWeapon (self);
	if !(Hlp_StrCmp(self.wp, Npc_GetNearestWP(self)))
	{
		AI_GotoWP (self, self.wp); 
	};
};

func void ZS_Practice_Bow_End ()
{
	AI_StopLookAt(self);
	AI_StopAim(self);
	Npc_ClearAIQueue (self);
	AI_RemoveWeapon (self);
};

func void ZS_Practice_Bow_Loop ()
{
	var c_item RangedWeapon; RangedWeapon = Npc_GetEquippedRangedWeapon (self);
	CreateInvItem (self, RangedWeapon.munition);
	AI_LookAtNpc(self, tarcza);
	AI_AimAt (self, tarcza);

	AI_ShootAt (self, tarcza);
	AI_Wait(self, 2);
	//Wld_InsertItem(ItRw_Arrow,"HP2");
	//Wld_InsertItem(ItRw_Arrow,"HP3");

	if (Npc_GetStateTime(self) > (80 * self.aivar[44])){
		
		ZS_Practice_Bow_End ();

		AI_GotoWP (self, "NASZ_MYSLIWI_GORA_18"); 
		AI_Wait(self, 2);
		//AI_TakeItem(self, ItRw_Arrow);
		//AI_TakeItem(self, ItRw_Arrow);
		//AI_TakeItem(self, ItRw_Arrow);
		//AI_TakeItem(self, ItRw_Arrow);
		AI_GotoWP (self, self.wp); 
		AI_Wait(self, 3);
		self.aivar[44] = self.aivar[44] + 1;

		ZS_Practice_Bow ();

	};


};
