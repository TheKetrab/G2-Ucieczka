const int MENU_OPTGAME_DY = 425;
const int MENU_OPTGAME_START_Y = 1800;

instance MENU_OPT_GAME(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_GAME_HEADLINE";
	items[1] = "MENUITEM_GAME_SUB_TITLES";
	items[2] = "MENUITEM_GAME_SUB_TITLES_CHOICE";
	items[3] = "MENUITEM_GAME_FIGHTFOCUS";
	items[4] = "MENUITEM_GAME_FIGHTFOCUS_CHOICE";
	items[5] = "MENUITEM_GAME_INTERACTFOCUS";
	items[6] = "MENUITEM_GAME_INTERACTFOCUS_CHOICE";
	items[7] = "MENUITEM_GAME_LOOKAROUND_INVERSE";
	items[8] = "MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE";
	items[9] = "MENUITEM_M";
	items[10] = "MENUITEM_M_CHOICE";
	items[11] = "MENUITEM_MSENSITIVITY";
	items[12] = "MENUITEM_MSENSITIVITY_SLIDER";
	items[13] = "MENUITEM_GAME_OLDCONTROLS";
	items[14] = "MENUITEM_GAME_OLDCONTROLS_CHOICE";
	items[15] = "MENUITEM_OPT_GFA";
	items[16] = "MENUITEM_OPT_GFA_CHOICE";
	items[17] = "MENUITEM_OPT_JUSTICE";
	items[18] = "MENUITEM_OPT_JUSTICE_CHOICE";
	items[19] = "MENUITEM_OPT_LEVEL";
	items[20] = "MENUITEM_OPT_LEVEL_CHOICE";
	items[21] = "MENUITEM_OPT_DISABLEQUICKSLOT";
	items[22] = "MENUITEM_OPT_DISABLEQUICKSLOT_CHOICE";
	items[23] = "MENUITEM_GAME_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_GAME_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "USTAWIENIA GRY";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8100;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SUB_TITLES(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Podpisy";
	text[1] = "W³¹czenie/wy³¹czenie podpisów przy dialogach";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 0);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SUB_TITLES_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Tak";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 0) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "subTitles";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_FIGHTFOCUS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Oznaczanie celów";
	text[1] = "W³./wy³. wyró¿niania bierz¹cego celu w czasie walki";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 1);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_FIGHTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Okienko|Podœwietlenie|Oba";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 1) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "highlightMeleeFocus";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_INTERACTFOCUS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Podœwietlanie obiektów";
	text[1] = "W³./wy³. podœwietlania przedmiotów w polu widzenia";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 2);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INTERACTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Tak";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 2) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "highlightInteractFocus";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_LOOKAROUND_INVERSE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Zmiana pracy kamery";
	text[1] = "W³¹czenie/wy³¹czenie odwróconych ruchów kamery";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 3);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Tak";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "camLookaroundInverse";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_M(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Myszka w grze";
	text[1] = "Korzystanie z myszki";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 4);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_M_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Tak";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 4) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "enableMouse";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_MSENSITIVITY(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Czu³oœæ myszy";
	text[1] = "Ustawienie czu³oœci myszy";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 5);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MSENSITIVITY_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	text[0] = "";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 5) + MENU_SLIDER_YPLUS;
	dimx = 2000;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "mouseSensitivity";
	onchgsetoptionsection = "GAME";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_OLDCONTROLS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Sterowanie z Gothic I";
	text[1] = "Wykorzystanie sposobu sterowania z Gothic I";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 6);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_OLDCONTROLS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Tak";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 6) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "useGothic1Controls";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};



// ----- ----- ----- ----- -----
// 		FREE AIM
// ----- ----- ----- ----- -----

const int    MENU_ID_GFA  = 7;                            // Next available Y-spot in the game menu
const string MENU_GFA_LABEL   = "Wolne celowanie";        // "Free aiming"
const string MENU_GFA_CHOICES = "Nie|Tak";     // "off|on"
const string MENU_GFA_DESCR   = "Wymaga u¿ywania myszki"; // "Requires mouse controls"


INSTANCE MENUITEM_OPT_GFA(C_MENU_ITEM_DEF) {
    backpic         = MENU_ITEM_BACK_PIC;
    text[0]         = MENU_GFA_LABEL;
    text[1]         = MENU_GFA_DESCR;
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 7);
	dimx = 4600;
	dimy = 750;
    onSelAction[0]  = SEL_ACTION_UNDEF;
    flags           = flags | IT_EFFECTS_NEXT;
};


INSTANCE MENUITEM_OPT_GFA_CHOICE(C_MENU_ITEM_DEF) {
    backPic               = MENU_CHOICE_BACK_PIC;
    type                  = MENU_ITEM_CHOICEBOX;
    text[0]               = MENU_GFA_CHOICES;
    fontName              = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 7) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
    onChgSetOption        = "freeAimingEnabled";
    onChgSetOptionSection = "GFA";
    flags                 = flags & ~IT_SELECTABLE;
    flags                 = flags  | IT_TXT_CENTER;
};




// ----- ----- ----- ----- -----

instance MENUITEM_OPT_JUSTICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Tryb sprawiedliwoœci";
	text[1] = "Brak zap. pod. walki, brak MARVINa, losowe zam. w kufrach";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 8);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_OPT_JUSTICE_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Tak";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 8) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "useJustice"; // TODO dodac inicjacje w grze
	onchgsetoptionsection = "UCIECZKA";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};


// ----- ----- ----- ----- -----

instance MENUITEM_OPT_LEVEL(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Poziom trudnoœci";
	text[1] = "Poziom trudnoœci mo¿esz równie¿ zmieniæ podczas gry";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 9);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_OPT_LEVEL_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "£atwy|Œredni|Trudny|Bardzo trudny|Legendarny";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 9) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "selectLevel"; // TODO dodac inicjacje w grze
	onchgsetoptionsection = "UCIECZKA";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_DISABLEQUICKSLOT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Wy³¹cz Quickslot";
	text[1] = "Wy³¹czenie paseka szybkiego wyboru";
	posx = 700;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 10);
	dimx = 4600;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_OPT_DISABLEQUICKSLOT_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nie|Tak";
	fontname = MENU_FONT_SMALL;
	posx = 5400;
	posy = MENU_OPTGAME_START_Y + (MENU_OPTGAME_DY * 10) + MENU_CHOICE_YPLUS;
	dimx = 2000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "DisableQuickslot";
	onchgsetoptionsection = "UCIECZKA";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};







instance MENUITEM_GAME_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Wróæ";
	posx = 1000;
	posy = MENU_BACK_Y + 300;
	dimx = 6192;
	dimy = MENU_OPTGAME_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};
