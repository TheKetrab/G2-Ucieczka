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

const string Acv13Title   = "Otwieracz";
const string Acv13Content = "Otworzy³eœ 100 skrzyñ.";

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

const string Acv20Title   = "Pijaczyna";
const string Acv20Content = "Kupi³eœ 100 butelek alkoholu.";

const string Acv21Title   = "Œpioch";
const string Acv21Content = "Przespa³eœ 100 godzin!";

const string Acv22Title   = "Pokorny s³uga";
const string Acv22Content = "Modli³eœ siê do Innosa codziennie przez tydzieñ.";

const string Acv23Title   = "Magnat";
const string Acv23Content = "Odnalaz³eœ dobytek magnatów."; // rabowanie zamku - ka¿dy ma jaki artefakt albo coœ (Gomez, Kruk,Bartholo, Arto, Blizna)

const string Acv24Title   = "Mistrz myœlistwa";
const string Acv24Content = "Nauczy³eœ siê wszystkich trofeów.";

const string Acv25Title   = "Biegacz";
const string Acv25Content = "Przebieg³eœ 100 kilometrów.";
var int HeroMovedDistance;

const string Acv26Title   = "Strzelec";
const string Acv26Content = "Strzeli³eœ 500 razy z broni dystansowej.";

const string Acv27Title   = "RzeŸnik";
const string Acv27Content = "Wydoby³eœ 500 miês."; // jesli podnosi z ofiary w assess theft item = itfomuttonraw i nie ma flagi item dropped

const string Acv28Title   = "Alkoholik";
const string Acv28Content = "Wypi³eœ 30 butelek alkoholu.";

const string Acv29Title   = "Szczêœciarz";
const string Acv29Content = "Otworzy³eœ 5 skrzyñ zgaduj¹c kombinacjê od razu."; // TODO - uodporniæ to na wczytywanie

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