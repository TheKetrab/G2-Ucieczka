

var int SKRZYNIA_LOWCY_1_Opened;
var int SKRZYNIA_LOWCY_2_Opened;
var int SKRZYNIA_LOWCY_3_Opened;
var int SKRZYNIA_LOWCY_4_Opened;
var int SKRZYNIA_LOWCY_5_Opened;
var int SKRZYNIA_LOWCY_6_Opened;
var int SKRZYNIA_LOWCY_7_Opened;

var int SKRZYNIA_MYSLIWI_1_Opened;
var int SKRZYNIA_MYSLIWI_2_Opened;
var int SKRZYNIA_MYSLIWI_3_Opened;
var int SKRZYNIA_MYSLIWI_4_Opened;
var int SKRZYNIA_MYSLIWI_5_Opened;

var int Achievement30OneTime;
func void CheckAllChests() {

	if (SKRZYNIA_LOWCY_1_Opened
	 && SKRZYNIA_LOWCY_2_Opened
	 && SKRZYNIA_LOWCY_3_Opened
	 && SKRZYNIA_LOWCY_4_Opened
	 && SKRZYNIA_LOWCY_5_Opened
	 && SKRZYNIA_LOWCY_6_Opened
	 && SKRZYNIA_LOWCY_7_Opened
	 && SKRZYNIA_MYSLIWI_1_Opened
	 && SKRZYNIA_MYSLIWI_2_Opened
	 && SKRZYNIA_MYSLIWI_3_Opened
	 && SKRZYNIA_MYSLIWI_4_Opened
	 && SKRZYNIA_MYSLIWI_5_Opened)
	{
	 if (Achievement30OneTime == FALSE) {
		Achievement30OneTime = TRUE;
		AddAchievement(30,Acv30Title,Acv30Content);
	 };
	 
	};

};


func void SKRZYNIA_LOWCY_1_S1() {
	if (!SKRZYNIA_LOWCY_1_Opened) {
		SKRZYNIA_LOWCY_1_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_LOWCY_2_S1() {
	if (!SKRZYNIA_LOWCY_2_Opened) {
		SKRZYNIA_LOWCY_2_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_LOWCY_3_S1() {
	if (!SKRZYNIA_LOWCY_3_Opened) {
		SKRZYNIA_LOWCY_3_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_LOWCY_4_S1() {
	if (!SKRZYNIA_LOWCY_4_Opened) {
		SKRZYNIA_LOWCY_4_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_LOWCY_5_S1() {
	if (!SKRZYNIA_LOWCY_5_Opened) {
		SKRZYNIA_LOWCY_5_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_LOWCY_6_S1() {
	if (!SKRZYNIA_LOWCY_6_Opened) {
		SKRZYNIA_LOWCY_6_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_LOWCY_7_S1() {
	if (!SKRZYNIA_LOWCY_7_Opened) {
		SKRZYNIA_LOWCY_7_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_MYSLIWI_1_S1() {
	if (!SKRZYNIA_MYSLIWI_1_Opened) {
		SKRZYNIA_MYSLIWI_1_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_MYSLIWI_2_S1() {
	if (!SKRZYNIA_MYSLIWI_2_Opened) {
		SKRZYNIA_MYSLIWI_2_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_MYSLIWI_3_S1() {
	if (!SKRZYNIA_MYSLIWI_3_Opened) {
		SKRZYNIA_MYSLIWI_3_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_MYSLIWI_4_S1() {
	if (!SKRZYNIA_MYSLIWI_4_Opened) {
		SKRZYNIA_MYSLIWI_4_Opened = TRUE;
		CheckAllChests();
	};
};

func void SKRZYNIA_MYSLIWI_5_S1() {
	if (!SKRZYNIA_MYSLIWI_5_Opened) {
		SKRZYNIA_MYSLIWI_5_Opened = TRUE;
		CheckAllChests();
	};
};
