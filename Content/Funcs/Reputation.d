var int RepBandyci_OneTime;

// ----- REPUTACJA -----

var int rep_lowcy_s;
var int rep_mysliwi_s;
var int rep_bandyci_s;

const int REP_LOWCY=1;
const int REP_MYSLIWI=2;
const int REP_BANDYCI=3;

// ***** ***** DODAJ REPUTACJE ***** *****
FUNC VOID DodajReputacje(var int ile, var int ukogo){
 var string rep_tekst;
 if(ukogo==1){
  rep_tekst = "Reputacja u �owc�w ork�w: ";
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_lowcy_s));
  rep_tekst = ConcatStrings(rep_tekst,"+");
  rep_tekst = ConcatStrings(rep_tekst,IntToString(ile));
  rep_tekst = ConcatStrings(rep_tekst,"=");
  rep_lowcy_s+=ile;
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_lowcy_s));
  rep_tekst = ConcatStrings(rep_tekst,".");
  //PrintScreen (rep_tekst, -1, 50, FONT_ScreenSmall, 2);
  PrintS_Ext(rep_tekst, RGBA(255,255,255,0));
 }
 else if(ukogo==2){
  rep_tekst = "Reputacja u my�liwych: ";
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_mysliwi_s));
  rep_tekst = ConcatStrings(rep_tekst,"+");
  rep_tekst = ConcatStrings(rep_tekst,IntToString(ile));
  rep_tekst = ConcatStrings(rep_tekst,"=");
  rep_mysliwi_s+=ile;
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_mysliwi_s));
  rep_tekst = ConcatStrings(rep_tekst,".");
  //PrintScreen (rep_tekst, -1, 50, FONT_ScreenSmall, 2);
  PrintS_Ext(rep_tekst, RGBA(255,255,255,0));
 }
 else if(ukogo==3){
  rep_tekst = "Reputacja u bandyt�w: ";
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_bandyci_s));
  rep_tekst = ConcatStrings(rep_tekst,"+");
  rep_tekst = ConcatStrings(rep_tekst,IntToString(ile));
  rep_tekst = ConcatStrings(rep_tekst,"=");
  rep_bandyci_s+=ile;
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_bandyci_s));
  rep_tekst = ConcatStrings(rep_tekst,".");
  //PrintScreen (rep_tekst, -1, 50, FONT_ScreenSmall, 2);
   PrintS_Ext(rep_tekst, RGBA(255,255,255,0));
  
	if (rep_bandyci_s >= 100) && (RepBandyci_OneTime == FALSE)	{
		RepBandyci_OneTime = TRUE;
		Snd_Play ("LEVELUP");
	//	PrintScreen ("Premia za max reputacji: +5 PN", -1, 50, "font_old_20_white.tga", 3);
		PrintS_Ext("Premia za max reputacji: +5 PN", RGBA(255,255,255,0));
		hero.lp = hero.lp + 5;
	};
 };
};


// ***** ***** PRINT MISSING REP ***** *****
func void PrintMissingRep(var int ile_potrzeba, var int ukogo) {

	var int your_rep;
	
	if (ukogo == REP_LOWCY) { your_rep = rep_lowcy_s; }
	else if (ukogo == REP_MYSLIWI) { your_rep = rep_mysliwi_s; }
	else if (ukogo == REP_BANDYCI) { your_rep = rep_bandyci_s; }
	else { /* ERROR */ your_rep = 0; };

	//PrintScreen	(ConcatStrings("Brakuje reputacji: ",IntToString(ile_potrzeba-your_rep)), -1, 45, FONT_ScreenSmall, 2);
	 PrintS_Ext(ConcatStrings("Brakuje reputacji: ",IntToString(ile_potrzeba-your_rep)), RGBA(255,255,255,0));
};

// ***** ***** REP ENOUGH ***** *****
func int RepEnough(var int ile, var int ukogo) {

	if (ukogo == REP_LOWCY) && (rep_lowcy_s >= ile) {
		return TRUE;
	};
	
	if (ukogo == REP_MYSLIWI) && (rep_mysliwi_s >= ile) {
		return TRUE;
	};

	if (ukogo == REP_BANDYCI) && (rep_bandyci_s >= ile) {
		return TRUE;
	};

	return FALSE;
};