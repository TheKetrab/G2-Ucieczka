
func void KAZMIN_GATE_DEAD() {

	if (Npc_IsPlayer(self) && WillMozeIscDoKazmina == FALSE) {
		B_KillNpc(self);
	};

};



//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_028_Kazmin_EXIT   (C_INFO)
{
	npc         = NASZ_028_Kazmin;
	nr          = 999;
	condition   = DIA_NASZ_028_Kazmin_EXIT_Condition;
	information = DIA_NASZ_028_Kazmin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_028_Kazmin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_028_Kazmin_EXIT_Info()
{
	AI_StopProcessInfos (self);
	//Npc_PercDisable  		(self, 	PERC_ASSESSPLAYER);
	//Npc_PercDisable			(self,	PERC_ASSESSTALK);
	self.npctype = 0;
	self.start_aistate				= ZS_MM_AllScheduler;
	Npc_SetTempAttitude (self, ATT_HOSTILE);
	NPC_SetTarget(self, other);
	B_Attack (self, other, AR_KILL, -1);
	if(secSkaluj > 0 && FF_ACTIVE(secPrzywrocenieWielkosci))
	{
		WillPowiekszony = FALSE;
		Mdl_SetModelScale(hero,	1.00,	1.00, 	1.00);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RED",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play ("DEM_AMBIENT01"); 
		secSkaluj = 0;
		hero.aivar[AIV_MM_ShrinkState] = 0;
		ff_Remove(secPrzywrocenieWielkosci);
		Print("Magia potwora zak��ci�a dzia�anie zakl�cia.");
	};

};

//*********************************************************************
//	Info Spotkanie
//*********************************************************************
INSTANCE DIA_NASZ_028_Kazmin_Spotkanie   (C_INFO)
{
	npc         = NASZ_028_Kazmin;
 	nr          = 1;
 	condition   = DIA_NASZ_028_Kazmin_Spotkanie_Condition;
 	information = DIA_NASZ_028_Kazmin_Spotkanie_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_028_Kazmin_Spotkanie_Condition()
{
	if (WillMozeIscDoKazmina == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_028_Kazmin_Spotkanie_Info()
{
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_00"); //Nareszcie si� spotykamy. Zastanawia�em si�, jak d�ugo jeszcze zajmie ci wykonywanie zada� dla tych sekciarzy, aby si� do mnie dosta�.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_01"); //Mam nadziej�, �miertelna istoto, �e twoja ciekawo�� zosta�a ostatecznie zaspokojona? W ko�cu dotar�e� do celu, kt�ry sobie wyznaczy�e�.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_02"); //Stoisz tu przede mn� z zamiarem dokonania os�du za tych, kt�rzy jako duchy b��kaj� si�, po obozie czuj�c wieczny b�l i cierpienie.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_15_03"); //Dlaczego im to zrobi�e�? Czy wy, demony, istniejecie jedynie po to, aby sia� zniszczenie i �mier�?
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_04"); //Je�eli tak uwa�asz, to jeste� naprawd� ograniczon� istot�, cz�owieku. Nie ka�dy demon chce zniszczy� �wiat. Nie ka�dy demon jest bezmy�ln� machin� do zabijania.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_05"); //Gdybym by� taki jak reszta moich braci, ju� dawno le�a�by� na posadzce zbieraj�c swoje flaki.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_06"); //M�j pan, w kt�rego wierzyli tutejsi ludzie, nakaza� mi, abym przez tysi�ce lat skazywa� ich dusze na cierpienie.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_07"); //Lecz sprzeciwi�em mu si�. Jest s�aby i nie zas�uguje na swoje dotychczasowe miano, skoro pokona� go zwyk�y �miertelnik.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_08"); //Od tamtej pory trzymam tutejszych ludzi na granicy pomi�dzy �mierci� i �yciem, gdy� przez swoje blu�nierstwa nie zas�uguj� na nic innego.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_09"); //Nie skazuje �miertelnik�w na cierpienie bez powodu, ale ci tutaj, grzeszyli, odrzucaj�c innych bog�w i �udzili si�, i� demon mo�e wskaza� im drog� ku wolno�ci.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_10"); //Gro z ich braci b��ka si� teraz po �wiecie. Ich twarze zakrywaj� kaptury spomi�dzy kt�rych mo�na dostrzec czerwone maski.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_11"); //Wielu z nich umar�o, wielu nadal �yje pomimo tego, i� ich pan zosta� ostatecznie pokonany.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_12"); //Czy cierpi�? Owszem, nie maj� celu w swoim istnieniu, stracili go w chwili, kiedy poddali si� purpurowemu mrokowi.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_13"); //Mo�na wi�c powiedzie�, �e ja ratuj� tutejszych ludzi od cierpienia i �a�osnego losu bycia marionetkami.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_15_14"); //A te wszystkie ataki nieumar�ych? Ta plaga, kt�ra rozlewa si� po G�rniczej Dolinie to te� twoja sprawka?
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_15_15"); //M�wisz, �e bezmy�lnie nie skazujesz ludzi na �mier�, tymczasem w Dolinie wielu z nich umiera od ostrza nieumar�ych s�ug.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_16"); //Nie mam wp�ywu na to, co robi� nieumarli, to jest dywersja mojego Pana, kt�ry pomimo wygnania, wci�� ma do�� si�y, aby m�c ingerowa� w ten �wiat.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_17"); //W jego trzewiach pa�a ��dza zemsty za to, �e tak jak mieszka�cy tutejszego obozu ja r�wnie� sprzeciwi�em si� jego woli.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_18"); //Wszelakie trupy, jakie wa��saj� si� po waszym �wiecie, mia�y ci� tutaj jedynie przyprowadzi�, aby� mnie zabi�. Zabi� ku uciesze tego, kto by� najwi�kszym z�em.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_19"); //Naprawd� my�lisz, �e przez tak d�ugi okres pobytu tutaj, dopiero teraz wpad�bym na taki pomys�? Gdybym chcia� zmieni� wasze �ycie w piek�o, ju� dawno bym to zrobi�.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_20"); //Bardziej ciekawi mnie co zamierzasz zrobi� �miertelniku.
		
	
	Info_ClearChoices	(DIA_NASZ_028_Kazmin_Spotkanie);
	Info_AddChoice		(DIA_NASZ_028_Kazmin_Spotkanie, "Chyba si� z tob� zgadzam. Razem z tob� chc� zniszczy� bog�w." ,DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie);
	Info_AddChoice		(DIA_NASZ_028_Kazmin_Spotkanie, "Odetn� twoje skrzyd�a i zetn� g�ow�, kt�r� oddam duchom."	,DIA_NASZ_028_Kazmin_Spotkanie_Odmowa);
};

func void DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie()
{
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_00"); //Chyba si� z tob� zgadzam. Razem z tob� chc� zniszczy� bog�w.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_01"); //Nie zawiod�e� mnie, m�ody poszukiwaczu pokoju. Wkr�tce przekonasz si�, �e �wiat bez bog�w jest prawdziwszy, pi�kniejszy.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_02"); //Jednak aby si� to sta�o, potrzebujemy po��czy� nasze dusze. Demon, cz�owiek, ork i o�ywieniec.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_03"); //Mam tutaj mikstur�, w kt�rej zmieszane s� ju� trzy gatunki. Potrzeba tylko ludzkiej cz�ci i w�a�nie dlatego czekamy tutaj na ciebie.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_04"); //Wypij to, a b�dziemy gotowi stan�� przeciwko bogom. Jednak pami�taj: Musisz tego bardzo chcie�, gdy� inaczej magia nie zadzia�a.
	
	CreateInvItems(self,ItNa_PoteznyWywar,1);
	B_GiveInvItems(self,other,ItNa_PoteznyWywar,1);
	AI_UseItem(hero,ItNa_PoteznyWywar);
	hero.attribute[ATR_HITPOINTS] /= 3; // zmniejsza hp o dwie trzecie tego co sie ma

	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_05"); //Aaargh! Co si� ze mn� sta�o?!
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_06"); //To tylko chwilowe os�abienie. ALE NIE ZD��YSZ JU� SI� POZBIERA�! ZARAZ NADEJDZIE ZA�MIENIE, A JA WYKORZYSTAM TEN CZAS, BY STA� SI� NOWYM BOGIEM!
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_07"); //O co chodzi z tym ca�ym za�mieniem?
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_08"); //Za�mienie to oczyszczenie �wiata. �mier� bog�w, kt�r� zamierzam wykorzysta�, by stworzy� nowy porz�dek. Nie jeste� mi ju� potrzebny. Odda�e� swoj� dusz�. Zdychaj, cz�owieczku.
	
	B_GivePlayerXP(300);

	Info_ClearChoices	(DIA_NASZ_028_Kazmin_Spotkanie);
};

func void DIA_NASZ_028_Kazmin_Spotkanie_Odmowa()
{

	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_00"); //Odetn� twoje skrzyd�a i zetn� g�ow�, kt�r� oddam duchom.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_01"); //A oni zaznaj� spokoju i poznaj� prawdziwego boga: Innosa.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_02"); //Rozczarowa�e� mnie, g�upi �miertelniku. Przez tyle czasu utrzymywa�em ci� przy �yciu, a ty nie potrafisz tego doceni�.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_03"); //Mylisz strony i wierzysz w b�stwa, kt�re s� s�abe i sk��cone same ze sob�. To my jeste�my w�adcami tego �wiata. Ludzie, demony, o�ywie�cy i orkowie.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_04"); //To od nas zale�y, kto �yje a kto nie. Kogo zabijemy, a kogo zostawimy przy �yciu. Czy naprawd� my�lisz, �e to Innos, Adanos czy te� Beliar si� tob� opiekuj�?
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_05"); //I dlatego chcesz doprowadzi� do za�mienia?
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_06"); //Nie masz poj�cia, czym jest za�mienie, g�upi cz�owieczku. Za�mienie, to oczyszczenie. Reset �wiata. �mier� bog�w i lepszy �wiat.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_07"); //Wed�ug jednego z mag�w, za�mienie to czas ciemno�ci i w�adzy demon�w. Nie pozwol� na to!

	B_GivePlayerXP(300);

	Info_ClearChoices	(DIA_NASZ_028_Kazmin_Spotkanie);
};

