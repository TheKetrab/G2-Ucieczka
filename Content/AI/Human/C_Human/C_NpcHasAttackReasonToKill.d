// **************************
// C_NpcHasAttackReasonToKill
// **************************

func int C_NpcHasAttackReasonToKill (var C_NPC slf)
{
	if (slf.aivar[AIV_ATTACKREASON] == AR_KILL)
	
	|| ((slf.aivar[AIV_ATTACKREASON] == AR_Theft) && (C_NpcIsBandit(slf))) // NASZ
	|| ((slf.aivar[AIV_ATTACKREASON] == AR_UseMob) && (C_NpcIsBandit(slf))) // NASZ
	
	|| (slf.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	|| (slf.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)
	{
		return TRUE; 	
	};
	
	return FALSE; 
};
