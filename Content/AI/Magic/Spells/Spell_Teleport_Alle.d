// ********************
// Alle Teleport Spells
// ********************

const int SPL_Cost_Teleport		= 5;

const int SPL_Cost_GroupHeal		= 10;
const int SPL_Heal_GroupHeal		= 800;
// ****************************************
// Print, wenn im falschen Level aktiviert
// ****************************************

func void B_PrintTeleportTooFarAway (var int Level)
{
	if (Level != CurrentLevel)
	{
		PrintScreen	(PRINT_TeleportTooFarAway ,-1,YPOS_LevelUp,FONT_ScreenSmall,2);
	};
};

// ------ Instanz für alle Teleport-Spells ------
INSTANCE Spell_Teleport (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};

// ------ zum Paladin-Secret ------
func int Spell_Logic_PalTeleportSecret (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_PalTeleportSecret()
{
	//B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NW_PAL_SECRETCHAMBER");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};


// ------ zur Hafen-Stadt ------
func int Spell_Logic_TeleportSeaport (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportSeaport()
{
	//B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "HAFEN");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Kloster ------
func int Spell_Logic_TeleportMonastery (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportMonastery()
{
	//B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "KLOSTER");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Bauernhof ------
func int Spell_Logic_TeleportFarm (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportFarm()
{
	//B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "BIGFARM");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zu Xardas ------
func int Spell_Logic_TeleportXardas (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportXardas()
{
	//B_PrintTeleportTooFarAway (NEWWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "XARDAS"); 
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Pass in der NW ------
func int Spell_Logic_TeleportPassNW (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportPassNW()
{
	//B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "LEVELCHANGE");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Pass in der OW ------
func int Spell_Logic_TeleportPassOW (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};


func void Spell_Cast_TeleportPassOW()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "SPAWN_MOLERAT02_SPAWN01");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Old Camp ------
func int Spell_Logic_TeleportOC (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOC()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "OC_MAGE_CENTER");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ in den OW Dämonentower ------
func int Spell_Logic_TeleportOWDemonTower (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOWDemonTower()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "DT_E3_03");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ Zur Taverne ------
func int Spell_Logic_TeleportTaverne (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportTaverne ()
{
	//B_PrintTeleportTooFarAway (NEWWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NW_TAVERNE_04");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ Do Mysliwych - nasze ------
func int Spell_Logic_TeleportMysliwi (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportMysliwi ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "MYSLIWI");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
// ------ Do Lowcow - nasze ------
func int Spell_Logic_TeleportLowcy (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportLowcy ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "LOWCY");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
// ------ Do Bandytow - nasze ------
func int Spell_Logic_TeleportBandyci (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportBandyci ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "BANDYCI");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ Do Twierdzy - nasze ------
func int Spell_Logic_TeleportTwierdza (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportTwierdza ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "TWIERDZA");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ Ozywieniec - nasze ------
func int Spell_Logic_TeleportOzywieniec (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOzywieniec ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NASZ_OZYWIENIEC_B");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );

};

// ------ Alchemicy - nasze ------
func int Spell_Logic_TeleportAlchemicy (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportAlchemicy ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NASZ_ALCHEMICY");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
	//Npc_RemoveInvItems(self, ItNa_TeleportAlchemicy, 1);
};

// ------ Przelecz - nasze ------
func int Spell_Logic_TeleportPrzelecz (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportPrzelecz ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NASZ_TELEPORTACJA_PRZELECZ");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ Do Rockcamp - nasze ------
func int Spell_Logic_TeleportRockcamp (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportRockcamp ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "SPAWN_GOBBO_LOCATION_29_03");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ Na Bagno - nasze ------
func int Spell_Logic_TeleportBagno (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportBagno ()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NASZ_ZAPALISADA_OB_04");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};


// ******************
// SPL_SummonKurgan		/k4
// ******************

const int SPL_Cost_SummonKurgan		= 10;


INSTANCE Spell_SummonKurgan (C_Spell_Proto)	
{
	time_per_mana			= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonKurgan(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonKurgan)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SPL_SummonKurgan()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonKurgan;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		 //Wld_InsertNpc (NASZ_401_Kurgan, "NASZ_LOWCY_ARENA_01") ;
		 //Kurgan_Przyzwal_Ducha = TRUE;
	}
	else
	{
		 //Wld_InsertNpc (NASZ_401_Kurgan, "NASZ_LOWCY_ARENA_01") ;
		// Kurgan_Przyzwal_Ducha = TRUE;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};




/* ****** SUMMON STRAZNIK ******* */
const int SPL_Cost_SummonStraznik			= 80;


INSTANCE Spell_SummonStraznik (C_Spell_Proto)	
{
	time_per_mana			= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonStraznik(var int manaInvested)
{
	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonStraznik)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonStraznik()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonStraznik;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		if (NPC_GetDistToWP(self,"PLATEAU_ROUND02_CAVE_MOVE") < 3000) {
			Wld_InsertNpc	(NASZ_407_Straznik,Npc_GetNearestWP(self));
		}
		else if (NPC_GetDistToWP(self,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE") < 3000) {
			Wld_InsertNpc	(NASZ_406_Straznik,Npc_GetNearestWP(self));	
		}
		else {
			Createinvitems (self, ItNa_SummonStraznik, 1);	
		};
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};

func int Spell_Logic_TeleportOrcTown (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOrcTown()
{
	//B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "ORCTOWN");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};


// ----- neu 1.21 Verteiler für die Cast-Funcs -------
func void Spell_Cast_Teleport()
{
	if (Npc_GetActiveSpell(self) == SPL_TeleportMysliwi		)	{	Spell_Cast_TeleportMysliwi		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportLowcy		)	{	Spell_Cast_TeleportLowcy		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportBandyci		)	{	Spell_Cast_TeleportBandyci		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOzywieniec	)	{	Spell_Cast_TeleportOzywieniec	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportAlchemicy	)	{	Spell_Cast_TeleportAlchemicy	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportTwierdza	)	{	Spell_Cast_TeleportTwierdza		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportPrzelecz	)	{	Spell_Cast_TeleportPrzelecz		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportRockcamp	)	{	Spell_Cast_TeleportRockcamp		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportBagno		)	{	Spell_Cast_TeleportBagno		(); };
	if (Npc_GetActiveSpell(self) == SPL_Grow				)	{	Spell_Cast_Grow					(); };	
	if (Npc_GetActiveSpell(self) == SPL_SummonKurgan		)	{	Spell_Cast_SPL_SummonKurgan		(); };
	if (Npc_GetActiveSpell(self) == SPL_SummonStraznik		)	{	Spell_Cast_SummonStraznik		(); };


	if (Npc_GetActiveSpell(self) == SPL_PalTeleportSecret	)	{	Spell_Cast_PalTeleportSecret	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportSeaport		)	{	Spell_Cast_TeleportSeaport		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportMonastery	)	{	Spell_Cast_TeleportMonastery	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportFarm		)	{	Spell_Cast_TeleportFarm			(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportXardas		)	{	Spell_Cast_TeleportXardas		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportPassNW		)	{	Spell_Cast_TeleportPassNW		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportPassOW		)	{	Spell_Cast_TeleportPassOW		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOrcTown		)	{	Spell_Cast_TeleportOrcTown		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOC			)	{	Spell_Cast_TeleportOC 			(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOWDemonTower)	{	Spell_Cast_TeleportOWDemonTower (); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportTaverne		)	{	Spell_Cast_TeleportTaverne		(); };
	
	
//	if (Npc_GetActiveSpell(self) == SPL_Teleport_3			)	{	Spell_Cast_XXX					(); };

};






