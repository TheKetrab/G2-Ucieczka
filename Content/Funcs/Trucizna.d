//*******************
//	Trucizna
//*******************
/*func void TruciznaDziala()
{
	//Trucizna
   if (WillZatruty > 0)
   {

	  if (WillZatruty == 1)
	  {
		  hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 1;
	  };
	  if (WillZatruty == 2)
	  {
		  hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 3;
	  };
	  if (WillZatruty == 3)
	  {
		  hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 5;
	  };
   };  

};*/

// trucizna dziala przez 60s lub do uleczenia sie

var int WillZatruty;
var int truciznaSec;

func void PoisonStop() {
	ff_remove(Poison1HP);
	ff_remove(Poison5HP);
	ff_remove(Poison10HP);
	WillZatruty = FALSE;
	truciznaSec = 0;
};

func void Poison1HPStart() {
	truciznaSec = 0;
	WillZatruty = 1;
	//Buff_Apply(hero, Poison1HP);
	ff_applyonceext(Poison1HP,3000,-1);
	Print(ConcatStrings(G2U_poisson," (-1HP / 3s)"));
	Snd_Play("TRUCIZNA");
};

func void Poison5HPStart() {
	truciznaSec = 0;
	WillZatruty = 2;
	//Buff_Apply(hero, Poison5HP);
	ff_applyonceext(Poison5HP,3000,-1);
	Print(ConcatStrings(G2U_poisson," (-5HP / 3s)"));
	Snd_Play ("TRUCIZNA");
};

func void Poison10HPStart() {
	truciznaSec = 0;
	WillZatruty = 3;
	//Buff_Apply(hero, Poison10HP);
	ff_applyonceext(Poison10HP,3000,-1);
	Print(ConcatStrings(G2U_poisson," (-10HP / 3s)"));
	Snd_Play ("TRUCIZNA");
};

func void Poison1HP() {
	if (truciznaSec >= 60) { PoisonStop(); Print("Trucizna przesta³a dzia³aæ."); };
	Npc_ChangeAttribute (hero, ATR_HITPOINTS , -1); 
	truciznaSec += 3;
};

func void Poison5HP() {
	if (truciznaSec >= 60) { PoisonStop(); Print("Trucizna przesta³a dzia³aæ."); };
	Npc_ChangeAttribute (hero, ATR_HITPOINTS , -5); 
	truciznaSec += 3;
};

func void Poison10HP() {
	if (truciznaSec >= 60) { PoisonStop(); Print("Trucizna przesta³a dzia³aæ."); };
	Npc_ChangeAttribute (hero, ATR_HITPOINTS , -10);
	truciznaSec += 3;
};




/*
instance Poison1HP ( lCBuff ) { 
 name = "Trucizna" ; 
 bufftype = BUFF_BAD ; 
 
 durationMS = 10 * 1000 ; 
 tickMS = durationMS ; 
 
 onTick = SAVE_GetFuncID ( posion_damage ) ; 
 
// buffTex = "" ; 
 };
 
 func void posion_damage ( var int bh ) { 
 var int ptr ; ptr = Buff_GetNpc ( bh ) ; 
 if ( ! ptr ) 
 { 
 return; 
 };  

 var c_npc n ; n = _^ ( ptr ) ; 
 Npc_ChangeAttribute ( n , ATR_HITPOINTS ,-1 ) ; 
 } ;

 instance Poison5HP ( lCBuff ) { 
 name = "Trucizna" ; 
 bufftype = BUFF_BAD ; 
 
 durationMS = 10 * 1000 ; 
 tickMS = durationMS ; 
 
 onTick = SAVE_GetFuncID ( posion_damage5 ) ; 

// buffTex = "" ; 
 };
 
 func void posion_damage5 ( var int bh ) { 
 var int ptr ; ptr = Buff_GetNpc ( bh ) ; 
 if ( ! ptr ) 
 { 
 return; 
 };  

 var c_npc n ; n = _^ ( ptr ) ; 
 Npc_ChangeAttribute ( n , ATR_HITPOINTS ,-5 ) ; 
 } ;

 
 instance Poison10HP ( lCBuff ) { 
 name = "Trucizna" ; 
 bufftype = BUFF_BAD ; 
 
 durationMS = 10 * 1000 ; 
 tickMS = durationMS ; 
 
 onTick = SAVE_GetFuncID ( posion_damage10 ) ; 
 
// buffTex = "" ; 
 };
 
 func void posion_damage10 ( var int bh ) { 
 var int ptr ; ptr = Buff_GetNpc ( bh ) ; 
 if ( ! ptr ) 
 { 
 return; 
 };  

 var c_npc n ; n = _^ ( ptr ) ; 
 Npc_ChangeAttribute ( n , ATR_HITPOINTS ,-10 ) ; 
 } ;
 */

