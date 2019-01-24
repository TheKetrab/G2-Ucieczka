


func void TRIGGER_ZOMBIE_TP_FUNC() {

	AI_Teleport (hero, "OW_PATH_035");
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play ("MFX_TELEPORT_CAST");
};

func void TRIGGER_NIEZNANY_TP_FUNC() {

	if (NieznanyTPActivated) {
		AI_Teleport (hero, "NASZ_BANDYCI_ARTEFAKT_1");
		Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
		Snd_Play ("MFX_TELEPORT_CAST");
	};
};

func void TRIGGER_NIEZNANY_BACK_TP_FUNC() {

	AI_Teleport (hero, "OW_PATH_093");
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play ("MFX_TELEPORT_CAST");
};

func void TRIGGER_STRAZNIK_TP_FUNC() {

	AI_Teleport (hero, "NASZ_STRAZNIK_SKRYTKA");
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play ("MFX_TELEPORT_CAST");
};