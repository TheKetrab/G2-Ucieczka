// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// OSIAGNIECIA NOWE
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

var int AchievementsCnt;

const string Acv1Title   = "Zab�jca";
const string Acv1Content = "Zabi�e� 1000 stworze�.";

const string Acv2Title   = "Guru kopaczy";
const string Acv2Content = "Wykopa�e� niemal wszystko w G�rniczej Dolinie.";

const string Acv3Title   = "Alchemik";
const string Acv3Content = "Pozna�e� wszystkie sekrety Gildii Alchemik�w.";

const string Acv4Title   = "Z�odziej";
const string Acv4Content = "Nauczy�e� si� wszystkich sztuczek z�odziejskich.";

const string Acv5Title   = "Mistrz areny";
const string Acv5Content = "Pokona�e� wszystkich gladiator�w.";

const string Acv6Title   = "M�ciciel";
const string Acv6Content = "Wyzwoli�e� kopalni� Marcosa.";

const string Acv7Title   = "Przywo�ywacz duch�w";
const string Acv7Content = "Po�wi�ci�e� wszystkie groby.";

const string Acv8Title   = "Okrob�jca";
const string Acv8Content = "Rozgromi�e� ob�z ork�w na pla�y.";

const string Acv9Title   = "Achilles";
const string Acv9Content = "Pokona�e� wszystkich boss�w.";

const string Acv10Title   = "Chwa�a i odwaga";
const string Acv10Content = "Oczy�ci�e� p�askowy� gigant�w.";

const string Acv11Title   = "Zbieracz";
const string Acv11Content = "Podnios�e� 100 zardzewia�ych mieczy.";
var int ZardzewialeMieczePodniesione;

const string Acv12Title   = "Nieuk";
const string Acv12Content = "Mia�e� a� 50 niewykorzystanych punkt�w nauki!";

const string Acv13Title   = "Skoczek";
const string Acv13Content = "Skoczy�e� z najwy�szego wodospadu w G�rniczej Dolinie.";

const string Acv14Title   = "�amacz wytrych�w";
const string Acv14Content = "Z�ama�e� 50 wytrych�w.";
var int ZlamaneWytrychy;

const string Acv15Title   = "Magik";
const string Acv15Content = "U�y�e� 30 r�nych zakl��."; // bez teleportacji!
var int WillUzyteZaklecia;

const string Acv16Title   = "Nurek";
const string Acv16Content = "Sp�dzi�e� pod wod� ponad 5 minut!"; // (w sumie) czasu rzeczywistego
var int DivingTime;

const string Acv17Title   = "Znachor";
const string Acv17Content = "Zjad�e� wszystkie gatunki zi�.";
var int EatenPlants;


const string Acv18Title   = "Ledwo �ywy";
const string Acv18Content = "Zosta� ci tylko 1 punkt �ycia.";

const string Acv19Title   = "Antidotum";
const string Acv19Content = "Wyleczy�e� si� z trucizny.";
var int OdtrutkaEverUsed;

const string Acv20Title   = "Szanowany cz�onek";
const string Acv20Content = "Zdoby�e� 100 reputacji w swojej gildii.";

const string Acv21Title   = "�pioch";
const string Acv21Content = "Przespa�e� 100 godzin!";
var int SleptHours;

const string Acv22Title   = "Pokorny s�uga";
const string Acv22Content = "Modli�e� si� do Innosa codziennie przez 3 dni.";
var int InnosPrayInRow;

const string Acv23Title   = "Magnat";
const string Acv23Content = "Odnalaz�e� artefakty magnat�w.";

const string Acv24Title   = "Biegacz";
const string Acv24Content = "Przebieg�e� 50 kilometr�w.";

const string Acv25Title   = "Kr�l biegaczy";
const string Acv25Content = "Przebieg�e� 100 kilometr�w.";

const string Acv26Title   = "Zgniatacz";
const string Acv26Content = "Zdepta�e� 10 chrz�szczy.";
var int zdeptane_chrzaszcze;

const string Acv27Title   = "Odkrywca";
const string Acv27Content = "Nauczy�e� si� wszystkich nowych umiej�tno�ci.";

const string Acv28Title   = "Pijaczyna";
const string Acv28Content = "Wypi�e� 30 butelek alkoholu.";
var int DrunkTrinken;

const string Acv29Title   = "Mistrz my�listwa";
const string Acv29Content = "Nauczy�e� si� zbierania wszystkich trofe�w.";

const string Acv30Title   = "Kr�l rabunku";
const string Acv30Content = "Otworzy�e� wszystkie kufry w obozach �owc�w i My�liwych.";


func void AddAchievement(var string title, var string content) {

	AchievementsCnt += 1;

	Log_CreateTopic(title, LOG_MISSION);
	Log_SetTopicStatus(title, LOG_FAILED);
	Log_AddEntry (title, content);

	PrintScreen("PN + 1", -1,-1, "font_old_20_white.tga",5);
	PrintScreen(content, -1,52, FONT_ScreenSmall,5);

	Snd_Play ("SFX_INNOSEYE");
	hero.lp = hero.lp + 1;
	
	// PrintS_Ext(ConcatStrings("Zdobyto odznak�: ",title), RGBA(255,255,255,0));
	// PrintS_Ext(" ", RGBA(255,255,255,0));

};