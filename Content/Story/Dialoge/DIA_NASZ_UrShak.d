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
//TODO: skamienia�y wygl�d przy 30%hp

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
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_00"); //Cz�owiek! Wielki bohater! Zabija� wielu bracia orki!
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_01");  //Kpisz sobie ze mnie? 
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_02"); //Tak. Cz�owiek silny, cz�owiek rze�. Cz�owiek s�aby, cz�owiek tch�rz. Orki ka�dy silne, ka�dy walczy�. Nie jeden robi� wszystko.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_15_03"); //Skoro tu jestem, to chyba jednak orki s�abe, a nie silne.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_04"); //Mhmmmm�
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_15_05"); //Jak cz�owiek imi�?
	AI_Output (self,other,"DIA_ORC_OrcShaman_Ur_Shak_55_06"); //Will.
	AI_Output (self,other,"DIA_ORC_OrcShaman_Ur_Shak_15_07"); //Will przypomina� Ur-Shak stary przyjaciel. On te� silny. On uratowa� Ur-Shak przed �li bracia, s�uchaj�cy demon Krushak.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_08"); //Krushak?
	AI_Output (self,other,"DIA_ORC_OrcShaman_Ur_Shak_15_09"); //Spa�.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_10"); //M�wisz o �ni�cym. Rozumiem. Co tutaj robisz? Skoro walczy�e� z innymi orkami, to jakim cudem jeste� teraz ich przyw�dc�?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_15_11"); //Ur-Shak kiedy� g�upi. My�le�, �e orki kocha� ludzie, ludzie kocha� orki, b�dzie pok�j. Stary przyjaciel by� symbol. Ur-Shak wiele czasu wygnaniec i niewolnik, ale Ur-Shak wierzy�.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_12"); //I co si� takiego sta�o?
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_13"); //Przyjaciel zabi� Hosh-Pak, by� nauczyciel Ur-Shak. Najwy�szy syn ducha. Przyjaciel silny, wi�c rze�. Ur-Shak zrozumie� sw�j b��d. Nigdy nie powinien zaufa� cz�owiek.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_55_14"); //Czyli masz do niego pretensj� o to, �e walczy� na wojnie o swoich?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_15"); //Nie. Ur-Shak mie� pretensje o to, �e przyjaciel rozmawia� z Ur-Shak, by pozna� Hosh-Pak.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_16"); //Wiedzie�, gdzie jest, przyjaciel p�j�� i zabi� nauczyciel. Wykorzysta� Ur-Shak. Ur-Shak zosta� nowy w�dz, ale przyjaciel pu�ci� wolno. My wrogi wtedy.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_17"); //Rozumiem, przyjaciel ci� zdradzi�, wykorzystuj�c twoj� przyja�� i wiedz�. Ale wiesz co? My�l�, �e chcia� zabi� Hosh-Paka, bo chcia� os�abi� morale ork�w, a nie chcia� doprowadza� do bezmy�lnej masakry na twoich pobratymcach. To strategia, nie rze�.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_18"); //I m�wisz, �e go pu�ci�e� wolno? Dla mnie to on nie chcia� ci� z tob� walczy� i temu odszed�. Wydaje mi si�, Ur-Shaku, �e k�amiesz. I celowo napu�ci�e� swojego przyjaciela na Hosh-Paka, by zdoby� w�adz�.
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_19"); //Nie! Will k�ama�. Will jak ka�dy cz�owiek, a cz�owiek albo zgin��, albo niewolnik.
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_20"); //Id�c tutaj, zabi�em mn�stwo ork�w. Elitarnych wojownik�w i szaman�w. Dlaczego my�lisz, �e masz ze mn� jakiekolwiek szanse?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_21"); //Ha, ha! Cz�owiek g�upi. Cz�owiek my�le�, �e Ur-Shak w to miejsce bez powodu? 
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_22"); //Co masz na my�li?
	AI_Output (self, other,"DIA_ORC_OrcShaman_Ur_Shak_55_23"); //Ur-Shak przyby� tutaj po moc kamienia. Po moc smoka. Ur-Shak by� jeszcze pot�ny! Pozna� Ur-Shak moc!
	AI_Output (other,self,"DIA_ORC_OrcShaman_Ur_Shak_15_24"); //O cholera!
	//TODO: doda� ork�w z https://www.worldofgothic.de/?go=moddb&action=view&fileID=1386&cat=12&page=0&order=0 i https://www.worldofgothic.de/?go=moddb&action=view&fileID=1001&cat=12&page=2&order=0
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
