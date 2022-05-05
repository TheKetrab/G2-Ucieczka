func int IsAppGothic()
{	
	//sprawdzenie adresu PLAYER_MOB_MISSING_LOCKPICK w konstruktorze zSTRING unk_8C1EA8
	return MEM_ReadInt(4198848) == 2296151144;
};

//wywołane w InitPerception,które jest wywołane w silniku w oCNpc::InitStatics
func void InitStatics()
{
	const int inited = 0;
	
	if(!inited)
	{
		inited = 1;
		
		MEM_InitAll();

		//LeGo_Init(LeGo_All); crashuje spacera
		if(IsAppGothic())
		{
			//init lego przed init_global pozwala uniknąć błędów stack overflow
			//podczas wczytania gry
			LeGo_Init(LeGo_All);
			
			//Quickslot hide key
			MEM_CallByString("QS_DisableKeyInit");
		};
	};
};