// **************************************************** 
// B_AssessTalk	
// ------------
// aufgerufen durch Ansprechen (Wahrnehmung ASSESSTALK)
// oder durch B_AssessPlayer (NSC hat Important-Info)
// GILT AUCH F�R MONSTER
// ****************************************************

func void B_AssessTalk ()
{
	
	if(self.id == 410 && PallumBo_end)
	{
		if(Npc_IsInWorld(NASZ_405_VanGan))
		{
			Npc_SetTarget(self,NASZ_405_VanGan);
		};
		return;
	};
	// EXIT IF...
	
	if (Jeremiasz_AlmostDead == TRUE) && (self.id == 127) {
		return; // jesli jeremiasz wypil lek, to sie go nie da zagadac
	};
	
	if (MonastirRitualRunning == TRUE) && (self.id == 10) {
		return; // jesli Monastir odprawia, rytual to sie go nie da zagadac
	};
	
	if (OrunRitualRunning == TRUE) && (self.id == 24) {
		return; // jesli Orun odprawia rytual, to sie go nie da zagadac
	};
	
	if (LastRitual == TRUE) && (self.id == 402 || self.id == 403 || self.id == 404) {
		return; // jesli bogowie odprawiaja rytual, to sie nie da zagadac
	};
	
	
	// ------- FORBIDDEN: Levelinspektor oder Rockefeller wird ignoriert ------
	var C_NPC PCL; PCL = Hlp_GetNpc(PC_Levelinspektor);
	var C_NPC PCR; PCR = Hlp_GetNpc(PC_Rockefeller);
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PCL))
	|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PCR))
	{
		PrintScreen (ConcatStrings("Stimme: ", IntToString(self.voice)), -1, 70, FONT_Screen, 2);
		
		PrintScreen ("KEIN HERO!", -1, -1, FONT_Screen, 2);	
		PrintScreen (IntToString(self.aivar[AIV_FollowDist]), -1, 70, FONT_Screen, 2);
		
		if (C_NpcIsInQuarter (self) == Q_KASERNE)
		{
			PrintScreen ("Q_KASERNE", -1, 30, FONT_Screen, 2);
		};
		
		if (C_NpcIsInQuarter (self) == Q_GALGEN)
		{
			PrintScreen ("Q_GALGEN", -1, 30, FONT_Screen, 2);
		};
		
		if (C_NpcIsInQuarter (self) == Q_MARKT)
		{
			PrintScreen ("Q_MARKT", -1, 30, FONT_Screen, 2);
		};
		
		if (C_NpcIsInQuarter (self) == Q_TEMPEL)
		{
			PrintScreen ("Q_TEMPEL", -1, 30, FONT_Screen, 2);
		};
		
		if (C_NpcIsInQuarter (self) == Q_UNTERSTADT)
		{
			PrintScreen ("Q_UNTERSTADT", -1, 30, FONT_Screen, 2);
		};
		
		if (C_NpcIsInQuarter (self) == Q_HAFEN)
		{
			PrintScreen ("Q_HAFEN", -1, 30, FONT_Screen, 2);
		};
		
		if (C_NpcIsInQuarter (self) == Q_OBERSTADT)
		{
			PrintScreen ("Q_OBERSTADT", -1, 30, FONT_Screen, 2);
		};
		
		return;
	};
	
	// ------ Exit-Conditions NUR f�r Monster
	if (self.guild > GIL_SEPERATOR_HUM)
	{
		// ------ Monster hat keine Info ------
		if (Npc_CheckInfo (self, 1) == FALSE)
		{
			if (Npc_CheckInfo (self, 0) == FALSE)
			{
				return;
			};
		};
	};
		
	// ------ Exit-Conditions NUR f�r Humans ------
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		
		// ------ Spieler ist Enemy ------
		if (B_AssessEnemy())	
		{ 
			return;
		};
	
		// ------ Spieler ist M�rder ------
		if (B_GetPlayerCrime(self) == CRIME_MURDER)
		&& (C_WantToAttackMurder(self, other))
		{
			B_Attack (self, other, AR_HumanMurderedHuman, 0);	
			return;
		};
		
		if (C_PlayerIsFakeBandit (self,other) == TRUE)
		&& (self.guild != GIL_BDT)
		{
			B_Attack (self,other,AR_GuildEnemy,0);
			return;
		};
		
		
		if (C_RefuseTalk(self,other))
		{
			if C_PlayerHasFakeGuild (self,other)
			{
				Npc_ClearAIQueue	(self);
				AI_StartState (self,ZS_CommentFakeGuild , 1, "");
				return;
			}
			else
			{
				B_Say (self, other, "$NOTNOW");
				return;
			};	
		};
	};
	
		
	// FUNC
	
	// ------ Spieler labert NSC an ------
	if (self.aivar[AIV_NpcStartedTalk] == FALSE)
	{
		if ( C_BodyStateContains(self,BS_WALK) || C_BodyStateContains(self,BS_RUN) )
		{
			B_Say (other,self,"$SC_HEYWAITASECOND");
		}
		else if (!Npc_CanSeeNpc(self, other))
		{
			var int rnd; rnd = Hlp_Random(100);
			if 		(rnd <= 25)	{	B_Say (other,self,"$SC_HEYTURNAROUND");		}
			else if (rnd <= 50)	{	B_Say (other,self,"$SC_HEYTURNAROUND02");	}
			else if (rnd <= 75)	{	B_Say (other,self,"$SC_HEYTURNAROUND03");	}
			else if (rnd <= 99) {	B_Say (other,self,"$SC_HEYTURNAROUND04");	};
		};
	};

	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);	
	
	// ------ NSC bleibt sitzen oder steht in Ruhe auf bzw. beendet Mobsi in Ruhe -----------------
	if (C_BodyStateContains(self, BS_SIT))
	{
		if (self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandUpQuick (other); //Spieler anhalten
		}
		else
		{
			AI_StandUp		(other); //Spieler anhalten
		};
		
		if (Npc_CanSeeNpc(self, other))
		{
			AI_StartState 	(self, ZS_Talk, 0, ""); 	//sitzenbleiben
		}	
		else //nicht sehen
		{
			//HACK: Im ObservePlayer kann ein NSC sitzen, ohne da� in der END-Routine des ZS sauber aufgestanden wird (klar, denn ZS_ObservePlayer_End hat kein StandUp o.�. - darf dies auch nicht haben)
			if (Npc_IsInState (self, ZS_ObservePlayer))
			{
				AI_StandUp 		(self);
			};
			AI_StartState 	(self, ZS_Talk, 1, ""); 	//aufstehen
		};
				
		return;
	}
	else //nicht sitzen
	{
		if (self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandUpQuick (self);
			AI_StandUpQuick (other); //Spieler anhalten
		}
		else
		{
			AI_StandUp		(self);
			AI_StandUp		(other); //Spieler anhalten
		};
		
		AI_StartState 	(self, ZS_Talk, 0, ""); 	//sitzenbleiben
		return;
	};
};
			

				
