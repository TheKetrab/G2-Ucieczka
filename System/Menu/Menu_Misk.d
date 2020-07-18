
instance MENU_LEAVE_GAME(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_LEAVE_GAME_HEADLINE";
	items[1] = "MENUITEM_LEAVE_GAME_YES";
	items[2] = "MENUITEM_LEAVE_GAME_NO";
	defaultoutgame = 2;
	defaultingame = 2;
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_LEAVE_GAME_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Na pewno chcesz wyjœæ?";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = 3400;
	dimx = 8100;
	dimy = 750;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_TXT_CENTER;
};

instance MENUITEM_LEAVE_GAME_YES(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Tak";
	text[1] = "Jeszcze tu wrócê!";
	posx = 0;
	posy = 4400;
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "LEAVE_GAME";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
};

instance MENUITEM_LEAVE_GAME_NO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Nie";
	text[1] = "Nie, chcê dalej graæ.";
	posx = 0;
	posy = 5000;
	dimx = 8100;
	dimy = 750;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
};


//
//    Nowa gra
//
const int MENU_NEWGAME_Y = 2800;
const int MENU_NEWGAME_DY = 600;
instance MENU_PLAY_SELECT(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_PLAY_SELECT_HEADLINE";
	//items[1] = "MENUITEM_PLAY_SELECT_EASY";         // latwy
	//items[2] = "MENUITEM_PLAY_SELECT_MEDIUM";       // sredni
	//items[3] = "MENUITEM_PLAY_SELECT_DIFFICULT";    // trudny
	//items[4] = "MENUITEM_PLAY_SELECT_INSANE";       // bardzo trudny
	//items[5] = "MENUITEM_PLAY_SELECT_LEGEND";       // legendarny
	//items[6] = "MENUITEM_PLAY_SELECT_BACK";
	items[1] = "MENUITEM_PLAY_SELECT_LEVELCHOICE";
	items[2] = "MENUITEM_PLAY_SELECT_START";
	
	defaultoutgame = 1;
	defaultingame = 1;
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_PLAY_SELECT_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Poziom trudnoœci:";
	
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_MAIN_Y + (1 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_TXT_CENTER;
	
};
/*
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
*/

instance MENUITEM_PLAY_SELECT_LEVELCHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "£atwy|Œredni|Trudny|Bardzo trudny|Legendarny";
	text[1] = "Dobierz poziom trudnoœci do swoich umiejêtnoœci";

	posx = 0;
	posy = MENU_MAIN_Y + (2 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	onchgsetoption = "selectLevel";
	onchgsetoptionsection = "UCIECZKA";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
};


instance MENUITEM_PLAY_SELECT_START(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	text[0] = "-- Graj --";
	text[1] = "Rozpocznij now¹ przygodê!";
	posx = 0;
	posy = MENU_MAIN_Y + (4 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
	
};




instance MENUITEM_PLAY_SELECT_EASY(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	text[0] = "£atwy";
	text[1] = "Poziom trudnoœci zbli¿ony do Gothica 2";
	posx = 0;
	posy = MENU_MAIN_Y + (0 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME"; // todo select easy
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
	
};

instance MENUITEM_PLAY_SELECT_MEDIUM(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	text[0] = "Œredni";
	text[1] = "Poziom trudnoœci podobny do G2NK";
	posx = 0;
	posy = MENU_MAIN_Y + (1 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME"; // todo select medium
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
	
};

instance MENUITEM_PLAY_SELECT_DIFFICULT(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	text[0] = "Trudny";
	text[1] = "Tylko dla koneserów Gothica";
	posx = 0;
	posy = MENU_MAIN_Y + (2 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME"; // todo select diff
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
	
};

instance MENUITEM_PLAY_SELECT_INSANE(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	text[0] = "Bardzo trudny";
	text[1] = "Jeœli szukasz wyzwania, to spróbuj!";
	posx = 0;
	posy = MENU_MAIN_Y + (3 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME"; // todo select insane
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
	
};

instance MENUITEM_PLAY_SELECT_LEGEND(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	text[0] = "Legendarny";
	text[1] = "Poziom trudnoœci tylko dla masochistów!";
	posx = 0;
	posy = MENU_MAIN_Y + (4 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	onselaction[0] = SEL_ACTION_CLOSE;
	onselaction_s[0] = "NEW_GAME"; // todo select legend
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
	
	onchgsetoption = "selectLevel"; // TODO dodac inicjacje w grze
	onchgsetoptionsection = "UCIECZKA";
};


instance MENUITEM_PLAY_SELECT_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_INPUT_BACK_PIC;
	text[0] = "Wróæ";
	text[1] = "";
	posx = 0;
	posy = MENU_MAIN_Y + (6 * MENU_MAIN_DY);
	dimx = 8100;
	dimy = 750;
	flags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MOVEABLE | IT_SELECTABLE | IT_TXT_CENTER;
	
};

