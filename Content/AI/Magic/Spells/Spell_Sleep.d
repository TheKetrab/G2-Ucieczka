// *********
// SPL_Sleep
// *********

const int SPL_Cost_Sleep				= 30;	
const int SPL_TIME_Sleep				= 30;	// in ZS_MagicSleep
var int SleepUsed;

instance Spell_Sleep (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
};

func int Spell_Logic_Sleep (var int manaInvested) //Parameter manaInvested wird hier nicht benutzt
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Sleep)
	{
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Sleep;
		};
		
		if (!C_BodyStateContains(other, BS_SWIM))
		&& (!C_BodyStateContains(other, BS_DIVE))
		&& (!C_NpcIsDown(other))
		&& (other.guild < GIL_SEPERATOR_HUM)
		//&& (other.level - self.level <= 3) //EGAL, sonst Spell witzlos (Klau-Wachen)
		&& (other.flags != NPC_FLAG_IMMORTAL) 
		&& (Npc_GetDistToNpc (self,other) <= 1000)
		//&& (C_NpcIsGateGuard (self) == FALSE) //EGAL, weil PAL oder Kdf kritische Wachen sind
		&& (other.guild != GIL_KDF)
		&& (other.guild != GIL_DMT)
		&& (other.guild != GIL_PAL)
		{

			if (Hlp_GetInstanceID(other) == NASZ_006_Renegat)
			&& (WillMaRzucicZaklecieNaStraznika)
			{
				B_LogEntry(TOPIC_Ben_metody, "Strażnik zasnął. Pora na ucieczkę z jaskini! Pozostaje kwestia tego, jak wydostać się z obozu?");
				Log_SetTopicStatus (TOPIC_Ben_metody, LOG_SUCCESS);
				B_GivePlayerXP(100);
				WillMaRzucicZaklecieNaStraznika = FALSE;
				UcieklesZKopalni = TRUE;
			};
		
			Npc_ClearAIQueue	(other);
			B_ClearPerceptions	(other);
			AI_StartState		(other, ZS_MagicSleep, 0, "");
		};
		return SPL_SENDCAST; //Spell wird auch gecasted, wenn keine Auswirkungen (other geht nicht in ZS) Mana is dann weg - Pech gehabt! (soll so sein!)
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Sleep()
{
	if (Npc_IsPlayer(self) && !SleepUsed) {
		SleepUsed = TRUE;
		WillUzyteZaklecia += 1;
	};
	//self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Sleep;			// nicht drin, wegen Kommentar oben
	
	self.aivar[AIV_SelectSpell] += 1;
};






