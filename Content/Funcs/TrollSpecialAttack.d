// Troll special attack, ketrab
// > hero trafil trolla
// > jesli przez 3s troll nie jest w stanie trafic hero, to robi bum w ziemie

var int activeTrollPtr;   // ten, ktory zaczal robic special attack
var int invokingTrollPtr; // ten, ktory przez 2s czeka na zaczecie funkcji special attack (ostatnio uderzony przez hero)

var int trollSpecialAttackSec;
var int trollSpecialAttackInvokeSec;

// ----- ----- FUNC ----- -----
func void TrollSpecialAttack_Start(var int trollPtr) {
	if (activeTrollPtr != trollPtr) {
		activeTrollPtr = trollPtr;
		trollSpecialAttackSec = 0; // restart
		ff_applyonceext(TrollSpecialAttack_Loop,1000,-1);
	};
};
func void TrollSpecialAttack_End() {
	activeTrollPtr = 0;
	trollSpecialAttackSec = 0;
	ff_remove(TrollSpecialAttack_Loop);
};
func void TrollSpecialAttack_Loop() {

	// EXIT IF NULL OR DEAD
	if (!activeTrollPtr) {
		TrollSpecialAttack_End();
	};
	
	var c_npc trl; trl = MEM_PtrToInst(activeTrollPtr);
	if (npc_isdead(trl)) {
		TrollSpecialAttack_End();
	};
	

	// --- FUNC ---

	// play ani
	if (trollSpecialAttackSec == 0) {

		Npc_ClearAIQueue(trl);
		AI_PlayAni(trl,"T_WARN");

	}
	
	// bum
	else if (trollSpecialAttackSec == 3) {
		
		Wld_PlayEffect("FX_EarthQuake", trl, trl, 0, 0, 0, FALSE );
		Snd_Play("PILLAR_MOVE");
		// dist < 10m -> damage
		if (Npc_GetDistToNpc(hero,trl) < 1000) {
			Npc_ClearAIQueue(hero);
			StartFlyDamage (hero, 400, 80, 50, 10);
			//var int hp; hp = hero.attribute[ATR_HITPOINTS];
			hero.attribute[ATR_HITPOINTS] -= 100;
		};
		
		TrollSpecialAttack_End();
	};

	// timer incrementation
	trollSpecialAttackSec += 1;

};


// ----- ----- INVOKE ----- -----
func void BeginInvoke_TrollSpecialAttack(var int trollPtr) {
	if (trollPtr != invokingTrollPtr) {
		invokingTrollPtr = trollPtr;
		trollSpecialAttackInvokeSec = 0;
		ff_applyonceext(InvokingLoop_TrollSpecialAttack,1000,-1);
	};
};

func void EndInvoke_TrollSpecialAttack() {
	invokingTrollPtr = 0;
	ff_remove(InvokingLoop_TrollSpecialAttack);
};


func void InvokingLoop_TrollSpecialAttack() {

	if (!invokingTrollPtr) { EndInvoke_TrollSpecialAttack(); };
	var c_npc trl; trl = MEM_PtrToInst(invokingTrollPtr);

	if (trollSpecialAttackInvokeSec >= 3 && !AniIsActive(trl, "S_FISTATTACK")) {
		TrollSpecialAttack_Start(invokingTrollPtr);
		EndInvoke_TrollSpecialAttack();	
	};

	trollSpecialAttackInvokeSec += 1;
};


