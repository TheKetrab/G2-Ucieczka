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

instance Poison1HP ( lCBuff ) { 
 name = "Trucizna" ; 
 bufftype = BUFF_BAD ; 
 
 durationMS = 10 * 1000 ; 
 tickMS = 1000 ; 
 
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
 tickMS = 1000 ; 
 
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
 tickMS = 1000 ; 
 
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
