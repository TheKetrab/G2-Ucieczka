
func void WolfCounterText() {

	var string text;
	
	text = "Monk: ";
	text = ConcatStrings(text,IntToString(MonkWolfKiller));
	text = ConcatStrings(text,", Will: ");
	text = ConcatStrings(text,IntToString(HeroWolfKiller));

	PrintS_Ext(text, RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));

};

func void MonkSayWolfCounter() {

	var string snd;
	snd = ConcatStrings("SVM_MONK_WOLF",IntToString(MonkWolfKiller));
	Snd_Play(snd);
	WolfCounterText();

};

func void HeroSayWolfCounter() {

	var string snd;
	snd = ConcatStrings("SVM_WILL_WOLF",IntToString(MonkWolfKiller));
	Snd_Play(snd);
	WolfCounterText();

};
