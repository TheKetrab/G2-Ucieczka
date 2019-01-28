// TODO: Screen wczytywania: 'Powalenie przeciwnika, to nie jedyny sposób na zwycięstwo na arenie' i do tego screen jak podczas walki wychodzicie poza arene
// TODO: Screen wczytywania: coś o tym, że kraść można jeśli się skradasz, jest noc i nikogo nie ma w poblizu
// TODO: Screen wczytywania: Vachut przy patelni: aby usmazyc cos na patelni potrzebujesz wegla
// TODO: Screen wczytywania: Johny siedzący na ławce. 'Odwiedzaj od czasu do czasu znajomych kupców, by sprawdzić, czy nie mają jakichś nowych towarów.'

Func void LoadTexRandom ()
{
    var int random; random = Hlp_Random (12);

    if (random == 0)
    {
		//SetLoadTexName ("LOAD1.tga"); TODO: Load1
    };
    if (random == 1)
    {
	SetLoadTexName ("LOAD2.TGA");
    };
	if (random == 2)
    {
		SetLoadTexName ("LOAD3.TGA");
    };
 	if (random == 3)
    {
		SetLoadTexName ("LOAD4.TGA");
    };
	if (random == 4)
    {
		SetLoadTexName ("LOAD5.TGA");
    };
	if (random == 5)
    {
		SetLoadTexName ("LOAD6.tga");
    };
    if (random == 6)
    {
		SetLoadTexName ("LOAD7.TGA");
    };
	if (random == 7)
    {
		SetLoadTexName ("LOAD8.TGA");
    };
 	if (random == 8)
    {
		SetLoadTexName ("LOAD9.TGA");
    };
	if (random == 9)
    {
		SetLoadTexName ("LOAD10.TGA");
    };	
	if (random == 10)
    {
		SetLoadTexName ("LOAD11.TGA");
    };
	if (random == 11)
    {
		SetLoadTexName ("LOAD12.TGA");
    };	
};

const int oCGame__LoadGame = 7103904;
const int oCGame__LoadSavegame = 7104464;

func void RandomScreen_Init()
{
	const int init = 0;
	if(!init)
	{
		HookEngineF(oCGame__LoadGame,5,LoadTexRandom);
		HookEngineF(oCGame__LoadSavegame,7,LoadTexRandom);
		init = 1;
	};
	
};