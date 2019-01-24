PROTOTYPE Mst_Default_Duch(C_Npc)            
{
    name         = "Duch";    
    level                            =    15;
    guild         = 0;
    voice         = 18;
    flags         = 6;                                                    
    npctype        = NPCTYPE_MAIN;

    //----- Attribute ----    
    attribute    [ATR_STRENGTH]        =    60; //+50 Waffe
    attribute    [ATR_DEXTERITY]        =    60;
    attribute    [ATR_HITPOINTS_MAX]    =    150;
    attribute    [ATR_HITPOINTS]        =    150;
    attribute    [ATR_MANA_MAX]         =    0;
    attribute    [ATR_MANA]             =    0;

    //----- Protection ----
    protection    [PROT_BLUNT]        =    60;
    protection    [PROT_EDGE]            =    60;
    protection    [PROT_POINT]        =    140; 
    protection    [PROT_FIRE]            =    60;
    protection    [PROT_FLY]            =    60;
    protection    [PROT_MAGIC]        =    0;
        
    //----- Damage Types ----
    damagetype                         =    DAM_EDGE;
//    damage        [DAM_INDEX_BLUNT]    =    0;
//    damage        [DAM_INDEX_EDGE]    =    0;
//    damage        [DAM_INDEX_POINT]    =    0;
//    damage        [DAM_INDEX_FIRE]    =    0;
//    damage        [DAM_INDEX_FLY]        =    0;
//    damage        [DAM_INDEX_MAGIC]    =    0;

	// TODO: losowanie twarzy i armora
    B_SetNpcVisual         (self, MALE, "Hum_Head_Psionic", 174, 0, ITAR_LESTER);        
    Mdl_SetModelFatness    (self, 1);
    Mdl_ApplyOverlayMds    (self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

    B_GiveNpcTalents (self);
    
    //----- Kampf-Taktik ----
    fight_tactic    =    FAI_HUMAN_STRONG;
    

    //----- Daily Routine ----
    start_aistate                = ZS_MM_AllScheduler;

    aivar[AIV_MM_RestStart]     = OnlyRoutine;
};

instance Nasz_Duch(Mst_Default_Duch)
{
    start_aistate = ZS_Stand_WP;
}; 