// TODO: Dla dubbingowcow: Play_Sound("PIERWSZY!") itp

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

	if (MonkWolfKiller == 1) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 2) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 3) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 4) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 5) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 6) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 7) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 8) {
		WolfCounterText();
	}
	else if (MonkWolfKiller == 9) {
		WolfCounterText();
	};

};

func void HeroSayWolfCounter() {

	if (HeroWolfKiller == 1) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 2) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 3) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 4) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 5) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 6) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 7) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 8) {
		WolfCounterText();
	}
	else if (HeroWolfKiller == 9) {
		WolfCounterText();
	};

};
