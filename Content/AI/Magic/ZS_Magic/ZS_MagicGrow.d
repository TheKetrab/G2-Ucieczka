// **************
// ZS_MagicGrow
// **************

func int ZS_MagicGrow()
{
	/*if ( !Npc_HasBodyFlag( self, BS_FLAG_INTERRUPTABLE) )
	{
		AI_StandUp 		(self);
	}
	else
	{
		AI_StandUpQuick (self);
	};*/
	
	hero.aivar[AIV_MM_ShrinkState] = 0;   		 // AIV resetten
};


func int ZS_MagicGrow_Loop ()
{	

	if 		(hero.aivar[AIV_MM_ShrinkState] == 0)	{	Mdl_SetModelScale(hero,	1.05,	1.05, 	1.05);	hero.aivar[AIV_MM_ShrinkState] = 1;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 1)	{	Mdl_SetModelScale(hero,	1.10,	1.10, 	1.10);	hero.aivar[AIV_MM_ShrinkState] = 2;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 2)	{	Mdl_SetModelScale(hero,	1.15,	1.15, 	1.15);	hero.aivar[AIV_MM_ShrinkState] = 3;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 3)	{	Mdl_SetModelScale(hero,	1.20,	1.20, 	1.20);	hero.aivar[AIV_MM_ShrinkState] = 4;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 4)	{	Mdl_SetModelScale(hero,	1.25,	1.25, 	1.25);	hero.aivar[AIV_MM_ShrinkState] = 5;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 5)	{	Mdl_SetModelScale(hero,	1.30,	1.30, 	1.30);	hero.aivar[AIV_MM_ShrinkState] = 6;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 6)	{	Mdl_SetModelScale(hero,	1.35,	1.35, 	1.35);	hero.aivar[AIV_MM_ShrinkState] = 7;		}
 	else if	(hero.aivar[AIV_MM_ShrinkState] == 7)	{	Mdl_SetModelScale(hero,	1.40,	1.40, 	1.40);	hero.aivar[AIV_MM_ShrinkState] = 8;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 8)	{	Mdl_SetModelScale(hero,	1.45,	1.45, 	1.45);	hero.aivar[AIV_MM_ShrinkState] = 9;		}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 9)	{	Mdl_SetModelScale(hero,	1.50,	1.50, 	1.50);	hero.aivar[AIV_MM_ShrinkState] = 10;	}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 10)	{	Mdl_SetModelScale(hero,	1.55,	1.55, 	1.55);	hero.aivar[AIV_MM_ShrinkState] = 11;	}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 11)	{	Mdl_SetModelScale(hero,	1.60,	1.60, 	1.60);	hero.aivar[AIV_MM_ShrinkState] = 12;	}
	else if	(hero.aivar[AIV_MM_ShrinkState] == 12)	{	Mdl_SetModelScale(hero,	1.65,	1.65, 	1.65);	hero.aivar[AIV_MM_ShrinkState] = 13;	}
 
	else if (hero.aivar[AIV_MM_ShrinkState] == 13) 	
	{  
		
		hero.aivar[AIV_MM_ShrinkState] = 14;
	}
	else if (hero.aivar[AIV_MM_ShrinkState] == 14) 
	{
		Npc_ClearAIQueue(hero);
		hero.start_aistate = ZS_MagicShrunk;
		AI_StartState		(hero,	ZS_MagicShrunk,	1,	"");
		return				LOOP_END;	 
	};

	AI_Wait					(hero,	0.38);		// 5 Sekunden gesamte Schrumpfzeit geteilt durch 13 Stadien

	return					LOOP_CONTINUE;
};

func void ZS_MagicGrow_End()
{

};

/*
// **************
// ZS_MagicShrunk
// **************

func void ZS_MagicShrunk ()
{	
	Npc_SetTarget			(self,	hero);
};

func int ZS_MagicShrunk_Loop ()
{
	AI_Flee					(self);
	return					LOOP_CONTINUE;
};

func void ZS_MagicShrunk_End ()
{	
	
};


*/