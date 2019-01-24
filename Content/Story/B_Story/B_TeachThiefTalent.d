// ***************************************
// B_TeachThiefTalent
// ------------------
// Picklock, Pickpocket, Sneak und Acrobat
// ***************************************

func int B_TeachThiefTalent (var C_NPC slf, var C_NPC oth, var int talent)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, talent, 1);
	
	
	//EXIT IF...
	
	// ------ falscher Parameter ------
	if (talent!=NPC_TALENT_PICKLOCK) 
	&& (talent!=NPC_TALENT_SNEAK) 
	&& (talent!=NPC_TALENT_ACROBAT) 
	&& (talent!=NPC_TALENT_PICKPOCKET)
	{
		PrintS_Ext("*** ERROR: Wrong Parameter ***", RGBA(255,255,255,0));
		return FALSE;
	};
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < 5)
	{
		//PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall, 2);
		PrintS_Ext(PRINT_NotEnoughLearnPoints, RGBA(255,255,255,0));
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
		
	// FUNC
				
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - 5;
	
	// ------ Talent vergeben ------
	if (talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill 	(oth, NPC_TALENT_PICKLOCK, 1);
		//PrintScreen			(PRINT_LearnPicklock, -1, -1, FONT_Screen, 2);
		PrintS_Ext(PRINT_LearnPicklock, RGBA(255,255,255,0));
		return TRUE;
	};
	
	if (talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill 	(oth, NPC_TALENT_SNEAK, 1);
		//PrintScreen			(PRINT_LearnSneak, -1, -1, FONT_Screen, 2);
		PrintS_Ext(PRINT_LearnSneak, RGBA(255,255,255,0));
		return TRUE;
	};
	
	if (talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill 	(oth, NPC_TALENT_ACROBAT, 1);
		//PrintScreen	(PRINT_LearnAcrobat, -1, -1, FONT_Screen, 2);
		PrintS_Ext(PRINT_LearnAcrobat, RGBA(255,255,255,0));
		return TRUE;
	};
	
	if (talent == NPC_TALENT_PICKPOCKET)
	{
		Npc_SetTalentSkill 	(oth, NPC_TALENT_PICKPOCKET, 1);	
		//PrintScreen	(PRINT_LearnPickpocket, -1, -1, FONT_Screen, 2);
		PrintS_Ext(PRINT_LearnPickpocket, RGBA(255,255,255,0));
		return TRUE;
	};
};
	
	
	
	
	




	
	
	
	
	
	
	
	
	
	



	
	
	


		
	
	
	

	
	
	
	
	

	
	
	

