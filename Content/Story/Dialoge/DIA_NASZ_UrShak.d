//////////////////////////////////////////////////////////////////
///	  			 
///
///			DIA_ORC_NASZ_Kurg_Kan
///
///
//////////////////////////////////////////////////////////////////

// ***********************************************************************************************************************
// 	  	DIA_ORC_OrcShaman_Ur_Shak_EXIT
// ***********************************************************************************************************************

INSTANCE DIA_ORC_OrcShaman_Ur_Shak_EXIT(C_INFO)
{
	npc		= OrcShaman_Ur_Shak;
	nr		= 999;
	condition	= DIA_ORC_OrcShaman_Ur_Shak_EXIT_Condition;
	information	= DIA_ORC_OrcShaman_Ur_Shak_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_ORC_OrcShaman_Ur_Shak_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_ORC_OrcShaman_Ur_Shak_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
var int UrShakRegeneracja;
var int UrShakBattleIterator;
var int UrShakBattleRandom;
var int UrShakBattleRandomOrc;
//TODO: skamienia³y wygl¹d przy 30%hp

func void ZabijOrkow(var c_npc slf)
{
    if(slf.guild==GIL_ORC || slf.guild == GIL_UNDEADORC)
    {
		B_KillNpc(slf);
	};
};

func int CalcProc(var int liczba, var int proc)
{
	return (liczba*proc)/100;
};

func void UrshakBattle()
{
	if(Npc_IsDead(OrcShaman_Ur_Shak)) { DoForSphere(ZabijOrkow); ff_remove(UrshakBattle); };
	
	if((OrcShaman_Ur_Shak.attribute[0] <= 120  && !UrShakRegeneracja))
	{
		Wld_InsertNpc		(OrcShaman_Sit,"OW_ROCKDRAGON_11");
		Wld_InsertNpc	(OrcUltra_Roam,"OW_ROCKDRAGON_11");
		OrcShaman_Ur_Shak.attribute[0] = OrcShaman_Ur_Shak.attribute[1];
		UrShakRegeneracja = true;
		Print("regeneracja");
	};
	
	if(UrShakRegeneracja && OrcShaman_Ur_Shak.attribute[0] <=  160  && !UrShakBattleIterator)
	{
		UrShakBattleIterator += 1;
		AI_WAITMS(OrcShaman_Ur_Shak,60000);
		Print("iterator");
	};
	Printi(UrShakBattleIterator);
	if(UrShakBattleIterator)
	{
		if(UrShakBattleIterator != 61)
		{
			UrShakBattleIterator += 1;
			if(UrShakBattleIterator == 60 || UrShakBattleIterator == 1)
			{
				Wld_InsertNpc	(OrcUltra_Roam,"OW_ROCKDRAGON_11");
				Wld_InsertNpc		(OrcShaman_Sit,"OW_ROCKDRAGON_11");
			};	
			if(UrShakBattleIterator && Hlp_Random(UrShakBattleIterator) >= ((UrShakBattleIterator*80)/100))
			{
				 UrShakBattleRandomOrc = hlp_random(2);
				 if(UrShakBattleRandomOrc)
				 {
					Wld_InsertNpc		(OrcShaman_Sit,"OW_ROCKDRAGON_11");
				 }
				 else
				 {	
					Wld_InsertNpc	(OrcUltra_Roam,"OW_ROCKDRAGON_11");
				 };
					
			};
		}
		else
		{
			if( Hlp_Random(UrShakBattleIterator) >= ((UrShakBattleIterator*95)/100))
				{
				
					UrShakBattleRandomOrc = hlp_random(2);
					 if(UrShakBattleRandomOrc)
					 {
						Wld_InsertNpc		(OrcShaman_Sit,"OW_ROCKDRAGON_11");
					 }
					 else
					 {	
						Wld_InsertNpc	(OrcUltra_Roam,"OW_ROCKDRAGON_11");
					 };
				};
		
		};
	};

};
	


///////////////////////////////////////////////////////////////////////
//	Info ORC_OrcShaman_Ur_Shak
///////////////////////////////////////////////////////////////////////
instance DIA_ORC_OrcShaman_Ur_Shak		(C_INFO)
{
	npc		 	= 	OrcShaman_Ur_Shak;
	nr		 	= 	1;
	condition		= 	DIA_ORC_OrcShaman_Ur_Shak_Condition;
	information		= 	DIA_ORC_OrcShaman_Ur_Shak_Info;
	important		 = 	TRUE;
};

func int DIA_ORC_OrcShaman_Ur_Shak_Condition ()
{
	return TRUE;			
};
var func temp;
func void DIA_ORC_OrcShaman_Ur_Shak_Info ()
{	
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_00"); //Cz³owiek! Wielki bohater! Zabijaæ wielu bracia orki!
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_01");  //Kpisz sobie ze mnie? 
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_02"); //Tak. Cz³owiek silny, cz³owiek rzeŸ. Cz³owiek s³aby, cz³owiek tchórz. Orki ka¿dy silne, ka¿dy walczyæ. Nie jeden robiæ wszystko.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_15_03"); //Skoro tu jestem, to chyba jednak orki s³abe, a nie silne.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_04"); //Mhmmmm…
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_15_05"); //Jak cz³owiek imiê?
	AI_Output (self,other,"DIA_ORC_OrcShaman_Ur_Shak_55_06"); //Will.
	AI_Output (self,other,"DIA_ORC_OrcShaman_Ur_Shak_15_07"); //Will przypominaæ Ur-Shak stary przyjaciel. On te¿ silny. On uratowaæ Ur-Shak przed Ÿli bracia, s³uchaj¹cy demon Krushak.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_08"); //Krushak?
	AI_Output (self,other,"DIA_ORC_OrcShaman_Ur_Shak_15_09"); //Spaæ.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_10"); //Mówisz o Œni¹cym. Rozumiem. Co tutaj robisz? Skoro walczy³eœ z innymi orkami, to jakim cudem jesteœ teraz ich przywódc¹?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_15_11"); //Ur-Shak kiedyœ g³upi. Myœleæ, ¿e orki kochaæ ludzie, ludzie kochaæ orki, bêdzie pokój. Stary przyjaciel byæ symbol. Ur-Shak wiele czasu wygnaniec i niewolnik, ale Ur-Shak wierzyæ.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_12"); //I co siê takiego sta³o?
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_13"); //Przyjaciel zabiæ Hosh-Pak, byæ nauczyciel Ur-Shak. Najwy¿szy syn ducha. Przyjaciel silny, wiêc rzeŸ. Ur-Shak zrozumieæ swój b³¹d. Nigdy nie powinien zaufaæ cz³owiek.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_55_14"); //Czyli masz do niego pretensjê o to, ¿e walczy³ na wojnie o swoich?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_15"); //Nie. Ur-Shak mieæ pretensje o to, ¿e przyjaciel rozmawiaæ z Ur-Shak, by poznaæ Hosh-Pak.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_16"); //Wiedzieæ, gdzie jest, przyjaciel pójœæ i zabiæ nauczyciel. Wykorzystaæ Ur-Shak. Ur-Shak zostaæ nowy wódz, ale przyjaciel puœciæ wolno. My wrogi wtedy.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_17"); //Rozumiem, przyjaciel ciê zdradzi³, wykorzystuj¹c twoj¹ przyjaŸñ i wiedzê. Ale wiesz co? Myœlê, ¿e chcia³ zabiæ Hosh-Paka, bo chcia³ os³abiæ morale orków, a nie chcia³ doprowadzaæ do bezmyœlnej masakry na twoich pobratymcach. To strategia, nie rzeŸ.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_18"); //I mówisz, ¿e go puœci³eœ wolno? Dla mnie to on nie chcia³ ciê z tob¹ walczyæ i temu odszed³. Wydaje mi siê, Ur-Shaku, ¿e k³amiesz. I celowo napuœci³eœ swojego przyjaciela na Hosh-Paka, by zdobyæ w³adzê.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_19"); //Nie! Will k³amaæ. Will jak ka¿dy cz³owiek, a cz³owiek albo zgin¹æ, albo niewolnik.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_20"); //Id¹c tutaj, zabi³em mnóstwo orków. Elitarnych wojowników i szamanów. Dlaczego myœlisz, ¿e masz ze mn¹ jakiekolwiek szanse?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_21"); //Ha, ha! Cz³owiek g³upi. Cz³owiek myœleæ, ¿e Ur-Shak w to miejsce bez powodu? 
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_22"); //Co masz na myœli?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_23"); //Ur-Shak przybyæ tutaj po moc kamienia. Po moc smoka. Ur-Shak byæ jeszcze potê¿ny! Poznaæ Ur-Shak moc!
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_24"); //O cholera!
	//TODO: dodaæ orków z https://www.worldofgothic.de/?go=moddb&action=view&fileID=1386&cat=12&page=0&order=0 i https://www.worldofgothic.de/?go=moddb&action=view&fileID=1001&cat=12&page=2&order=0
	AI_StopProcessInfos (self);
	self.guild							=	GIL_ORC;
	Npc_SetTrueGuild (self, GIL_ORC);
	self.start_aistate				= ZS_MM_AllScheduler;
	self.aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
	B_StartOtherRoutine (self,"");
	//Rtn_Stop_1111 = temp;
	B_Attack (OrcShaman_Ur_Shak, hero, AR_KILL, 0);
	//AI_StartState 		(self, ZS_MM_AllScheduler, 0, "");
	AI_Teleport(OrcShaman_Ur_Shak,"OW_ROCKDRAGON_06");
	Wld_InsertNpc		(OrcShaman_Sit,"OW_ROCKDRAGON_11");
	Wld_InsertNpc	(OrcUltra_Roam,"OW_ROCKDRAGON_11");
	FF_ApplyOnceExt(UrshakBattle,1000,-1);
};
