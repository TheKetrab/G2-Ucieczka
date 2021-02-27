// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// OSIAGNIECIA NOWE
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

var int AchievementsCnt;

const string Acv1Title   = "Zabójca";
const string Acv1Content = "Zabi³eœ 1000 stworzeñ.";

const string Acv2Title   = "Guru kopaczy";
const string Acv2Content = "Wykopa³eœ niemal wszystko w Górniczej Dolinie.";

const string Acv3Title   = "Alchemik";
const string Acv3Content = "Pozna³eœ wszystkie sekrety Gildii Alchemików.";

const string Acv4Title   = "Z³odziej";
const string Acv4Content = "Nauczy³eœ siê wszystkich sztuczek z³odziejskich.";

const string Acv5Title   = "Mistrz areny";
const string Acv5Content = "Pokona³eœ wszystkich gladiatorów.";

const string Acv6Title   = "Mœciciel";
const string Acv6Content = "Wyzwoli³eœ kopalniê Marcosa.";

const string Acv7Title   = "Przywo³ywacz duchów";
const string Acv7Content = "Poœwiêci³eœ wszystkie groby.";

const string Acv8Title   = "Okrobójca";
const string Acv8Content = "Rozgromi³eœ obóz orków na pla¿y.";

const string Acv9Title   = "Achilles";
const string Acv9Content = "Pokona³eœ wszystkich bossów.";

const string Acv10Title   = "Chwa³a i odwaga";
const string Acv10Content = "Oczyœci³eœ p³askowy¿ gigantów.";

const string Acv11Title   = "Zbieracz";
const string Acv11Content = "Podnios³eœ 100 zardzewia³ych mieczy.";
var int ZardzewialeMieczePodniesione;

const string Acv12Title   = "Nieuk";
const string Acv12Content = "Mia³eœ a¿ 50 niewykorzystanych punktów nauki!";

const string Acv13Title   = "Skoczek";
const string Acv13Content = "Skoczy³eœ z najwy¿szego wodospadu w Górniczej Dolinie.";

const string Acv14Title   = "£amacz wytrychów";
const string Acv14Content = "Z³ama³eœ 50 wytrychów.";
var int ZlamaneWytrychy;

const string Acv15Title   = "Magik";
const string Acv15Content = "U¿y³eœ 30 ró¿nych zaklêæ."; // bez teleportacji!
var int WillUzyteZaklecia;

const string Acv16Title   = "Nurek";
const string Acv16Content = "Spêdzi³eœ pod wod¹ ponad 5 minut!"; // (w sumie) czasu rzeczywistego
var int DivingTime;

const string Acv17Title   = "Znachor";
const string Acv17Content = "Zjad³eœ wszystkie gatunki zió³.";
var int EatenPlants;


const string Acv18Title   = "Ledwo ¿ywy";
const string Acv18Content = "Zosta³ ci tylko 1 punkt ¿ycia.";

const string Acv19Title   = "Antidotum";
const string Acv19Content = "Wyleczy³eœ siê z trucizny.";
var int OdtrutkaEverUsed;

const string Acv20Title   = "Szanowany cz³onek";
const string Acv20Content = "Zdoby³eœ 100 reputacji w swojej gildii.";

const string Acv21Title   = "Œpioch";
const string Acv21Content = "Przespa³eœ 100 godzin!";
var int SleptHours;

const string Acv22Title   = "Pokorny s³uga";
const string Acv22Content = "Modli³eœ siê do Innosa codziennie przez 3 dni.";
var int InnosPrayInRow;

const string Acv23Title   = "Magnat";
const string Acv23Content = "Odnalaz³eœ artefakty magnatów.";

const string Acv24Title   = "Biegacz";
const string Acv24Content = "Przebieg³eœ 50 kilometrów.";

const string Acv25Title   = "Król biegaczy";
const string Acv25Content = "Przebieg³eœ 100 kilometrów.";

const string Acv26Title   = "Zgniatacz";
const string Acv26Content = "Zdepta³eœ 10 chrz¹szczy.";
var int zdeptane_chrzaszcze;

const string Acv27Title   = "Odkrywca";
const string Acv27Content = "Nauczy³eœ siê wszystkich nowych umiejêtnoœci.";

const string Acv28Title   = "Pijaczyna";
const string Acv28Content = "Wypi³eœ 30 butelek alkoholu.";
var int DrunkTrinken;

const string Acv29Title   = "Mistrz myœlistwa";
const string Acv29Content = "Nauczy³eœ siê zbierania wszystkich trofeów.";

const string Acv30Title   = "Król rabunku";
const string Acv30Content = "Otworzy³eœ wszystkie kufry w obozach £owców i Myœliwych.";


func void AddAchievement(var string title, var string content) {

	AchievementsCnt += 1;

	Log_CreateTopic(title, LOG_MISSION);
	Log_SetTopicStatus(title, LOG_FAILED);
	Log_AddEntry (title, content);

	PrintScreen("PN + 1", -1,-1, "font_old_20_white.tga",5);
	PrintScreen(content, -1,52, FONT_ScreenSmall,5);

	Snd_Play ("SFX_INNOSEYE");
	hero.lp = hero.lp + 1;
	
	// PrintS_Ext(ConcatStrings("Zdobyto odznakê: ",title), RGBA(255,255,255,0));
	// PrintS_Ext(" ", RGBA(255,255,255,0));

};