// ----- ----- ----- ----- -----
//         RandomMenu
// ----- ----- ----- ----- -----
// LOAD__x -> x oznacza, ze recznie zmienilem
// rozdzielczosc z 1440x900 na 1024x1024

Func void LoadTexRandom ()
{
	
	var int random; random = Hlp_Random (20); random += 1;
    
    if (random == 1)
    {
		SetLoadTexName ("LOAD1X.tga");
    };
	if (random == 2)
    {
		SetLoadTexName ("LOAD2X.TGA");
    };
 	if (random == 3)
    {
		SetLoadTexName ("LOAD3X.TGA");
    };
	if (random == 4)
    {
		SetLoadTexName ("LOAD4X.TGA");
    };
	if (random == 5)
    {
		SetLoadTexName ("LOAD5X.tga");
    };
    if (random == 6)
    {
		SetLoadTexName ("LOAD6X.TGA");
    };
	if (random == 7)
    {
		SetLoadTexName ("LOAD7X.TGA");
    };
 	if (random == 8)
    {
		SetLoadTexName ("LOAD8X.TGA");
    };
	if (random == 9)
    {
		SetLoadTexName ("LOAD9X.TGA");
    };	
	if (random == 10)
    {
		SetLoadTexName ("LOAD10X.TGA");
    };
	if (random == 11)
    {
		SetLoadTexName ("LOAD11X.TGA");
    };	
	if (random == 12)
    {
		SetLoadTexName ("LOAD12X.TGA");
    };	
	if (random == 13)
    {
		SetLoadTexName ("LOAD13X.TGA");
    };	
	if (random == 14)
    {
		SetLoadTexName ("LOAD14X.TGA");
    };	
	if (random == 15)
    {
		SetLoadTexName ("LOAD15X.TGA");
    };	
	if (random == 16)
    {
		SetLoadTexName ("LOAD16X.TGA");
    };	
	if (random == 17)
    {
		SetLoadTexName ("LOAD17X.TGA");
    };	
	if (random == 18)
    {
		SetLoadTexName ("LOAD18X.TGA");
    };	
	if (random == 19)
    {
		SetLoadTexName ("LOAD19X.TGA");
    };	
	if (random == 20)
    {
		SetLoadTexName ("LOAD20X.TGA");
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