
instance MENU_OPTIONS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_OPT_HEADING";
	items[1] = "MENUITEM_OPT_GAME";
	items[2] = "MENUITEM_OPT_GRAPHICS";
	items[3] = "MENUITEM_OPT_VIDEO";
	items[4] = "MENUITEM_OPT_AUDIO";
	items[5] = "MENUITEM_OPT_CONTROLS";
	items[6] = "MENUITEM_OPT_EXT";
	items[7] = "MENUITEM_PERF";
	items[8] = "MENUITEM_PERF_CHOICE";
	items[9] = "MENUITEM_OPT_BACK";
	defaultoutgame = 0;
	defaultingame = 0;
	flags = flags | MENU_SHOW_INFO;
};


const int MENU_OPT_DY = 600;
const int MENU_OPT_START_Y = 2000;

instance MENUITEM_OPT_HEADING(C_MENU_ITEM_DEF)
{
	text[0] = "OPCJE";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8192;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_GAME(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Ustawienia gry";
	text[1] = "Zmiana ustawie� rozgrywki";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 0);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GAME";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_GRAPHICS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Ustawienia grafiki";
	text[1] = "Pole widzenia, ilo�� szczeg��w i efekty specjalne";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 1);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_GRAPHICS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_VIDEO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Ustawienia obrazu";
	text[1] = "Karta graficzna, rozdzielczo��, jasno�� i kontrast";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 2);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_VIDEO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_AUDIO(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Ustawienia d�wi�ku";
	text[1] = "Muzyka, efekty d�wi�kowe i sekwencje m�wione";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 3);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_AUDIO";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_CONTROLS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Sterowanie";
	text[1] = "Konfiguracja klawiatury i myszy";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 4);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_CONTROLS";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_EXT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Konfiguracja zaawansowana";
	text[1] = "Dalsze ustawienia";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 5);
	dimx = 8192;
	dimy = 750;
	onselaction[0] = SEL_ACTION_STARTMENU;
	onselaction_s[0] = "MENU_OPT_EXT";
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_PERF(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Wydajno��/Jako��";
	text[1] = "Optymalizacja dzia�ania gry";
	posx = 0;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 6);
	dimx = 8192;
	dimy = 800;
	onselaction[0] = SEL_ACTION_UNDEF;
	oneventaction[1] = update_perfoptions;
	flags = flags | IT_EFFECTS_NEXT;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_PERF_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	text[0] = "Ust. w�asne#Du�a wydajno��|�rednia jako��|Wysoka jako��";
	type = MENU_ITEM_CHOICEBOX;
	fontname = MENU_FONT_SMALL;
	posx = 4100 - 2000;
	posy = MENU_OPT_START_Y + (MENU_OPT_DY * 6) + 650;
	dimx = 4000;
	dimy = 350;
	onchgsetoption = "perfQualityIndex";
	onchgsetoptionsection = "INTERNAL";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Wr��";
	posx = 1000;
	posy = MENU_BACK_Y + 300;
	dimx = 6192;
	dimy = MENU_OPT_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};


func int update_perfoptions()
{
	Apply_Options_Performance();
	return 0;
};

