
func void Npc_EquipArmor(var c_npc slf, var int arm) {

	Print("x");
	
	var c_item act_armor; act_armor = Npc_GetEquippedArmor(slf);
	var int act_armor_id; act_armor_id = Hlp_GetInstanceID(act_armor);
	
	Npc_RemoveInvItems(slf, act_armor_id, 1);

	if (npc_hasitems(slf,arm) == 0) {
		CreateInvItems(slf, arm, 1);
	};
	
	Npc_ClearAIQueue(slf);
	AI_EquipBestArmor(slf);	
};

func void Bam_Mine_Start() {

	B_StartOtherRoutine(NASZ_118_Ferros,"Kopalnia");
	B_StartOtherRoutine(NASZ_117_Fed,"Kopalnia");
	B_StartOtherRoutine(NASZ_116_Kjorn,"Kopalnia");
	
	B_StartOtherRoutine(NASZ_020_Sattar,"Start");
	B_StartOtherRoutine(NASZ_005_Ben,"Start");
	B_StartOtherRoutine(NASZ_002_Daryl,"Start");
	B_StartOtherRoutine(NASZ_001_Kopacz,"Start");
};

func void Bam_Mine_Pancerze() {

	Npc_EquipArmor(NASZ_118_Ferros, ITAR_PAL_M);
	Npc_EquipArmor(NASZ_117_Fed, ITAR_PAL_M);
	Npc_EquipArmor(NASZ_116_Kjorn, ITAR_PAL_H);

};

func void Bam_Mine_Finish() {

	B_StartOtherRoutine(NASZ_118_Ferros,"Start");
	B_StartOtherRoutine(NASZ_117_Fed,"Start");
	B_StartOtherRoutine(NASZ_116_Kjorn,"Start");
	
	B_StartOtherRoutine(NASZ_020_Sattar,"Lowcy");
	B_StartOtherRoutine(NASZ_005_Ben,"Lowcy");
	B_StartOtherRoutine(NASZ_002_Daryl,"Lowcy");
	B_StartOtherRoutine(NASZ_001_Kopacz,"Lowcy");
};