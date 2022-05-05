// ***********************************************************************************************************************
// 	  	DIA_NASZ_453_UrShak_EXIT
// ***********************************************************************************************************************

INSTANCE DIA_NASZ_453_UrShak_EXIT(C_INFO)
{
	npc		= NASZ_453_UrShak;
	nr		= 999;
	condition	= DIA_NASZ_453_UrShak_EXIT_Condition;
	information	= DIA_NASZ_453_UrShak_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_NASZ_453_UrShak_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NASZ_453_UrShak_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};


var int UrShakRegeneracja;
var int UrShakBattleIterator;
var int UrShakBattleRandom;
var int UrShakBattleRandomOrc;
var int UrShakBattlePart;


func void B_SetVisuals_OrcShaman_URSHAK()
{
	Mdl_SetVisualBody		(NASZ_453_UrShak,	"Orc_BodyShaman",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_OrcShamanStone_URSHAK()
{
	// UWAGA - glowa musi pozostac taka sama, bo inaczej sie buguje
	Mdl_SetVisualBody		(NASZ_453_UrShak,	"Orc_BodyShamanStone",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};


// UR SHAK --> 400hp
// 50% --> 80% = 200hp --> 320hp
// 20% --> 50% = 80hp --> 200hp
//Ucieczka 1.2
func int ClampHeroDamageToUrshak(var c_npc urshak, var int dmg)
{
	var int minHp; 
	if(UrShakBattlePart == 1)
	{
		minHp = 200;
	}
	else if(UrShakBattlePart == 2)
	{
		minHp = 80;
	}
	else
	{
		//nie b�dzie ju� regeneracji, wi�c zadaj pe�ne dmg
		return dmg;
	};
	
	if(urshak.attribute[ATR_HITPOINTS] - dmg <= minHp )
	{
		
		if(urshak.attribute[ATR_HITPOINTS] > minHp)
		{
			return urshak.attribute[ATR_HITPOINTS] - minHp;
		};
		
		//to nie powinno si� sta�, ale na wszelki wypadek nie zadawaj hp
		return 0;
	};
	
	return dmg;
};

func void ZabijOrkow(var c_npc slf)
{
    if(slf.guild==GIL_ORC || slf.guild == GIL_UNDEADORC)
    {
		B_KillNpc(slf);
	};
};

//Ucieczka 1.2
const int UrshakValidSpawnPoints_Max = 11;

const string Urshak_WP_Prefix = "OW_ROCKDRAGON_";

const string UrshakValidSpawnPointsPostfixs[UrshakValidSpawnPoints_Max] = 
{
	"04","05","06","11","16","17","18","19","20","21","22"
};

func string GetNearestUrshakSpawnPoint()
{
	var string currWp; 
	var string nearestWp;
	
	var int currDist; 
	var int nearestDist; nearestDist = -1;
	var int i;
	
	repeat(i,UrshakValidSpawnPoints_Max);
		
		currWp = CS(Urshak_WP_Prefix, MEM_ReadStatStringArr(UrshakValidSpawnPointsPostfixs,i));
		currDist = Npc_GetDistToWp(hero,currWp);

		if(nearestDist == -1 || nearestDist > currDist)
		{
			nearestDist = currDist;
			nearestWp = currWp;
		};
		
	end;
	
	return nearestWp;
};

func int CompareUrshakSpawnPoint(var string wp)
{
	var zString zStr; zStr = _^(_@s(wp));
	
	var int i;
	
	repeat(i,UrshakValidSpawnPoints_Max);
		
		var zString point; point = _^(_@s(MEM_ReadStatStringArr(UrshakValidSpawnPointsPostfixs,i)));
		
		var int pointLen; pointLen = point.len;
		var int startPos; startPos = zStr.ptr + zSTR.len - pointLen;
		
		if(MEM_CompareBytes(startPos,point.ptr,pointLen))
		{
			return 1;
		};		
		
	end;
	
	
	return 0;
};

func void SpawnUrshakOrcs()
{
	var string wp; wp = Npc_GetNearestWp(hero);
	
	if(!CompareUrshakSpawnPoint(wp))
	{
		wp = GetNearestUrshakSpawnPoint();
	};
	
	Wld_InsertNpc	(OrcNewShaman,wp);
	Wld_InsertNpc	(OrcNewHeavy,wp);

};

//wywo�ane w ZS_MM_AllScheduler dla OrcNewShaman i OrcNewHeavy
func void SpawnedOrcForceAttack()
{
	Npc_SetTarget		(self, hero);
	if(!Npc_IsInState(self,ZS_MM_Attack))
	{
		AI_StandupQuick(self);
		AI_ReadyMeleeWeapon(self);
		AI_TurnToNPC(self,hero);
		AI_GotoNpc(self,hero);
		AI_StartState		(self, ZS_MM_Attack, 0, "");
	};
};



//Funkcja wywo�uje si�, gdy podczas ko�ca regeneracji jeste�my w fight range lub celujemy w niego
//Dzi�ki temu ma nie dostawa� dmg zanim wyci�gnie bro�
func void CheckTooCloseDistToUrshak()
{	
	var c_npc ur; ur = Hlp_GetNpc(NASZ_453_UrShak);
	
	if(!Hlp_IsValidNpc(ur)){return;};
	
	if(Npc_IsInFightRange(hero,NASZ_453_UrShak) || Npc_IsAiming(hero,ur))
	{
		//ai_wait przeciwdzia�a walni�ciu hita podczas otrzymywania fly dmg
		AI_Wait(hero,1);
		
		StartFlyDamage (hero, 5, 10, 5, 10);
	};

};


func void UrShakRegenerationFunc1() {

	if (NASZ_453_UrShak.attribute[0] >= 320) {
		ff_remove(UrShakRegenerationFunc1);
		UrShakRegeneracja = FALSE;
		B_SetVisuals_OrcShaman_URSHAK();
		UrShakBattlePart = 2;
		
		NASZ_453_UrShak.flags = 0;

		Npc_ClearAIQueue	(NASZ_453_UrShak);
		Npc_SetTarget		(NASZ_453_UrShak, hero);
		B_ClearPerceptions	(NASZ_453_UrShak);
		AI_StartState		(NASZ_453_UrShak, ZS_MM_Attack, 0, "");
				
		SpawnUrshakOrcs();
		
		//Wld_InsertNpc	(OrcNewShaman,"OW_ROCKDRAGON_11");
		//Wld_InsertNpc	(OrcNewHeavy,"OW_ROCKDRAGON_11");
		CheckTooCloseDistToUrshak();
		
		return;



	};
	AI_Wait(NASZ_453_UrShak,2);
	NASZ_453_UrShak.attribute[0] += 6; // 120hp / 6hp = 20 sekund
};

func void UrShakRegenerationFunc2() {

	// EXIT
	if (NASZ_453_UrShak.attribute[0] >= 200) {
		ff_remove(UrShakRegenerationFunc2);
		UrShakRegeneracja = FALSE;
		B_SetVisuals_OrcShaman_URSHAK();
		UrShakBattlePart = 3;
		
		NASZ_453_UrShak.flags = 0;
		
		Npc_ClearAIQueue	(NASZ_453_UrShak);
		Npc_SetTarget		(NASZ_453_UrShak, hero);
		B_ClearPerceptions	(NASZ_453_UrShak);
		AI_StartState		(NASZ_453_UrShak, ZS_MM_Attack, 0, "");
		
		//Wld_InsertNpc	(OrcNewShaman,"OW_ROCKDRAGON_11");
		//Wld_InsertNpc	(OrcNewHeavy,"OW_ROCKDRAGON_11");
		SpawnUrshakOrcs();
		CheckTooCloseDistToUrshak();
		
		return;

	};
	
	AI_Wait(NASZ_453_UrShak,2);
	NASZ_453_UrShak.attribute[0] += 6; // 120hp / 6hp = 20 sekund
};

// FIX UCIECZKA 1.1 - odswiezylem to, zeby bylo tak, jak mialo byc

// funckja wywolywana 1 raz na sekunde
func void UrshakBattle()
{
	var c_npc ur; ur = Hlp_GetNpc(NASZ_453_UrShak);
	
	if(!Npc_IsInState(ur,ZS_MM_ATTACK) && hero.attribute[0] > 0 && InfoManager_HasFinished() && !Npc_IsDead(ur) && UrShakRegeneracja == false)
	{
		var c_npc slfBack; slfBack = Hlp_GetNpc(self);
		self = Hlp_GetNpc(ur);
		SpawnedOrcForceAttack();
		
		self = Hlp_GetNpc(slfBack);
	};

	//Print(CS("Part: ",IntToString(UrShakBattlePart)));
	if (D3D11_enabled) 
	{
		//Print 5 razy co sekund� przez ca�e w��czenie gry
		//nie ma co tego zapisywa�
		const int static_printCnt = 5;
		if(static_printCnt > 0)
		{
			PrintS("Je�eli masz problemy graficzne, to wy��cz dx11 podczas walki.");
			static_printCnt-=1;
		};
	};
	
	// po zabiciu urshaka: EXIT
	if (Npc_IsDead(NASZ_453_UrShak)) { 
		DoForSphere(ZabijOrkow);
		ff_remove(UrshakBattle);
	};
	
	// 50% hp -> renegeracja do 80%
	if (UrShakBattlePart == 1
	 && NASZ_453_UrShak.attribute[0] <= 200 
	 && !UrShakRegeneracja)
	{
		B_SetVisuals_OrcShamanStone_URSHAK();
		//Wld_InsertNpc	(OrcNewShaman,"OW_ROCKDRAGON_11");
		//Wld_InsertNpc	(OrcNewHeavy,"OW_ROCKDRAGON_11");
		SpawnUrshakOrcs();

		UrShakRegeneracja = true;
		B_ClearPerceptions(NASZ_453_UrShak);
		B_ResetAll (NASZ_453_UrShak);

		Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",  ur, ur, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  ur, ur, 0, 0, 0, FALSE );
		
		NASZ_453_UrShak.flags = 2;
		ff_applyonceext(UrShakRegenerationFunc1,1000,-1);
		
	};
	
	// 20% hp -> renegeracja do 50%
	if (UrShakBattlePart == 2
	 && NASZ_453_UrShak.attribute[0] <= 80 
	 && !UrShakRegeneracja)
	{
		B_SetVisuals_OrcShamanStone_URSHAK();
		//Wld_InsertNpc	(OrcNewShaman,"OW_ROCKDRAGON_11");
		//Wld_InsertNpc	(OrcNewHeavy,"OW_ROCKDRAGON_11");
		SpawnUrshakOrcs();

		UrShakRegeneracja = true;
		B_ClearPerceptions(NASZ_453_UrShak);
		B_ResetAll (NASZ_453_UrShak);

		Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",  ur, ur, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  ur, ur, 0, 0, 0, FALSE );
		
		NASZ_453_UrShak.flags = 2;
		ff_applyonceext(UrShakRegenerationFunc2,1000,-1);
	};	
	
	// 20% hp -> regeneracja do 50%
	if (UrShakBattlePart == 2
	 &&    UrShakRegeneracja && NASZ_453_UrShak.attribute[0] <=  160  && !UrShakBattleIterator)
	{
		UrShakBattleIterator += 1;
		
	};
};

func void UrshakEndDialog()
{
	self.guild							=	GIL_ORC;
	Npc_SetTrueGuild (self, GIL_ORC);
	self.start_aistate				= ZS_MM_AllScheduler;
	self.aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
	B_StartOtherRoutine (self,"");
	B_Attack (NASZ_453_UrShak, hero, AR_KILL, 0);
	//AI_StartState 		(self, ZS_MM_AllScheduler, 0, "");
	AI_Teleport(NASZ_453_UrShak,"OW_ROCKDRAGON_06");
	//Wld_InsertNpc		(OrcNewShaman,"OW_ROCKDRAGON_11");
	//Wld_InsertNpc		(OrcNewHeavy, "OW_ROCKDRAGON_11");
	
	
	NASZ_453_UrShak.flags = 0;
	UrShakBattlePart = 1;
	
	SpawnUrshakOrcs();
	
	FF_ApplyOnceExt(UrshakBattle,1000,-1);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_453_UrShak_Hello (C_INFO)
{
	npc		 	= 	NASZ_453_UrShak;
	nr		 	= 	1;
	condition		= 	DIA_NASZ_453_UrShak_Hello_Condition;
	information		= 	DIA_NASZ_453_UrShak_Hello_Info;
	important		 = 	TRUE;
};

func int DIA_NASZ_453_UrShak_Hello_Condition ()
{
	return TRUE;			
};

var func temp;
func void DIA_NASZ_453_UrShak_Hello_Info ()
{	
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_00"); //Cz�owiek! Wielki bohater! Zabija� wielu bracia orki!
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_01"); //Kpisz sobie ze mnie? 
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_02"); //Tak. Cz�owiek silny, cz�owiek rze�. Cz�owiek s�aby, cz�owiek tch�rz. Orki ka�dy silne, ka�dy walczy�. Nie jeden robi� wszystko.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_03"); //Skoro tu jestem, to chyba jednak orki s�abe, a nie silne.
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_04"); //Mhmmmm...
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_05"); //Jak cz�owiek imi�?
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_06"); //Will.
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_07"); //Will przypomina� Ur-Shak stary przyjaciel. On te� silny. On uratowa� Ur-Shak przed �li bracia, s�uchaj�cy demon Krushak.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_08"); //Krushak?
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_09"); //Spa�.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_10"); //M�wisz o �ni�cym. Rozumiem. Co tutaj robisz? Skoro walczy�e� z innymi orkami, to jakim cudem jeste� teraz ich przyw�dc�?
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_11"); //Ur-Shak kiedy� g�upi. My�le�, �e orki kocha� ludzie, ludzie kocha� orki, b�dzie pok�j. Stary przyjaciel by� symbol. Ur-Shak wiele czasu wygnaniec i niewolnik, ale Ur-Shak wierzy�.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_12"); //I co si� takiego sta�o?
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_13"); //Przyjaciel zabi� Hosh-Pak, by� nauczyciel Ur-Shak. Najwy�szy syn ducha. Przyjaciel silny, wi�c rze�. Ur-Shak zrozumie� sw�j b��d. Nigdy nie powinien zaufa� cz�owiek.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_14"); //Czyli masz do niego pretensj� o to, �e walczy� na wojnie o swoich?
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_15"); //Nie. Ur-Shak mie� pretensje o to, �e przyjaciel rozmawia� z Ur-Shak, by pozna� Hosh-Pak.
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_16"); //Wiedzie�, gdzie jest, przyjaciel p�j�� i zabi� nauczyciel. Wykorzysta� Ur-Shak. Ur-Shak zosta� nowy w�dz, ale przyjaciel pu�ci� wolno. My wrogi wtedy.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_17"); //Rozumiem, przyjaciel ci� zdradzi�, wykorzystuj�c twoj� przyja�� i wiedz�. Ale wiesz co? My�l�, �e chcia� zabi� Hosh-Paka, bo chcia� os�abi� morale ork�w, a nie chcia� doprowadza� do bezmy�lnej masakry na twoich pobratymcach. To strategia, nie rze�.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_18"); //I m�wisz, �e go pu�ci�e� wolno? Jak dla mnie to on nie chcia� z tob� walczy� i temu odszed�. Wydaje mi si�, Ur-Shaku, �e k�amiesz. I celowo napu�ci�e� swojego przyjaciela na Hosh-Paka, by zdoby� w�adz�.
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_19"); //Nie! Will k�ama�. Will jak ka�dy cz�owiek, a cz�owiek albo zgin��, albo niewolnik.
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_20"); //Id�c tutaj, zabi�em mn�stwo ork�w. Elitarnych wojownik�w i szaman�w. Dlaczego my�lisz, �e masz ze mn� jakiekolwiek szanse?
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_21"); //Ha, ha! Cz�owiek g�upi. Cz�owiek my�le�, �e Ur-Shak w to miejsce bez powodu? 
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_22"); //Co masz na my�li?
	AI_Output (self, other,"DIA_NASZ_453_UrShak_Hello_15_23"); //Ur-Shak przyby� tutaj po moc kamienia. Po moc smoka. Ur-Shak by� jeszcze pot�ny! Pozna� Ur-Shak moc!
	AI_Output (other, self,"DIA_NASZ_453_UrShak_Hello_15_24"); //O cholera!
	
	Info_ClearChoices	(DIA_NASZ_453_UrShak_Hello);
		Info_AddChoice		(DIA_NASZ_453_UrShak_Hello, DIALOG_ENDE ,DIA_NASZ_453_UrShak_Hello_End);
};

func void DIA_NASZ_453_UrShak_Hello_End()
{
	AI_StopProcessInfos (self);
	UrshakEndDialog();
};
