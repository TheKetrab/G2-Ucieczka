instance NASZ_800_Tarcza (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Tarcza";
	//guild 		=	GIL_NONE;
	id 			=	800;
	flags=2;
	//-------- abilities --------
	//attribute[ATR_STRENGTH] 	= 70;
	//attribute[ATR_DEXTERITY] 	= 50;
	//attribute[ATR_MANA_MAX] 	= 0;
	//attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 500;
	attribute[ATR_HITPOINTS] 	= 500;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");//TARCZA.MDS
	//Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//Mdl_SetModelScale(self, szerokosc, wysokosc, 0.5);
	Mdl_SetModelScale(self, 1.2, 0.7, 1.2);
	daily_routine = Rtn_Start_800;
};

FUNC VOID Rtn_Start_800 ()
{
	TA_Stand_WP		(07,0,10,00,"NASZ_MYSLIWI_GORA_18");
	TA_Stand_WP  	(10,00,07,00,"NASZ_MYSLIWI_GORA_18");
};
