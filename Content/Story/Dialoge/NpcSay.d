func void HeroSay_OrcCity_Portal() {
	AI_Output (hero ,hero,"DIA_Will_OrcCityEnd_15_00"); //Hmmm... Monastir i inni powinni ruszy� za mn�. Tak si� umawiali�my.
	AI_Output (hero ,hero,"DIA_Will_OrcCityEnd_15_01"); //A wi�c teraz musz� wypr�bowa� portal...
};


func void HeroSay_OpenGate() {

	var int random; random = Hlp_Random (4);

	if (random == 0 || random == 1) {
		AI_Output (hero ,hero,"DIA_Will_GateMysliwi_15_00"); //Otworzy� bram�!
	}
	else if (random == 2) {
		AI_Output (hero ,hero,"DIA_Will_GateMysliwi_15_01"); //Hej, otw�rzcie!
	}
	else if (random == 3) {
		AI_Output (hero ,hero,"DIA_Will_GateMysliwi_15_02"); //Otw�rzcie mi!
	};
};

func void Will_Zapalisada() {
	AI_Output (hero ,hero,"DIA_Will_ZaPalisada_15_00"); //No prosz�. Ciekawe, ilu ork�w tu przebywa.
};

func void HeroSay_TakeThisPotion() {
	AI_Output (other,self ,"HeroSay_TakeThisPotion_15_00"); //We� t� mikstur� uzdrawiaj�c�.
};

func void HeroSay_SusanImmortal() {
	// G2U12: nie ai_output, bo hero przestawa� wtedy walczy�
	Snd_Play("SVM_WILL_SUSAN"); // Ten duch emanuje pot�n� energi� i wydaje si� by� oboj�tny na zadawane przeze mnie ciosy. Lepiej b�dzie, je�li go zostawi�...	
};

func void HeroSay_TakeThisMeal() {
	AI_Output (other,self ,"HeroSay_TakeThisMeal_15_00"); //Zjedz to, odzyskasz si�y.
};

func void HeroSay_NoHolyWater() {
	AI_Output (hero, hero,"DIA_NASZ_FunkcjaGrave_55_00"); //Nie mam wody �wi�conej.
};


func void HeroSay_PotrzebujeGwozdzi() {
	AI_Output (hero, hero,"DIA_NASZ_Deski_55_00"); //Potrzebuj� gwo�dzi.
};


func void HeroSay_FunkcjaPrzelecz() {
	AI_Output (hero, hero,"DIA_NASZ_FunkcjaPrzelecz_55_00"); //Jaka� magiczna aura blokuje dost�p do skrzyni...
};

func void HeroSay_FunkcjaTrolls() {
	AI_Output (hero, hero,"DIA_NASZ_FunkcjaTrolls_55_00"); //Mechanizm si� zaci��...
};

func void HeroSayIMissedYou() {
	AI_Output (other, self,"DIA_HeroSayIMissedYou_15_00"); //A ja za moimi kumplami. Dlatego przyszed�em was zabi�.
};


func void HeroSay_OrcSeenMe() {
	AI_Output (hero, hero,"DIA_HeroSay_OrcSeenMe_15_00"); //Nie dam rady, jest ich zbyt du�o!
};

func void HeroSay_Dymoondo() {
	AI_Output (hero ,hero,"DIA_Will_Dymoondo_15_00"); //A wi�c da si� tutaj dosta�...
};

func void HeroSay_Twierdza() {
	AI_Output (hero ,hero,"DIA_Will_Twierdza_15_00"); //A c� to za twierdza? Pot�na budowla...
};

func void HeroSay_DemonPosag() {
	AI_Output (hero ,hero,"DIA_Will_DemonPosag_15_00"); //Ten pos�g wydaje si� by� przepe�niony czarn� magi�.
};

func void HeroSay_Wodospad() {
	AI_Output (hero ,hero,"DIA_Will_Wodospad_15_00"); //To z�y pomys�. Tam mo�e by� niebezpiecznie.
};

func void HeroSay_BeforeZapalisada() {
	AI_Output (hero ,hero,"DIA_Will_Zapalsada_15_00"); //Lepiej za�atwi� jeszcze kilka spraw, zanim udam si� za palisad�.
};

func void HeroSay_NaSkaly() {
	AI_Output (hero ,hero,"DIA_Will_KopalniaUcieka_15_00"); //Rzeczywi�cie, uda�o si� wspi�� na ska�y. Teraz na d�!
};

func void HeroSay_IceRegion() {
	AI_Output (hero ,hero,"DIA_Will_Iceregion_15_00"); //Na tym terenie jest zbyt niebezpiecznie.
};

func void HeroSay_DraconianClosed() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_00"); //Cholera, zamkni�te. B�d� musia� jako� obej�� t� bram�.
};

func void HeroSay_DraconianInside() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_01"); //Przedosta�em si� do �rodka. Co dalej?
};

func void HeroSay_DraconianCave() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_02"); //Tam, u �r�d�a wodospadu jest jaka� jaskinia. Ciekawe...
};

func void HeroSay_CrossedWeapons() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_03"); //Skrzy�owane miecze!
};

func void HeroSay_MeetDanny() {
	AI_Output (hero ,hero,"DIA_Will_Danny_15_00"); //Lepiej �ci�gn� zbroj� bandyty. B�d� m�g� porozmawia� z Dannym.
};