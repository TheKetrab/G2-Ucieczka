// *********************
// Alle Transform Spells
// *********************

const int SPL_Cost_TrfSheep			= 10; // nasz swampdrone
const int SPL_Cost_TrfScavenger		= 10;
const int SPL_Cost_TrfGiantRat		= 10; // nasz stonegolem
const int SPL_Cost_TrfGiantBug		= 10; // nasz meatbug
const int SPL_Cost_TrfWolf			= 10;
const int SPL_Cost_TrfWaran			= 10;
const int SPL_Cost_TrfSnapper		= 10;
const int SPL_Cost_TrfWarg			= 10;
const int SPL_Cost_TrfFireWaran		= 10;
const int SPL_Cost_TrfLurker		= 10;
const int SPL_Cost_TrfShadowbeast	= 10;
const int SPL_Cost_TrfDragonSnapper	= 10;
const int SPL_Cost_TrfMeatbug		= 10;

var int TrfSheepUsed;
var int TrfScavengerUsed;
var int TrfGiantRatUsed;
var int TrfGiantBugUsed;
var int TrfWolfUsed
var int TrfWaranUsed;
var int TrfSnapperUsed;
var int TrfWargUsed;
var int TrfFireWaranUsed;
var int TrfLurkerUsed;
var int TrfShadowbeastUsed;
var int TrfDragonSnapperUsed;
var int TrfMeatbugUsed;


// ------ Instanz für alle Transform-Sprüche ------
INSTANCE Spell_Transform (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	canTurnDuringInvest		= 0;
};

// ------ Schaf ------
func int Spell_Logic_TrfSheep (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfSheep)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSheep;
		
		if (Npc_IsPlayer(self) && !TrfSheepUsed) {
			TrfSheepUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, SwampDrone);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Scavenger ------
func int Spell_Logic_TrfScavenger (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfScavenger)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfScavenger;
		
		if (Npc_IsPlayer(self) && !TrfScavengerUsed) {
			TrfScavengerUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, Scavenger);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Giant Rat ------
func int Spell_Logic_TrfGiantRat (var int manaInvested) // stonegolem
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantRat)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantRat;
		
		if (Npc_IsPlayer(self) && !TrfGiantRatUsed) {
			TrfGiantRatUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, StoneGolem);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};


// ------ Giant BUG ------
func int Spell_Logic_TrfGiantBug (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantBug)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantBug;
		
		if (Npc_IsPlayer(self) && !TrfGiantBugUsed) {
			TrfGiantBugUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		if (WillWantToKillRenegats == TRUE) {
			WillUzylPrzemianyWChrzaszcza = TRUE;
		};
		
		Npc_SetActiveSpellInfo(self, Meatbug);
		HeroIsMeatbug = TRUE;
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Wolf ------
func int Spell_Logic_TrfWolf (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWolf)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWolf;
		
		if (Npc_IsPlayer(self) && !TrfWolfUsed) {
			TrfWolfUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, Wolf);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Waran ------
func int Spell_Logic_TrfWaran (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWaran)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWaran;
		
		if (Npc_IsPlayer(self) && !TrfWaranUsed) {
			TrfWaranUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, Waran);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Snapper ------
func int Spell_Logic_TrfSnapper (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfSnapper)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSnapper;
		
		if (Npc_IsPlayer(self) && !TrfSnapperUsed) {
			TrfSnapperUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, Snapper);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Warg ------
func int Spell_Logic_TrfWarg (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWarg)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWarg;
		
		if (Npc_IsPlayer(self) && !TrfWargUsed) {
			TrfWargUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, Warg);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Feuerwaran ------
func int Spell_Logic_TrfFireWaran (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfFireWaran)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfFireWaran;
		
		if (Npc_IsPlayer(self) && !TrfFireWaranUsed) {
			TrfFireWaranUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, FireWaran);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Lurker ------
func int Spell_Logic_TrfLurker (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfLurker)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfLurker;
		
		if (Npc_IsPlayer(self) && !TrfLurkerUsed) {
			TrfLurkerUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, Lurker);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Meatbug ------
func int Spell_Logic_TrfShadowbeast (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfShadowbeast)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfShadowbeast;
		
		if (Npc_IsPlayer(self) && !TrfMeatbugUsed) {
			TrfMeatbugUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, Shadowbeast);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Dragon Snapper ------
func int Spell_Logic_TrfDragonSnapper (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfDragonSnapper)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfDragonSnapper;
			
		if (Npc_IsPlayer(self) && !TrfDragonSnapperUsed) {
			TrfDragonSnapperUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
		Npc_SetActiveSpellInfo(self, DragonSnapper);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};
