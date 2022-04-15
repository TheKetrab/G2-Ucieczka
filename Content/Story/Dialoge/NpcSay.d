func void HeroSay_OrcCity_Portal() {
	AI_Output (hero ,hero,"DIA_Will_OrcCityEnd_15_00"); //Hmmm... Monastir i inni powinni ruszyæ za mn¹. Tak siê umawialiœmy.
	AI_Output (hero ,hero,"DIA_Will_OrcCityEnd_15_01"); //A wiêc teraz muszê wypróbowaæ portal...
};


func void HeroSay_OpenGate() {

	var int random; random = Hlp_Random (4);

	if (random == 0 || random == 1) {
		AI_Output (hero ,hero,"DIA_Will_GateMysliwi_15_00"); //Otworzyæ bramê!
	}
	else if (random == 2) {
		AI_Output (hero ,hero,"DIA_Will_GateMysliwi_15_01"); //Hej, otwórzcie!
	}
	else if (random == 3) {
		AI_Output (hero ,hero,"DIA_Will_GateMysliwi_15_02"); //Otwórzcie mi!
	};
};

func void Will_Zapalisada() {
	AI_Output (hero ,hero,"DIA_Will_ZaPalisada_15_00"); //No proszê. Ciekawe, ilu orków tu przebywa.
};

func void HeroSay_TakeThisPotion() {
	AI_Output (other,self ,"HeroSay_TakeThisPotion_15_00"); //WeŸ tê miksturê uzdrawiaj¹c¹.
};

func void HeroSay_SusanImmortal() {
	// G2U12: nie ai_output, bo hero przestawa³ wtedy walczyæ
	Snd_Play("SVM_WILL_SUSAN"); // Ten duch emanuje potê¿n¹ energi¹ i wydaje siê byæ obojêtny na zadawane przeze mnie ciosy. Lepiej bêdzie, jeœli go zostawiê...	
};

func void HeroSay_TakeThisMeal() {
	AI_Output (other,self ,"HeroSay_TakeThisMeal_15_00"); //Zjedz to, odzyskasz si³y.
};

func void HeroSay_NoHolyWater() {
	AI_Output (hero, hero,"DIA_NASZ_FunkcjaGrave_55_00"); //Nie mam wody œwiêconej.
};


func void HeroSay_PotrzebujeGwozdzi() {
	AI_Output (hero, hero,"DIA_NASZ_Deski_55_00"); //Potrzebujê gwoŸdzi.
};


func void HeroSay_FunkcjaPrzelecz() {
	AI_Output (hero, hero,"DIA_NASZ_FunkcjaPrzelecz_55_00"); //Jakaœ magiczna aura blokuje dostêp do skrzyni...
};

func void HeroSay_FunkcjaTrolls() {
	AI_Output (hero, hero,"DIA_NASZ_FunkcjaTrolls_55_00"); //Mechanizm siê zaci¹³...
};

func void HeroSayIMissedYou() {
	AI_Output (other, self,"DIA_HeroSayIMissedYou_15_00"); //A ja za moimi kumplami. Dlatego przyszed³em was zabiæ.
};


func void HeroSay_OrcSeenMe() {
	AI_Output (hero, hero,"DIA_HeroSay_OrcSeenMe_15_00"); //Nie dam rady, jest ich zbyt du¿o!
};

func void HeroSay_Dymoondo() {
	AI_Output (hero ,hero,"DIA_Will_Dymoondo_15_00"); //A wiêc da siê tutaj dostaæ...
};

func void HeroSay_Twierdza() {
	AI_Output (hero ,hero,"DIA_Will_Twierdza_15_00"); //A có¿ to za twierdza? Potê¿na budowla...
};

func void HeroSay_DemonPosag() {
	AI_Output (hero ,hero,"DIA_Will_DemonPosag_15_00"); //Ten pos¹g wydaje siê byæ przepe³niony czarn¹ magi¹.
};

func void HeroSay_Wodospad() {
	AI_Output (hero ,hero,"DIA_Will_Wodospad_15_00"); //To z³y pomys³. Tam mo¿e byæ niebezpiecznie.
};

func void HeroSay_BeforeZapalisada() {
	AI_Output (hero ,hero,"DIA_Will_Zapalsada_15_00"); //Lepiej za³atwiê jeszcze kilka spraw, zanim udam siê za palisadê.
};

func void HeroSay_NaSkaly() {
	AI_Output (hero ,hero,"DIA_Will_KopalniaUcieka_15_00"); //Rzeczywiœcie, uda³o siê wspi¹æ na ska³y. Teraz na dó³!
};

func void HeroSay_IceRegion() {
	AI_Output (hero ,hero,"DIA_Will_Iceregion_15_00"); //Na tym terenie jest zbyt niebezpiecznie.
};

func void HeroSay_DraconianClosed() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_00"); //Cholera, zamkniête. Bêdê musia³ jakoœ obejœæ tê bramê.
};

func void HeroSay_DraconianInside() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_01"); //Przedosta³em siê do œrodka. Co dalej?
};

func void HeroSay_DraconianCave() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_02"); //Tam, u Ÿród³a wodospadu jest jakaœ jaskinia. Ciekawe...
};

func void HeroSay_CrossedWeapons() {
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_03"); //Skrzy¿owane miecze!
};

func void HeroSay_MeetDanny() {
	AI_Output (hero ,hero,"DIA_Will_Danny_15_00"); //Lepiej œci¹gnê zbrojê bandyty. Bêdê móg³ porozmawiaæ z Dannym.
};