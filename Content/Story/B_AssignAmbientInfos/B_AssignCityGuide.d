// ****************************
// Wegbescreibungenin der Stadt
// ****************************


func void B_AddCityGuideChoices()
{
	Info_ClearChoices (DIA_CITYGUIDE);
	
	if (!C_IsQuarterNearest(self, Q_UNTERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do dolnej cz�ci miasta.", DIA_CITYGUIDE_UNTERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_OBERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do g�rnego miasta.", DIA_CITYGUIDE_OBERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_TEMPEL))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do �wi�tyni Adanosa.", DIA_CITYGUIDE_TEMPEL);
	};
	if (!C_IsQuarterNearest(self, Q_MARKT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do targowiska.", DIA_CITYGUIDE_MARKT);
	};
	if (!C_IsQuarterNearest(self, Q_GALGEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do placu wisielc�w.", DIA_CITYGUIDE_GALGEN);
	};
	if (!C_IsQuarterNearest(self, Q_KASERNE))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do koszar.", DIA_CITYGUIDE_KASERNE);
	};
	if (!C_IsQuarterNearest(self, Q_HAFEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do dzielnicy portowej.", DIA_CITYGUIDE_HAFEN);
	};
	
	Info_AddChoice (DIA_CITYGUIDE, "Dzi�ki, tylko tyle chcia�em wiedzie�.", DIA_CITYGUIDE_BACK);
};

INSTANCE DIA_CITYGUIDE (C_INFO)
{
	nr			= 700;
	condition	= DIA_CITYGUIDE_Condition;
	information	= DIA_CITYGUIDE_Info;
	permanent	= TRUE;
	description = "Co mo�esz mi powiedzie� o tym miejscu?";
};                       

FUNC INT DIA_CITYGUIDE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CITYGUIDE_Info()
{	
	AI_Output (other, self, "DIA_CITYGUIDE_15_00"); //Co mo�esz mi powiedzie� o tym miejscu?
	
	// ------ Du bist jetzt ------
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT"); 	//Jeste� teraz w dolnej cz�ci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT");		//Jeste� teraz w g�rnym mie�cie.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL");			//Jeste� teraz przy �wi�tyni.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT");			//Jeste� teraz na targowisku.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN");			//Jeste� teraz na placu wisielc�w.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE");		//To s� koszary.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN");			//Jeste� teraz w dzielnicy portowej.
	};
	
	B_Say (self, other, "$WHERETO"); //A gdzie si� wybierasz?
	
	B_AddCityGuideChoices();
};

func void DIA_CITYGUIDE_BACK()
{
	AI_Output (other, self, "DIA_CITYGUIDE_BACK_15_00"); //Dzi�ki, tylko tyle chcia�em wiedzie�.
	Info_ClearChoices (DIA_CITYGUIDE);
};
	
func void DIA_CITYGUIDE_UNTERSTADT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_UNTERSTADT_15_00"); //Jak mog� si� dosta� do dolnej cz�ci miasta?
	
	if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.	
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je�eli p�jdziesz wzd�u� mur�w miejskich od strony targowiska, to dojdziesz do �wi�tyni.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	};
	
	B_AddCityGuideChoices();
};

func void DIA_CITYGUIDE_OBERSTADT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_OBERSTADT_15_00"); //Jak dosta� si� do g�rnego miasta?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je�eli p�jdziesz wzd�u� mur�w miejskich od strony targowiska, to dojdziesz do �wi�tyni.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_TEMPEL()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_TEMPEL_15_00"); //Szukam �wi�tyni.
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je�eli p�jdziesz wzd�u� mur�w miejskich od strony targowiska, to dojdziesz do �wi�tyni.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_MARKT"); 		//Po prostu zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_MARKT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_MARKT_15_00"); //Gdzie jest targowisko?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_MARKT"); 		//Po prostu przejd� obok koszar, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_MARKT"); 		//Po prostu zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_GALGEN()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_GALGEN_15_00"); //Jak dosta� si� na Plac Wisielc�w?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_GALGEN"); 		//Po prostu przejd� obok koszar, a dojdziesz do placu wisielc�w.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_KASERNE()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_KASERNE_15_00"); //Gdzie s� koszary?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz si� do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); 	//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz si� do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz si� do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz si� do nich po schodach naprzeciwko gospody.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz si� do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz si� do niego po schodach.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_HAFEN()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_HAFEN_15_00"); //Jak dosta� si� do portu?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Id� od strony ku�ni w d� ulic� portow�, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Id� od strony ku�ni w d� ulic� portow�, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Id� od strony ku�ni w d� ulic� portow�, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je�eli p�jdziesz wzd�u� mur�w miejskich od strony targowiska, to dojdziesz do �wi�tyni.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Id� od strony ku�ni w d� ulic� portow�, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Id� od strony ku�ni w d� ulic� portow�, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Id� od strony ku�ni w d� ulic� portow�, a dojdziesz do portu.
	};
	
	B_AddCityGuideChoices();
};

// *********************************************************
// ---------------------------------------------------------

func void B_AssignCityGuide (var C_NPC slf)
{
	DIA_CITYGUIDE.npc = Hlp_GetInstanceID(slf);
};

	
	


