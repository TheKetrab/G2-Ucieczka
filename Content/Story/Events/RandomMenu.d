// ----- ----- ----- ----- -----
//         RandomMenu
// ----- ----- ----- ----- -----
// LOAD__x -> x oznacza, ze recznie zmienilem
// rozdzielczosc z 1440x900 na 1024x1024

const int LOAD_TEX_CNT = 21;
func void LoadTexRandom()
{
	var int random; random = Hlp_Random(LOAD_TEX_CNT); random += 1;

	if (KAPITEL >= 4 && random == 2) {
		return; // od 4 rozdzialu zamek przejmuja ludzie
	};

    var string texName;
	texName = ConcatStrings("LOAD",
		ConcatStrings(IntToString(random),"X.TGA"));

	SetLoadTexName(texName);
};

func void SaveTexRandom()
{	
	var int kapi; kapi = _Uclamp(1, KAPITEL, 5);

    var string texName;
	
	texName = ConcatStrings("SAVE",
		ConcatStrings(IntToString(kapi),".TGA"));

	SetSaveTexName(texName);
};

const int oCGame__LoadGame = 7103904;
const int oCGame__LoadSavegame = 7104464;
const int oCGame__OpenSavescreen = 7086672; // 0x006C2250 (7)

func void RandomScreen_Init()
{
	const int init = 0;
	if(!init)
	{
		HookEngineF(oCGame__LoadGame,5,LoadTexRandom);
		HookEngineF(oCGame__LoadSavegame,7,LoadTexRandom);
		HookEngineF(oCGame__OpenSavescreen,7,SaveTexRandom);
		init = 1;
	};
	
};