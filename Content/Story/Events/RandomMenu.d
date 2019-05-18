
Func void LoadTexRandom ()
{
    var int random; random = Hlp_Random (4); random += 1;

    if (random == 1)
    {
		SetLoadTexName ("LOAD1.tga");
    };
	if (random == 2)
    {
		SetLoadTexName ("LOAD2.TGA");
    };
 	if (random == 3)
    {
		SetLoadTexName ("LOAD3.TGA");
    };
	if (random == 4)
    {
		SetLoadTexName ("LOAD4.TGA");
    };
	if (random == 5)
    {
		SetLoadTexName ("LOAD5.tga");
    };
    if (random == 6)
    {
		SetLoadTexName ("LOAD6.TGA");
    };
	if (random == 7)
    {
		SetLoadTexName ("LOAD7.TGA");
    };
 	if (random == 8)
    {
		SetLoadTexName ("LOAD8.TGA");
    };
	if (random == 9)
    {
		SetLoadTexName ("LOAD9.TGA");
    };	
	if (random == 10)
    {
		SetLoadTexName ("LOAD10.TGA");
    };
	if (random == 11)
    {
		SetLoadTexName ("LOAD11.TGA");
    };	
	if (random == 12)
    {
		SetLoadTexName ("LOAD12.TGA");
    };	
	if (random == 13)
    {
		SetLoadTexName ("LOAD13.TGA");
    };	
	if (random == 14)
    {
		SetLoadTexName ("LOAD14.TGA");
    };	
	if (random == 15)
    {
		SetLoadTexName ("LOAD15.TGA");
    };	
	if (random == 16)
    {
		SetLoadTexName ("LOAD16.TGA");
    };	
	if (random == 17)
    {
		SetLoadTexName ("LOAD17.TGA");
    };	
	if (random == 18)
    {
		SetLoadTexName ("LOAD18.TGA");
    };	
	if (random == 19)
    {
		SetLoadTexName ("LOAD19.TGA");
    };	
	if (random == 20)
    {
		SetLoadTexName ("LOAD20.TGA");
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