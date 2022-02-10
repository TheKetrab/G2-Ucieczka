
const string LEARN_1H = "Broñ jednorêczna";
const string LEARN_2H = "Broñ dwurêczna";
const string LEARN_BOW = "£uki";
const string LEARN_CBOW = "Kusze";
const string LEARN_STR = "Si³a";
const string LEARN_DEX = "Zrêcznoœæ";
const string LEARN_MANA = "Mana";

// ----- 1h -----
const int LEARN_1H_NORMAL_LP   = 1;
const int LEARN_1H_NORMAL_GOLD = 5;
const int LEARN_1H_COEF_00     = 1;
const int LEARN_1H_COEF_25     = 1;
const int LEARN_1H_COEF_50     = 2;
const int LEARN_1H_COEF_75     = 2;

// ----- 2h -----
const int LEARN_2H_NORMAL_LP   = 1;
const int LEARN_2H_NORMAL_GOLD = 5;
const int LEARN_2H_COEF_00     = 1;
const int LEARN_2H_COEF_25     = 1;
const int LEARN_2H_COEF_50     = 2;
const int LEARN_2H_COEF_75     = 2;

// ----- Bow -----
const int LEARN_BOW_NORMAL_LP   = 1;
const int LEARN_BOW_NORMAL_GOLD = 5;
const int LEARN_BOW_COEF_00     = 1;
const int LEARN_BOW_COEF_25     = 1;
const int LEARN_BOW_COEF_50     = 2;
const int LEARN_BOW_COEF_75     = 2;

// ----- CBow -----
const int LEARN_CBOW_NORMAL_LP   = 1;
const int LEARN_CBOW_NORMAL_GOLD = 5;
const int LEARN_CBOW_COEF_00     = 1;
const int LEARN_CBOW_COEF_25     = 1;
const int LEARN_CBOW_COEF_50     = 2;
const int LEARN_CBOW_COEF_75     = 2;

// ----- STR -----
const int LEARN_STR_NORMAL_LP   = 1;
const int LEARN_STR_NORMAL_GOLD = 5;
const int LEARN_STR_COEF_00     = 1;
const int LEARN_STR_COEF_25     = 1;
const int LEARN_STR_COEF_50     = 2;
const int LEARN_STR_COEF_75     = 2;

// ----- DEX -----
const int LEARN_DEX_NORMAL_LP   = 1;
const int LEARN_DEX_NORMAL_GOLD = 5;
const int LEARN_DEX_COEF_00     = 1;
const int LEARN_DEX_COEF_25     = 1;
const int LEARN_DEX_COEF_50     = 2;
const int LEARN_DEX_COEF_75     = 2;

// ----- MANA -----
const int LEARN_MANA_NORMAL_LP   = 1;
const int LEARN_MANA_NORMAL_GOLD = 5;
const int LEARN_MANA_COEF_00     = 1;
const int LEARN_MANA_COEF_25     = 1;
const int LEARN_MANA_COEF_50     = 2;
const int LEARN_MANA_COEF_75     = 2;

func string GetTalentNameByAttribute(var int attribute) {

	if      (attribute == ATR_STRENGTH)  { return LEARN_STR;  }
	else if (attribute == ATR_DEXTERITY) { return LEARN_DEX;  }
	else if (attribute == ATR_MANA_MAX)  { return LEARN_MANA; }
	else                                 { return "";         };

};

func string GetTalentNameByFightTalent(var int fight_talent) {

	if      (fight_talent == NPC_TALENT_1H)       { return LEARN_1H;   }
	else if (fight_talent == NPC_TALENT_2H)       { return LEARN_2H;   }
	else if (fight_talent == NPC_TALENT_BOW)      { return LEARN_BOW;  }
	else if (fight_talent == NPC_TALENT_CROSSBOW) { return LEARN_CBOW; }
	else                                          { return "";         };

};

func int GetCostBySkillAndCoef(var string talent, var int part) {

	if (Hlp_StrCmp(talent, LEARN_1H)) {
		if (part == 0) { return LEARN_1H_NORMAL_LP * LEARN_1H_COEF_00; };
		if (part == 1) { return LEARN_1H_NORMAL_LP * LEARN_1H_COEF_25; };
		if (part == 2) { return LEARN_1H_NORMAL_LP * LEARN_1H_COEF_50; };
		if (part == 3) { return LEARN_1H_NORMAL_LP * LEARN_1H_COEF_75; };	
	}
	
	else if (Hlp_StrCmp(talent, LEARN_2H)) {
	
		if (part == 0) { return LEARN_2H_NORMAL_LP * LEARN_2H_COEF_00; };
		if (part == 1) { return LEARN_2H_NORMAL_LP * LEARN_2H_COEF_25; };
		if (part == 2) { return LEARN_2H_NORMAL_LP * LEARN_2H_COEF_50; };
		if (part == 3) { return LEARN_2H_NORMAL_LP * LEARN_2H_COEF_75; };		
	}

	else if (Hlp_StrCmp(talent, LEARN_BOW)) {
	
		if (part == 0) { return LEARN_BOW_NORMAL_LP * LEARN_BOW_COEF_00; };
		if (part == 1) { return LEARN_BOW_NORMAL_LP * LEARN_BOW_COEF_25; };
		if (part == 2) { return LEARN_BOW_NORMAL_LP * LEARN_BOW_COEF_50; };
		if (part == 3) { return LEARN_BOW_NORMAL_LP * LEARN_BOW_COEF_75; };		
	}
	
	else if (Hlp_StrCmp(talent, LEARN_CBOW)) {
	
		if (part == 0) { return LEARN_CBOW_NORMAL_LP * LEARN_CBOW_COEF_00; };
		if (part == 1) { return LEARN_CBOW_NORMAL_LP * LEARN_CBOW_COEF_25; };
		if (part == 2) { return LEARN_CBOW_NORMAL_LP * LEARN_CBOW_COEF_50; };
		if (part == 3) { return LEARN_CBOW_NORMAL_LP * LEARN_CBOW_COEF_75; };		
	}
	
	else if (Hlp_StrCmp(talent, LEARN_STR)) {
	
		if (part == 0) { return LEARN_STR_NORMAL_LP * LEARN_STR_COEF_00; };
		if (part == 1) { return LEARN_STR_NORMAL_LP * LEARN_STR_COEF_25; };
		if (part == 2) { return LEARN_STR_NORMAL_LP * LEARN_STR_COEF_50; };
		if (part == 3) { return LEARN_STR_NORMAL_LP * LEARN_STR_COEF_75; };		
	}
	
	else if (Hlp_StrCmp(talent, LEARN_DEX)) {
	
		if (part == 0) { return LEARN_DEX_NORMAL_LP * LEARN_DEX_COEF_00; };
		if (part == 1) { return LEARN_DEX_NORMAL_LP * LEARN_DEX_COEF_25; };
		if (part == 2) { return LEARN_DEX_NORMAL_LP * LEARN_DEX_COEF_50; };
		if (part == 3) { return LEARN_DEX_NORMAL_LP * LEARN_DEX_COEF_75; };		
	}

	else if (Hlp_StrCmp(talent, LEARN_MANA)) {
	
		if (part == 0) { return LEARN_MANA_NORMAL_LP * LEARN_MANA_COEF_00; };
		if (part == 1) { return LEARN_MANA_NORMAL_LP * LEARN_MANA_COEF_25; };
		if (part == 2) { return LEARN_MANA_NORMAL_LP * LEARN_MANA_COEF_50; };
		if (part == 3) { return LEARN_MANA_NORMAL_LP * LEARN_MANA_COEF_75; };		
	};

	MEM_Error(ConcatStrings("GetCostBySkillAndCoef Error, talent = ",
		ConcatStrings(talent,ConcatStrings(", part = ",IntToString(part)))));

	return 0;
};


func int GetCostBySkillAndCoefGold(var string talent, var int part) {

	// TODO IF part < 0 || > 3 ERROR

	if (Hlp_StrCmp(talent, LEARN_1H)) {
		if (part == 0) { return LEARN_1H_NORMAL_GOLD * LEARN_1H_COEF_00; };
		if (part == 1) { return LEARN_1H_NORMAL_GOLD * LEARN_1H_COEF_25; };
		if (part == 2) { return LEARN_1H_NORMAL_GOLD * LEARN_1H_COEF_50; };
		if (part == 3) { return LEARN_1H_NORMAL_GOLD * LEARN_1H_COEF_75; };	
	}
	
	else if (Hlp_StrCmp(talent, LEARN_2H)) {
	
		if (part == 0) { return LEARN_2H_NORMAL_GOLD * LEARN_2H_COEF_00; };
		if (part == 1) { return LEARN_2H_NORMAL_GOLD * LEARN_2H_COEF_25; };
		if (part == 2) { return LEARN_2H_NORMAL_GOLD * LEARN_2H_COEF_50; };
		if (part == 3) { return LEARN_2H_NORMAL_GOLD * LEARN_2H_COEF_75; };		
	}

	else if (Hlp_StrCmp(talent, LEARN_BOW)) {
	
		if (part == 0) { return LEARN_BOW_NORMAL_GOLD * LEARN_BOW_COEF_00; };
		if (part == 1) { return LEARN_BOW_NORMAL_GOLD * LEARN_BOW_COEF_25; };
		if (part == 2) { return LEARN_BOW_NORMAL_GOLD * LEARN_BOW_COEF_50; };
		if (part == 3) { return LEARN_BOW_NORMAL_GOLD * LEARN_BOW_COEF_75; };		
	}
	
	else if (Hlp_StrCmp(talent, LEARN_CBOW)) {
	
		if (part == 0) { return LEARN_CBOW_NORMAL_GOLD * LEARN_CBOW_COEF_00; };
		if (part == 1) { return LEARN_CBOW_NORMAL_GOLD * LEARN_CBOW_COEF_25; };
		if (part == 2) { return LEARN_CBOW_NORMAL_GOLD * LEARN_CBOW_COEF_50; };
		if (part == 3) { return LEARN_CBOW_NORMAL_GOLD * LEARN_CBOW_COEF_75; };		
	}
	
	else if (Hlp_StrCmp(talent, LEARN_STR)) {
	
		if (part == 0) { return LEARN_STR_NORMAL_GOLD * LEARN_STR_COEF_00; };
		if (part == 1) { return LEARN_STR_NORMAL_GOLD * LEARN_STR_COEF_25; };
		if (part == 2) { return LEARN_STR_NORMAL_GOLD * LEARN_STR_COEF_50; };
		if (part == 3) { return LEARN_STR_NORMAL_GOLD * LEARN_STR_COEF_75; };		
	}
	
	else if (Hlp_StrCmp(talent, LEARN_DEX)) {
	
		if (part == 0) { return LEARN_DEX_NORMAL_GOLD * LEARN_DEX_COEF_00; };
		if (part == 1) { return LEARN_DEX_NORMAL_GOLD * LEARN_DEX_COEF_25; };
		if (part == 2) { return LEARN_DEX_NORMAL_GOLD * LEARN_DEX_COEF_50; };
		if (part == 3) { return LEARN_DEX_NORMAL_GOLD * LEARN_DEX_COEF_75; };		
	}

	else if (Hlp_StrCmp(talent, LEARN_MANA)) {
	
		if (part == 0) { return LEARN_MANA_NORMAL_GOLD * LEARN_MANA_COEF_00; };
		if (part == 1) { return LEARN_MANA_NORMAL_GOLD * LEARN_MANA_COEF_25; };
		if (part == 2) { return LEARN_MANA_NORMAL_GOLD * LEARN_MANA_COEF_50; };
		if (part == 3) { return LEARN_MANA_NORMAL_GOLD * LEARN_MANA_COEF_75; };		
	};

	MEM_Error(ConcatStrings("GetCostBySkillAndCoefGold Error, talent = ",
		ConcatStrings(talent,ConcatStrings(", part = ",IntToString(part)))));

	return 0;
};

// zwraca aktualn¹ wartoœæ danej umiejêtnoœci bez bonusów
func int GetTalentNow(var string talent) {

	if (     Hlp_StrCmp(talent,LEARN_1H))   { return hero.HitChance[NPC_TALENT_1H];       }
	else if (Hlp_StrCmp(talent,LEARN_2H))   { return hero.HitChance[NPC_TALENT_2H];       }
	else if (Hlp_StrCmp(talent,LEARN_BOW))  { return hero.HitChance[NPC_TALENT_BOW];      }
	else if (Hlp_StrCmp(talent,LEARN_CBOW)) { return hero.HitChance[NPC_TALENT_CROSSBOW]; }
	else if (Hlp_StrCmp(talent,LEARN_STR))  { return hero.aivar[REAL_STRENGTH];        }
	else if (Hlp_StrCmp(talent,LEARN_DEX))  { return hero.aivar[REAL_DEXTERITY];       }
	else if (Hlp_StrCmp(talent,LEARN_MANA)) { return hero.aivar[REAL_MANA_MAX];        };

	return 0;
};

// dba o to, ¿eby nie da³o nauczyæ siê wiêcej ni¿ mo¿e nauczyciel (np. 47+5 > 50 => amount = 3)
// jeœli talent > teacher_max, to zwracamy zero - tak jakby NIC siê nie da nauczyæ
func int AlignRequestedAmountToTeacherMax(var string talent, var int amount, var int teacher_max) {

	var int talent_now; talent_now = GetTalentNow(talent);
	return max(0, min(teacher_max - talent_now, amount));

};

// oblicza, do którego przedzia³u trafia talent: 0-25,25-50,50-75,>75
func int CalculateCurrentPart(var int talent_now) {

	if (     talent_now >= 75) { return 3; }
	else if (talent_now >= 50) { return 2; }
	else if (talent_now >= 25) { return 1; }
	else                       { return 0; };

};

// oblicza rzeczywist¹ wartoœæ potrzebnych punktów nauki
func int CalculateLearnLPCost(var string talent, var int amount, var int teacher_max) {

	amount = AlignRequestedAmountToTeacherMax(talent, amount, teacher_max);
	
	var int talent_now; talent_now = GetTalentNow(talent);
	var int part; part = CalculateCurrentPart(talent_now);
	// UWAGA: zak³adamy, ¿e nie da siê przeskoczyæ o wiêcej ni¿ 1 przedzia³!
	
	var int real_cost;
	var int talent_after; talent_after = talent_now + amount;
		
	if (part == 3) {
	
		real_cost =	(talent_after - talent_now) * GetCostBySkillAndCoef(talent,3);
	
	}
	
	else if (part == 2) {
	
		real_cost =
			(min(75, talent_after) - talent_now) * GetCostBySkillAndCoef(talent,2)
			+ (max(75, talent_after) - 75) * GetCostBySkillAndCoef(talent,3);
	
	}
		
	else if (part == 1) {
	
		real_cost =
			(min(50, talent_after) - talent_now) * GetCostBySkillAndCoef(talent,1)
			+ (max(50, talent_after) - 50) * GetCostBySkillAndCoef(talent,2);	
	
	}
	
	else if (part == 0) {
	
		real_cost =
			(min(25, talent_after) - talent_now) * GetCostBySkillAndCoef(talent,0)
			+ (max(25, talent_after) - 25) * GetCostBySkillAndCoef(talent,1);	
	
	};
	
	return real_cost;
		
};

// oblicza rzeczywist¹ wartoœæ potrzebnego z³ota
func int CalculateLearnGoldCost(var string talent, var int amount, var int teacher_max) {

	amount = AlignRequestedAmountToTeacherMax(talent, amount, teacher_max);
	
	var int talent_now; talent_now = GetTalentNow(talent);
	var int part; part = CalculateCurrentPart(talent_now);
	// UWAGA: zak³adamy, ¿e nie da siê przeskoczyæ o wiêcej ni¿ 1 przedzia³!
		
	var int real_cost;
	var int talent_after; talent_after = talent_now + amount;
	
	if (part == 3) {
	
		real_cost =	(talent_after - talent_now) * GetCostBySkillAndCoefGold(talent,3);
	
	}
	
	else if (part == 2) {
	
		real_cost =
			(min(75, talent_after) - talent_now) * GetCostBySkillAndCoefGold(talent,2)
			+ (max(75, talent_after) - 75) * GetCostBySkillAndCoefGold(talent,3);
	
	}
		
	else if (part == 1) {
	
		real_cost =
			(min(50, talent_after) - talent_now) * GetCostBySkillAndCoefGold(talent,1)
			+ (max(50, talent_after) - 50) * GetCostBySkillAndCoefGold(talent,2);	
	
	}
	
	else if (part == 0) {
	
		real_cost =
			(min(25, talent_after) - talent_now) * GetCostBySkillAndCoefGold(talent,0)
			+ (max(25, talent_after) - 25) * GetCostBySkillAndCoefGold(talent,1);	
	
	};
	
	return real_cost;

};

// buduje description wyœwietlany przy nauce
func string BuildLearnString(var string talent, var int amount, var int teacher_max) {

	var string str; str = talent;
	str = ConcatStrings(str," + ");

	amount = AlignRequestedAmountToTeacherMax(talent, amount, teacher_max);
	str = ConcatStrings(str, IntToString(amount));
	str = ConcatStrings(str,". (");
	
	var int costLP; costLP = CalculateLearnLPCost(talent,amount,teacher_max);
	str = ConcatStrings(str, IntToString(costLP));
	str = ConcatStrings(str, " PN, ");
	
	var int costGold; costGold = CalculateLearnGoldCost(talent,amount,teacher_max);
	str = ConcatStrings(str, IntToString(costGold));
	str = ConcatStrings(str, " szt. z³ota)");
	
	return str;
};
