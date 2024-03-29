// **********
// B_LogEntry
// **********

func void B_LogEntry (var string topic, var string entry)
{
	AI_Function_SS(hero,_B_LogEntry,topic,entry);
};

func void _B_LogEntry (var string topic, var string entry)
{
	Log_AddEntry	(topic, entry);

	
	var string NowyWpisDziennikTekst;
	var string NowyWpisDziennikNazwa;
	
	NowyWpisDziennikTekst = PRINT_NewLogEntry;
	NowyWpisDziennikTekst = ConcatStrings(NowyWpisDziennikTekst,":");
    NowyWpisDziennikNazwa = "'";
	NowyWpisDziennikNazwa = ConcatStrings(NowyWpisDziennikNazwa,topic);
	NowyWpisDziennikNazwa = ConcatStrings(NowyWpisDziennikNazwa,"'");

	PrintS_Ext(NowyWpisDziennikTekst, RGBA(255,255,255,0));
	PrintS_Ext(NowyWpisDziennikNazwa, RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));
	
	//PrintScreen		(PRINT_NewLogEntry, -1, YPOS_LOGENTRY, FONT_ScreenSmall, 2);
	Snd_Play 		("LogEntry");
};

func void FailQuest(var string topic, var string entry)
{
	AI_Function_SS(hero,_FailQuest,topic,entry);
};

func void _FailQuest(var string topic, var string entry)
{
	Log_AddEntry	(topic, entry);
	
	PrintS_Ext(ConcatStrings("Misja nieudana: ",topic), RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));
	
	//PrintScreen		(PRINT_NewLogEntry, -1, YPOS_LOGENTRY, FONT_ScreenSmall, 2);
	Snd_Play 		("LogEntry");
	
	Log_SetTopicStatus(topic,LOG_OBSOLETE);
};
