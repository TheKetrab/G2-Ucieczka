// ******************************************************************
// B_AddFightSkill
// ---------------
// setzt die Kampftalent-Ani abhängig von TrefferChance% 
// (ab 30% und ab 60%)
// wird aus NPC_SetFightSkills aufgerufen (um FightSkill in NSC-Instanzen zu setzen)
// und aus B_TeachFightTalentPercent (um Player-Skill zu erhöhen)
// ******************************************************************

func void B_AddFightSkill (var C_NPC slf, var int talent, var int percent)
{
	
	if (talent == NPC_TALENT_1H)
	{
		slf.HitChance[NPC_TALENT_1H] = slf.HitChance[NPC_TALENT_1H] + percent;
		
		if (slf.aivar[AIV_TARCZA]  == TRUE)
		{
			if (slf.HitChance[NPC_TALENT_1H] < 10)		{	Npc_SetTalentSkill (slf, NPC_TALENT_1H, 0);		Mdl_ApplyOverlayMds (slf, "HUMANS_X.MDS");	};
			if (slf.HitChance[NPC_TALENT_1H] >=10)		{	Mdl_RemoveOverlayMds (slf, "HUMANS_X.MDS");		Npc_SetTalentSkill (slf, NPC_TALENT_1H, 0);		};
			if (slf.HitChance[NPC_TALENT_1H] >=30)		{	Npc_SetTalentSkill (slf, NPC_TALENT_1H, 1);		};
			if (slf.HitChance[NPC_TALENT_1H] >=60)		{	Npc_SetTalentSkill (slf, NPC_TALENT_1H, 1);		};
		}
		else
		{
			//stare liczenie
			//if (slf.HitChance[NPC_TALENT_1H] < 25)		{	Npc_SetTalentSkill (slf, NPC_TALENT_1H, 0);		Mdl_ApplyOverlayMds (slf, "HUMANS_X.MDS");	};
			//if (slf.HitChance[NPC_TALENT_1H] >=25)		{	Mdl_RemoveOverlayMds (slf, "HUMANS_X.MDS");		Npc_SetTalentSkill (slf, NPC_TALENT_1H, 0);		};
			//if (slf.HitChance[NPC_TALENT_1H] >=50)		{	Npc_SetTalentSkill (slf, NPC_TALENT_1H, 1);		};
			//if (slf.HitChance[NPC_TALENT_1H] >=75)		{	Npc_SetTalentSkill (slf, NPC_TALENT_1H, 2);		};
			
			if (slf.HitChance[NPC_TALENT_1H] >=0)    
			{    
				Npc_SetTalentSkill (slf, NPC_TALENT_1H, 0);    
				Mdl_ApplyOverlayMds	(slf, "HUMANS_X.MDS");	
				Mdl_RemoveOverlayMDS    (slf, "Humans_1hST1.MDS");
				Mdl_RemoveOverlayMDS    (slf, "Humans_1hST2.MDS");
			};
			
			if (slf.HitChance[NPC_TALENT_1H] >=10)    
			{    
				Npc_SetTalentSkill (slf, NPC_TALENT_1H, 0);    
				Mdl_RemoveOverlayMds	(slf, "HUMANS_X.MDS");	
				Mdl_RemoveOverlayMDS    (slf, "Humans_1hST1.MDS");
				Mdl_RemoveOverlayMDS    (slf, "Humans_1hST2.MDS");
			};

			if (slf.HitChance[NPC_TALENT_1H] >=30)    
			{    
				Npc_SetTalentSkill (slf, NPC_TALENT_1H, 1);
				Mdl_RemoveOverlayMds	(slf, "HUMANS_X.MDS");
				Mdl_ApplyOverlayMDS		(slf, "Humans_1hST1.MDS");
				Mdl_RemoveOverlayMDS	(slf, "Humans_1hST2.MDS");
			};

			if (slf.HitChance[NPC_TALENT_1H] >=60)        
			{    
				Npc_SetTalentSkill (slf, NPC_TALENT_1H, 2);        
				Mdl_RemoveOverlayMds	(slf, "HUMANS_X.MDS");
				Mdl_ApplyOverlayMDS		(slf, "Humans_1hST2.MDS");
				Mdl_RemoveOverlayMDS    (slf, "Humans_1hST1.MDS");
			};
		};
	};
	
	if (talent == NPC_TALENT_2H)
	{
		slf.HitChance[NPC_TALENT_2H] = slf.HitChance[NPC_TALENT_2H] + percent;
		
		if (slf.HitChance[NPC_TALENT_1H] >=0)		{	Npc_SetTalentSkill (slf, NPC_TALENT_2H, 0);		};
		if (slf.HitChance[NPC_TALENT_2H] >=30)		{	Npc_SetTalentSkill (slf, NPC_TALENT_2H, 1);		};
		if (slf.HitChance[NPC_TALENT_2H] >=60)		{	Npc_SetTalentSkill (slf, NPC_TALENT_2H, 2);		};
	};
	
	if (talent == NPC_TALENT_BOW)
	{
		slf.HitChance[NPC_TALENT_BOW] = slf.HitChance[NPC_TALENT_BOW] + percent;
		
		if (slf.HitChance[NPC_TALENT_BOW] >=0)		{	Npc_SetTalentSkill (slf, NPC_TALENT_BOW, 0);	};
		if (slf.HitChance[NPC_TALENT_BOW] >=30)		{	Npc_SetTalentSkill (slf, NPC_TALENT_BOW, 1);	};
		if (slf.HitChance[NPC_TALENT_BOW] >=60)		{	Npc_SetTalentSkill (slf, NPC_TALENT_BOW, 2);	};
	};
	
	if (talent == NPC_TALENT_CROSSBOW)
	{
		slf.HitChance[NPC_TALENT_CROSSBOW] = slf.HitChance[NPC_TALENT_CROSSBOW] + percent;
		
		if (slf.HitChance[NPC_TALENT_CROSSBOW] >=0)		{	Npc_SetTalentSkill (slf, NPC_TALENT_CROSSBOW, 0);	};
		if (slf.HitChance[NPC_TALENT_CROSSBOW] >=30)	{	Npc_SetTalentSkill (slf, NPC_TALENT_CROSSBOW, 1);	};
		if (slf.HitChance[NPC_TALENT_CROSSBOW] >=60)	{	Npc_SetTalentSkill (slf, NPC_TALENT_CROSSBOW, 2);	};
	};
};
