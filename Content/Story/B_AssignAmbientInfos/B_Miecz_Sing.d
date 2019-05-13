// ***************
// B_Miecz_Sing 
// ***************

func void B_Miecz_Sing (var int verse)
{
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc		(self,	hero);
	};
	
	AI_RemoveWeapon (self);

	/*
	Kiedy rum zaszumi w g�owie, ca�y �wiat nabiera tre�ci, wtedy ch�tnie s�ucha cz�owiek morskich opowie�ci!
	Hej, ha, kolejk� nalej! Hej ha, kielichy wznie�my! To zrobi doskonale morskim opowie�ciom.
	
	�ajba to jest morski statek, sztorm to wiatr co dmucha z gestem, cierpi kraj na niedostatek morskich opowie�ci!
	
	P�ywa� raz marynarz kt�ry �ywi� si� wy��cznie pieprzem. Sypa� pieprz do konfitury i do zupy mlecznej.
	
	Niech dr�� gitary struny! Niech wiatr w grzywacze pie�ci! Wyp�yniemy pod bander� morskich opowie�ci.
	
	Mo�e kto� si� b�dzie z�yma�, m�wi�c, �e to zdrozne wie�ci, ale to jest w�a�nie klimat morskich opowie�ci.
	
	Pij bracie, pij na zdrowie! Jutro ci si� humor przyda. Spirytus ci nie zaszkodzi - sztorm idzie, wyrzygasz!
	*/
	
	Print(ConcatStrings("Miecz sing, verse = ",IntToString(verse)));
	
	if (verse == 0)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing0_00"); //Kiedy rum zaszumi w g�owie, ca�y �wiat nabiera tre�ci. Wtedy ch�tnie s�ucha cz�owiek morskich opowie�ci!
		AI_Output (self ,self,"DIA_Miecz_Sing0_01"); //Hej, ha, kolejk� nalej! Hej ha, kielichy wznie�my! To zrobi doskonale morskim opowie�ciom.
	}
	
	else if (verse == 1) 
	{
		AI_Output (self ,self,"DIA_Miecz_Sing1_00"); //�ajba to jest morski statek, sztorm to wiatr co dmucha z gestem, cierpi kraj na niedostatek morskich opowie�ci!
		AI_Output (self ,self,"DIA_Miecz_Sing1_01"); //Hej, ha, kolejk� nalej! Hej ha, kielichy wznie�my! To zrobi doskonale morskim opowie�ciom.
	}
	
	else if (verse == 2)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing2_00"); //P�ywa� raz marynarz kt�ry �ywi� si� wy��cznie pieprzem. Sypa� pieprz do konfitury i do zupy mlecznej.
		AI_Output (self ,self,"DIA_Miecz_Sing2_01"); //Hej, ha, kolejk� nalej! Hej ha, kielichy wznie�my! To zrobi doskonale morskim opowie�ciom.
	}
	
	else if (verse == 3)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing3_00"); //Niech dr�� gitary struny! Niech wiatr w grzywacze pie�ci! Wyp�yniemy pod bander� morskich opowie�ci.
		AI_Output (self ,self,"DIA_Miecz_Sing3_01"); //Hej, ha, kolejk� nalej! Hej ha, kielichy wznie�my! To zrobi doskonale morskim opowie�ciom.
	}
	
	else if (verse == 4)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing4_00"); //Mo�e kto� si� b�dzie z�yma�, m�wi�c, �e to zdrozne wie�ci, ale to jest w�a�nie klimat morskich opowie�ci.
		AI_Output (self ,self,"DIA_Miecz_Sing4_01"); //Hej, ha, kolejk� nalej! Hej ha, kielichy wznie�my! To zrobi doskonale morskim opowie�ciom.
	}
	
	else if (verse == 5)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing5_00"); //Pij bracie, pij na zdrowie! Jutro ci si� humor przyda. Spirytus ci nie zaszkodzi - sztorm idzie, wyrzygasz!
		AI_Output (self ,self,"DIA_Miecz_Sing5_01"); //Hej, ha, kolejk� nalej! Hej ha, kielichy wznie�my! To zrobi doskonale morskim opowie�ciom.
	};
};

