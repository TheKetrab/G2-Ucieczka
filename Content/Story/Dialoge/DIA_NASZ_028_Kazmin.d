
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
		Print("Magia potwora zak³óci³a dzia³anie zaklêcia.");
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
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_00"); //Nareszcie siê spotykamy. Zastanawia³em siê, jak d³ugo jeszcze zajmie ci wykonywanie zadañ dla tych sekciarzy, aby siê do mnie dostaæ.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_01"); //Mam nadziejê, œmiertelna istoto, ¿e twoja ciekawoœæ zosta³a ostatecznie zaspokojona? W koñcu dotar³eœ do celu, który sobie wyznaczy³eœ.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_02"); //Stoisz tu przede mn¹ z zamiarem dokonania os¹du za tych, którzy jako duchy b³¹kaj¹ siê, po obozie czuj¹c wieczny ból i cierpienie.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_15_03"); //Dlaczego im to zrobi³eœ? Czy wy, demony, istniejecie jedynie po to, aby siaæ zniszczenie i œmieræ?
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_04"); //Je¿eli tak uwa¿asz, to jesteœ naprawdê ograniczon¹ istot¹, cz³owieku. Nie ka¿dy demon chce zniszczyæ œwiat. Nie ka¿dy demon jest bezmyœln¹ machin¹ do zabijania.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_05"); //Gdybym by³ taki jak reszta moich braci, ju¿ dawno le¿a³byœ na posadzce zbieraj¹c swoje flaki.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_06"); //Mój pan, w którego wierzyli tutejsi ludzie, nakaza³ mi, abym przez tysi¹ce lat skazywa³ ich dusze na cierpienie.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_07"); //Lecz sprzeciwi³em mu siê. Jest s³aby i nie zas³uguje na swoje dotychczasowe miano, skoro pokona³ go zwyk³y œmiertelnik.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_08"); //Od tamtej pory trzymam tutejszych ludzi na granicy pomiêdzy œmierci¹ i ¿yciem, gdy¿ przez swoje bluŸnierstwa nie zas³uguj¹ na nic innego.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_09"); //Nie skazuje œmiertelników na cierpienie bez powodu, ale ci tutaj, grzeszyli, odrzucaj¹c innych bogów i ³udzili siê, i¿ demon mo¿e wskazaæ im drogê ku wolnoœci.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_10"); //Gro z ich braci b³¹ka siê teraz po œwiecie. Ich twarze zakrywaj¹ kaptury spomiêdzy których mo¿na dostrzec czerwone maski.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_11"); //Wielu z nich umar³o, wielu nadal ¿yje pomimo tego, i¿ ich pan zosta³ ostatecznie pokonany.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_12"); //Czy cierpi¹? Owszem, nie maj¹ celu w swoim istnieniu, stracili go w chwili, kiedy poddali siê purpurowemu mrokowi.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_13"); //Mo¿na wiêc powiedzieæ, ¿e ja ratujê tutejszych ludzi od cierpienia i ¿a³osnego losu bycia marionetkami.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_15_14"); //A te wszystkie ataki nieumar³ych? Ta plaga, która rozlewa siê po Górniczej Dolinie to te¿ twoja sprawka?
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_15_15"); //Mówisz, ¿e bezmyœlnie nie skazujesz ludzi na œmieræ, tymczasem w Dolinie wielu z nich umiera od ostrza nieumar³ych s³ug.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_16"); //Nie mam wp³ywu na to, co robi¹ nieumarli, to jest dywersja mojego Pana, który pomimo wygnania, wci¹¿ ma doœæ si³y, aby móc ingerowaæ w ten œwiat.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_17"); //W jego trzewiach pa³a ¿¹dza zemsty za to, ¿e tak jak mieszkañcy tutejszego obozu ja równie¿ sprzeciwi³em siê jego woli.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_18"); //Wszelakie trupy, jakie wa³êsaj¹ siê po waszym œwiecie, mia³y ciê tutaj jedynie przyprowadziæ, abyœ mnie zabi³. Zabi³ ku uciesze tego, kto by³ najwiêkszym z³em.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_19"); //Naprawdê myœlisz, ¿e przez tak d³ugi okres pobytu tutaj, dopiero teraz wpad³bym na taki pomys³? Gdybym chcia³ zmieniæ wasze ¿ycie w piek³o, ju¿ dawno bym to zrobi³.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_028_20"); //Bardziej ciekawi mnie co zamierzasz zrobiæ œmiertelniku.
		
	
	Info_ClearChoices	(DIA_NASZ_028_Kazmin_Spotkanie);
	Info_AddChoice		(DIA_NASZ_028_Kazmin_Spotkanie, "Chyba siê z tob¹ zgadzam. Razem z tob¹ chcê zniszczyæ bogów." ,DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie);
	Info_AddChoice		(DIA_NASZ_028_Kazmin_Spotkanie, "Odetnê twoje skrzyd³a i zetnê g³owê, któr¹ oddam duchom."	,DIA_NASZ_028_Kazmin_Spotkanie_Odmowa);
};

func void DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie()
{
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_00"); //Chyba siê z tob¹ zgadzam. Razem z tob¹ chcê zniszczyæ bogów.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_01"); //Nie zawiod³eœ mnie, m³ody poszukiwaczu pokoju. Wkrótce przekonasz siê, ¿e œwiat bez bogów jest prawdziwszy, piêkniejszy.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_02"); //Jednak aby siê to sta³o, potrzebujemy po³¹czyæ nasze dusze. Demon, cz³owiek, ork i o¿ywieniec.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_03"); //Mam tutaj miksturê, w której zmieszane s¹ ju¿ trzy gatunki. Potrzeba tylko ludzkiej czêœci i w³aœnie dlatego czekamy tutaj na ciebie.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_04"); //Wypij to, a bêdziemy gotowi stan¹æ przeciwko bogom. Jednak pamiêtaj: Musisz tego bardzo chcieæ, gdy¿ inaczej magia nie zadzia³a.
	
	CreateInvItems(self,ItNa_PoteznyWywar,1);
	B_GiveInvItems(self,other,ItNa_PoteznyWywar,1);
	AI_UseItem(hero,ItNa_PoteznyWywar);
	hero.attribute[ATR_HITPOINTS] /= 3; // zmniejsza hp o dwie trzecie tego co sie ma

	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_05"); //Aaargh! Co siê ze mn¹ sta³o?!
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_06"); //To tylko chwilowe os³abienie. ALE NIE ZD¥¯YSZ JU¯ SIÊ POZBIERAÆ! ZARAZ NADEJDZIE ZAÆMIENIE, A JA WYKORZYSTAM TEN CZAS, BY STAÆ SIÊ NOWYM BOGIEM!
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_07"); //O co chodzi z tym ca³ym zaæmieniem?
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Przyjecie_15_08"); //Zaæmienie to oczyszczenie œwiata. Œmieræ bogów, któr¹ zamierzam wykorzystaæ, by stworzyæ nowy porz¹dek. Nie jesteœ mi ju¿ potrzebny. Odda³eœ swoj¹ duszê. Zdychaj, cz³owieczku.
	
	B_GivePlayerXP(300);

	Info_ClearChoices	(DIA_NASZ_028_Kazmin_Spotkanie);
};

func void DIA_NASZ_028_Kazmin_Spotkanie_Odmowa()
{

	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_00"); //Odetnê twoje skrzyd³a i zetnê g³owê, któr¹ oddam duchom.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_01"); //A oni zaznaj¹ spokoju i poznaj¹ prawdziwego boga: Innosa.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_02"); //Rozczarowa³eœ mnie, g³upi œmiertelniku. Przez tyle czasu utrzymywa³em ciê przy ¿yciu, a ty nie potrafisz tego doceniæ.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_03"); //Mylisz strony i wierzysz w bóstwa, które s¹ s³abe i sk³ócone same ze sob¹. To my jesteœmy w³adcami tego œwiata. Ludzie, demony, o¿ywieñcy i orkowie.
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_04"); //To od nas zale¿y, kto ¿yje a kto nie. Kogo zabijemy, a kogo zostawimy przy ¿yciu. Czy naprawdê myœlisz, ¿e to Innos, Adanos czy te¿ Beliar siê tob¹ opiekuj¹?
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_05"); //I dlatego chcesz doprowadziæ do zaæmienia?
	AI_Output (self, other,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_06"); //Nie masz pojêcia, czym jest zaæmienie, g³upi cz³owieczku. Zaæmienie, to oczyszczenie. Reset œwiata. Œmieræ bogów i lepszy œwiat.
	AI_Output (other, self,"DIA_NASZ_028_Kazmin_Spotkanie_Odmowa_15_07"); //Wed³ug jednego z magów, zaæmienie to czas ciemnoœci i w³adzy demonów. Nie pozwolê na to!

	B_GivePlayerXP(300);

	Info_ClearChoices	(DIA_NASZ_028_Kazmin_Spotkanie);
};

