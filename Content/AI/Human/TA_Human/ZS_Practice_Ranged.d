
func void ZS_Practice_Ranged ()
{	
	Perception_Set_Minimal(); // ma nie reagowac na to, ze strzela do przeciwnika
	Npc_PercEnable(self, PERC_ASSESSTALK, B_AssessTalk); // ale mozna go zagadac
	
   	B_ResetAll (self);
	
	AI_SetWalkmode 	(self,NPC_WALK);
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP	(self, self.wp);
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Practice_Ranged_Loop ()
{
	// EXIT IF
	if (self.aivar[AIV_RangedTA_Target] == 0) {
		return LOOP_END;
	};

	// PREPARE
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
    {
    	if (!Npc_HasEquippedRangedWeapon (self))
		{
			CreateInvItems	(self, ItRw_Bow_L_01, 1);
			AI_EquipBestRangedWeapon (self);
		};
		
		AI_ReadyRangedWeapon (self);
		
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};


	// PRACTICE
	var c_npc rangedTarget; rangedTarget = Hlp_GetNPC(self.aivar[AIV_RangedTA_Target]);
	var c_item rangedWeapon; rangedWeapon = Npc_GetEquippedRangedWeapon(self);

	CreateInvItem (self, rangedWeapon.munition);
		
	Npc_SetTarget(self, rangedTarget); // to wymusza, zeby strzala leciala dokladnie na tarcze

	AI_TurnToNpc(self, rangedTarget);
	AI_LookAtNpc(self, rangedTarget);
	AI_AimAt (self, rangedTarget);
	AI_Wait(self, 2);

	AI_ShootAt (self, rangedTarget);

	ForceTeleport(rangedTarget,rangedTarget.wp); // npc-tarcza sie przesuwa przy okazji strzalu, wiec teleportujemy go z powrotem

	if (Npc_GetStateTime(self) > 20) {

		AI_UseItemToState 	(self, 	ItRw_Arrow, -1);
		AI_StopLookAt(self);
		AI_StopAim(self);
		Npc_ClearAIQueue (self);
		AI_RemoveWeapon (self);

		AI_SetWalkmode(self,NPC_WALK);
		AI_GotoWP (self, rangedTarget.wp);

		AI_PlayAni		(self, "T_PLUNDER");

		AI_SetWalkmode(self,NPC_WALK);
		AI_GotoWP (self, self.wp); 

		AI_AlignToWP    (self);
		AI_TurnToNpc(self, rangedTarget);
		
		Npc_SetStateTime (self,0);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};

	return LOOP_CONTINUE;

};

func void ZS_Practice_Ranged_End ()
{
	AI_UseItemToState 	(self, 	ItRw_Arrow, -1);

	AI_StopLookAt(self);
	AI_StopAim(self);
	Npc_ClearAIQueue (self);
	AI_RemoveWeapon (self);
};
