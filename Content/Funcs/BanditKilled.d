

func int BanditKilled(var int print_alive) {

	var int ammount; ammount = 0;
	var string alives; alives = "";
		
	// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
	if (npc_isdead (NASZ_306_Perrot)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_306_Perrot.id))); };
	
	if (npc_isdead (NASZ_315_Bandzior)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_315_Bandzior.id))); };
	
	if (npc_isdead (NASZ_316_Carry)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_316_Carry.id))); };
	
	if (npc_isdead (NASZ_317_Bandzior)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_317_Bandzior.id))); };
	
	if (npc_isdead (NASZ_318_Gobby)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_318_Gobby.id))); };
	
	if (npc_isdead (NASZ_326_Domenic)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_326_Domenic.id))); };
	
	if (npc_isdead (NASZ_327_Danny)) { ammount += 1; }
	else { alives = ConcatStrings(alives,ConcatStrings(" ",IntToString(NASZ_327_Danny.id))); };
	// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

	if (print_alive == TRUE) { Print(alives); };
	
	return ammount;
};

// ----- ----- ----- ----- -----
// RESET BANDIT ATTACK VARS
var int ResetBanditAttackVar303;
var int ResetBanditAttackVar304;
var int ResetBanditAttackVar305;
var int ResetBanditAttackVar306;
var int ResetBanditAttackVar307;
var int ResetBanditAttackVar308;
var int ResetBanditAttackVar309;
var int ResetBanditAttackVar310;
var int ResetBanditAttackVar311;
var int ResetBanditAttackVar312;
var int ResetBanditAttackVar313;
var int ResetBanditAttackVar314;
var int ResetBanditAttackVar315;
var int ResetBanditAttackVar316;
var int ResetBanditAttackVar317;
var int ResetBanditAttackVar318;
var int ResetBanditAttackVar326;
var int ResetBanditAttackVar327;

var int ResetBanditAttackVar319;
var int ResetBanditAttackVar320;
var int ResetBanditAttackVar321;
var int ResetBanditAttackVar322;
var int ResetBanditAttackVar323;
var int ResetBanditAttackVar324;

// ----- ----- ----- ----- -----

func void ResetBanditAttitude(var C_NPC bandit) {

	bandit.guild = GIL_SLD;
	Npc_SetTrueGuild (bandit, GIL_SLD);

	Npc_SetAttitude(bandit, ATT_NEUTRAL);
	Npc_SetTempAttitude(bandit, ATT_NEUTRAL);
	bandit.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	bandit.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;

};


func void ResetBanditAttack(var C_NPC slf) {

	slf.aivar[AIV_PursuitEnd] = true;
	Npc_ClearAIQueue(slf);
	AI_StandUpQuick(slf);
	
	// PERCEPTIONS	B_ClearPerceptions(slf);
	Npc_PercDisable  	(slf, 	PERC_ASSESSPLAYER		);
	Npc_PercDisable  	(slf, 	PERC_ASSESSENEMY		);
	Npc_PercDisable  	(slf, 	PERC_ASSESSBODY			);
	Npc_PercDisable  	(slf, 	PERC_ASSESSMAGIC		);
	Npc_PercDisable  	(slf,	PERC_ASSESSDAMAGE		);
	Npc_PercDisable  	(slf, 	PERC_ASSESSMURDER		);
	Npc_PercDisable  	(slf, 	PERC_ASSESSTHEFT		);
	Npc_PercDisable  	(slf,	PERC_ASSESSUSEMOB		);
	Npc_PercDisable  	(slf,	PERC_ASSESSENTERROOM	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSTHREAT		);
	Npc_PercDisable  	(slf,	PERC_DRAWWEAPON			);
	Npc_PercDisable  	(slf, 	PERC_ASSESSFIGHTSOUND	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSQUIETSOUND	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSWARN			);
	Npc_PercDisable  	(slf, 	PERC_ASSESSTALK			);
	Npc_PercDisable  	(slf, 	PERC_MOVEMOB			);
	Npc_PercDisable  	(slf, 	PERC_ASSESSOTHERSDAMAGE	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSSTOPMAGIC	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSSURPRISE		);


};

// ret TRUE iif end loop
// ret FALSE iif dn't end loop
func int CheckBanditsVar(var C_NPC slf) {

	if (slf.id == 303 && ResetBanditAttackVar303) { ResetBanditAttackVar303 = FALSE; ResetBanditAttack(NASZ_303_Nod); return TRUE; };
	if (slf.id == 304 && ResetBanditAttackVar304) { ResetBanditAttackVar304 = FALSE; ResetBanditAttack(NASZ_304_Bam); return TRUE; };
	if (slf.id == 305 && ResetBanditAttackVar305) { ResetBanditAttackVar305 = FALSE; ResetBanditAttack(NASZ_305_Rabon); return TRUE; };
	if (slf.id == 306 && ResetBanditAttackVar306) { ResetBanditAttackVar306 = FALSE; ResetBanditAttack(NASZ_306_Perrot); return TRUE; };
	if (slf.id == 307 && ResetBanditAttackVar307) { ResetBanditAttackVar307 = FALSE; ResetBanditAttack(NASZ_307_Monk); return TRUE; };
	if (slf.id == 308 && ResetBanditAttackVar308) { ResetBanditAttackVar308 = FALSE; ResetBanditAttack(NASZ_308_Frut); return TRUE; };
	if (slf.id == 309 && ResetBanditAttackVar309) { ResetBanditAttackVar309 = FALSE; ResetBanditAttack(NASZ_309_Straznik); return TRUE; };
	if (slf.id == 310 && ResetBanditAttackVar310) { ResetBanditAttackVar310 = FALSE; ResetBanditAttack(NASZ_310_Bandzior); return TRUE; };
	if (slf.id == 311 && ResetBanditAttackVar311) { ResetBanditAttackVar311 = FALSE; ResetBanditAttack(NASZ_311_Bandzior); return TRUE; };
	if (slf.id == 312 && ResetBanditAttackVar312) { ResetBanditAttackVar312 = FALSE; ResetBanditAttack(NASZ_312_Bandzior); return TRUE; };
	if (slf.id == 313 && ResetBanditAttackVar313) { ResetBanditAttackVar313 = FALSE; ResetBanditAttack(NASZ_313_Bandzior); return TRUE; };
	if (slf.id == 314 && ResetBanditAttackVar314) { ResetBanditAttackVar314 = FALSE; ResetBanditAttack(NASZ_314_Bandzior); return TRUE; };
	if (slf.id == 315 && ResetBanditAttackVar315) { ResetBanditAttackVar315 = FALSE; ResetBanditAttack(NASZ_315_Bandzior); return TRUE; };
	if (slf.id == 316 && ResetBanditAttackVar316) { ResetBanditAttackVar316 = FALSE; ResetBanditAttack(NASZ_316_Carry); return TRUE; };
	if (slf.id == 317 && ResetBanditAttackVar317) { ResetBanditAttackVar317 = FALSE; ResetBanditAttack(NASZ_317_Bandzior); return TRUE; };
	if (slf.id == 318 && ResetBanditAttackVar318) { ResetBanditAttackVar318 = FALSE; ResetBanditAttack(NASZ_318_Gobby); return TRUE; };
	if (slf.id == 326 && ResetBanditAttackVar326) { ResetBanditAttackVar326 = FALSE; ResetBanditAttack(NASZ_326_Domenic); return TRUE; };
	if (slf.id == 327 && ResetBanditAttackVar327) { ResetBanditAttackVar327 = FALSE; ResetBanditAttack(NASZ_327_Danny); return TRUE; };

	if (slf.id == 319 && ResetBanditAttackVar319) { ResetBanditAttackVar319 = FALSE; ResetBanditAttack(NASZ_319_Niewolnik); return TRUE; };
	if (slf.id == 320 && ResetBanditAttackVar320) { ResetBanditAttackVar320 = FALSE; ResetBanditAttack(NASZ_320_Niewolnik); return TRUE; };
	if (slf.id == 321 && ResetBanditAttackVar321) { ResetBanditAttackVar321 = FALSE; ResetBanditAttack(NASZ_321_Niewolnik); return TRUE; };
	if (slf.id == 322 && ResetBanditAttackVar322) { ResetBanditAttackVar322 = FALSE; ResetBanditAttack(NASZ_322_Niewolnik); return TRUE; };
	if (slf.id == 323 && ResetBanditAttackVar323) { ResetBanditAttackVar323 = FALSE; ResetBanditAttack(NASZ_323_Niewolnik); return TRUE; };
	if (slf.id == 324 && ResetBanditAttackVar324) { ResetBanditAttackVar324 = FALSE; ResetBanditAttack(NASZ_324_Niewolnik); return TRUE; };

	return FALSE;
};

// funkcja do resetowania nastawienia bandytow, jesli cie juz gdzies widzieli i atakuja
// -> wywoluje ja Gestath, gdy posyla cie do Noda, mozna wywolac tez u NASZ_999_Test
func void ResetBanditsAttitude() {

	ResetBanditAttackVar303 = TRUE;
	ResetBanditAttackVar304 = TRUE;
	ResetBanditAttackVar305 = TRUE;
	ResetBanditAttackVar306 = TRUE;
	ResetBanditAttackVar307 = TRUE;
	ResetBanditAttackVar308 = TRUE;
	ResetBanditAttackVar309 = TRUE;
	ResetBanditAttackVar310 = TRUE;
	ResetBanditAttackVar311 = TRUE;
	ResetBanditAttackVar312 = TRUE;
	ResetBanditAttackVar313 = TRUE;
	ResetBanditAttackVar314 = TRUE;
	ResetBanditAttackVar315 = TRUE;
	ResetBanditAttackVar316 = TRUE;
	ResetBanditAttackVar317 = TRUE;
	ResetBanditAttackVar318 = TRUE;
	ResetBanditAttackVar326 = TRUE;
	ResetBanditAttackVar327 = TRUE;
	
	ResetBanditAttackVar319 = TRUE;
	ResetBanditAttackVar320 = TRUE;
	ResetBanditAttackVar321 = TRUE;
	ResetBanditAttackVar322 = TRUE;
	ResetBanditAttackVar323 = TRUE;
	ResetBanditAttackVar324 = TRUE;
	
	ResetBanditAttitude(NASZ_303_Nod);
	ResetBanditAttitude(NASZ_304_Bam);
	ResetBanditAttitude(NASZ_305_Rabon);
	ResetBanditAttitude(NASZ_306_Perrot);
	ResetBanditAttitude(NASZ_307_Monk);
	ResetBanditAttitude(NASZ_308_Frut);
	ResetBanditAttitude(NASZ_309_Straznik);
	ResetBanditAttitude(NASZ_310_Bandzior);
	ResetBanditAttitude(NASZ_311_Bandzior);
	ResetBanditAttitude(NASZ_312_Bandzior);
	ResetBanditAttitude(NASZ_313_Bandzior);
	ResetBanditAttitude(NASZ_314_Bandzior);
	ResetBanditAttitude(NASZ_315_Bandzior);
	ResetBanditAttitude(NASZ_316_Carry);
	ResetBanditAttitude(NASZ_317_Bandzior);
	ResetBanditAttitude(NASZ_318_Gobby);
	ResetBanditAttitude(NASZ_326_Domenic);
	ResetBanditAttitude(NASZ_327_Danny);
	
	ResetBanditAttitude(NASZ_319_Niewolnik);
	ResetBanditAttitude(NASZ_320_Niewolnik);
	ResetBanditAttitude(NASZ_321_Niewolnik);
	ResetBanditAttitude(NASZ_322_Niewolnik);
	ResetBanditAttitude(NASZ_323_Niewolnik);
	ResetBanditAttitude(NASZ_324_Niewolnik);
	
};
