// Visualisierung: Schriftst�ck lesen -> 'self' zieht ein St�ck Pergament aus der Tasche und wirft einen Blick drauf 

func void B_UseFakeScroll ()
{
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc	(self,	hero);
	};
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	
	CreateInvItem		(self,	Fakescroll);
	
	var C_NPC target; target = Npc_GetLookAtTarget(self);
	
	if (Hlp_IsValidNpc(target)) //wenn ich irgendein lookAt-Target habe
	{
		B_StopLookAt (self);
		AI_UseItemToState	(self,	Fakescroll,	1);
		AI_Wait				(self,	1);
		AI_UseItemToState	(self,	Fakescroll,	-1);
		B_LookAtNpc (self, hero);
	}
	else
	{
		AI_UseItemToState	(self,	Fakescroll,	1);
		AI_Wait				(self,	1);
		AI_UseItemToState	(self,	Fakescroll,	-1);
	};
};

func void B_UseFakeBook ()
{
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc	(self,	hero);
	};
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	
	CreateInvItem		(self,	ItNa_CorKalom_Book);
	
	var C_NPC target; target = Npc_GetLookAtTarget(self);
	
	if (Hlp_IsValidNpc(target)) //wenn ich irgendein lookAt-Target habe
	{
		B_StopLookAt (self);
		AI_UseItemToState	(self,	ItNa_CorKalom_Book,	1);
		AI_Wait				(self,	2);
		AI_UseItemToState	(self,	ItNa_CorKalom_Book,	-1);
		B_LookAtNpc (self, hero);
	}
	else
	{
		AI_UseItemToState	(self,	ItNa_CorKalom_Book,	1);
		AI_Wait				(self,	2);
		AI_UseItemToState	(self,	ItNa_CorKalom_Book,	-1);
	};
};

func void B_UseFakeBookDziennik ()
{
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc	(self,	hero);
	};
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	
	CreateInvItem		(self,	ItNa_Uroboros1);
	
	var C_NPC target; target = Npc_GetLookAtTarget(self);
	
	if (Hlp_IsValidNpc(target)) //wenn ich irgendein lookAt-Target habe
	{
		B_StopLookAt (self);
		AI_UseItemToState	(self,	ItNa_Uroboros1,	1);
		AI_Wait				(self,	2);
		AI_UseItemToState	(self,	ItNa_Uroboros1,	-1);
		B_LookAtNpc (self, hero);
	}
	else
	{
		AI_UseItemToState	(self,	ItNa_Uroboros1,	1);
		AI_Wait				(self,	2);
		AI_UseItemToState	(self,	ItNa_Uroboros1,	-1);
	};
	
	Npc_RemoveInvItems(self,ItNa_Uroboros1,1);
};