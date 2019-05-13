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
	Kiedy rum zaszumi w g³owie, ca³y œwiat nabiera treœci, wtedy chêtnie s³ucha cz³owiek morskich opowieœci!
	Hej, ha, kolejkê nalej! Hej ha, kielichy wznieœmy! To zrobi doskonale morskim opowieœciom.
	
	£ajba to jest morski statek, sztorm to wiatr co dmucha z gestem, cierpi kraj na niedostatek morskich opowieœci!
	
	P³ywa³ raz marynarz który ¿ywi³ siê wy³¹cznie pieprzem. Sypa³ pieprz do konfitury i do zupy mlecznej.
	
	Niech dr¿¹ gitary struny! Niech wiatr w grzywacze pieœci! Wyp³yniemy pod bander¹ morskich opowieœci.
	
	Mo¿e ktoœ siê bêdzie z¿yma³, mówi¹c, ¿e to zdrozne wieœci, ale to jest w³aœnie klimat morskich opowieœci.
	
	Pij bracie, pij na zdrowie! Jutro ci siê humor przyda. Spirytus ci nie zaszkodzi - sztorm idzie, wyrzygasz!
	*/
	
	Print(ConcatStrings("Miecz sing, verse = ",IntToString(verse)));
	
	if (verse == 0)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing0_00"); //Kiedy rum zaszumi w g³owie, ca³y œwiat nabiera treœci. Wtedy chêtnie s³ucha cz³owiek morskich opowieœci!
		AI_Output (self ,self,"DIA_Miecz_Sing0_01"); //Hej, ha, kolejkê nalej! Hej ha, kielichy wznieœmy! To zrobi doskonale morskim opowieœciom.
	}
	
	else if (verse == 1) 
	{
		AI_Output (self ,self,"DIA_Miecz_Sing1_00"); //£ajba to jest morski statek, sztorm to wiatr co dmucha z gestem, cierpi kraj na niedostatek morskich opowieœci!
		AI_Output (self ,self,"DIA_Miecz_Sing1_01"); //Hej, ha, kolejkê nalej! Hej ha, kielichy wznieœmy! To zrobi doskonale morskim opowieœciom.
	}
	
	else if (verse == 2)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing2_00"); //P³ywa³ raz marynarz który ¿ywi³ siê wy³¹cznie pieprzem. Sypa³ pieprz do konfitury i do zupy mlecznej.
		AI_Output (self ,self,"DIA_Miecz_Sing2_01"); //Hej, ha, kolejkê nalej! Hej ha, kielichy wznieœmy! To zrobi doskonale morskim opowieœciom.
	}
	
	else if (verse == 3)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing3_00"); //Niech dr¿¹ gitary struny! Niech wiatr w grzywacze pieœci! Wyp³yniemy pod bander¹ morskich opowieœci.
		AI_Output (self ,self,"DIA_Miecz_Sing3_01"); //Hej, ha, kolejkê nalej! Hej ha, kielichy wznieœmy! To zrobi doskonale morskim opowieœciom.
	}
	
	else if (verse == 4)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing4_00"); //Mo¿e ktoœ siê bêdzie z¿yma³, mówi¹c, ¿e to zdrozne wieœci, ale to jest w³aœnie klimat morskich opowieœci.
		AI_Output (self ,self,"DIA_Miecz_Sing4_01"); //Hej, ha, kolejkê nalej! Hej ha, kielichy wznieœmy! To zrobi doskonale morskim opowieœciom.
	}
	
	else if (verse == 5)
	{
		AI_Output (self ,self,"DIA_Miecz_Sing5_00"); //Pij bracie, pij na zdrowie! Jutro ci siê humor przyda. Spirytus ci nie zaszkodzi - sztorm idzie, wyrzygasz!
		AI_Output (self ,self,"DIA_Miecz_Sing5_01"); //Hej, ha, kolejkê nalej! Hej ha, kielichy wznieœmy! To zrobi doskonale morskim opowieœciom.
	};
};

