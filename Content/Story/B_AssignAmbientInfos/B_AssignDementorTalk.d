// ************************************************************
// 	     EXIT 
// ************************************************************

INSTANCE DIA_AmbientDementor_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_AmbientDementor_EXIT_Condition;
	information	= DIA_AmbientDementor_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_AmbientDementor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_AmbientDementor_EXIT_Info()
{	
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos (self);
	B_SCIsObsessed (self);
	Npc_SetRefuseTalk (self,5);	
	Snd_Play 	("MFX_FEAR_CAST" );

};	
///////////////////////////////////////////////////////////////////////
//	AmbientDementor Info
///////////////////////////////////////////////////////////////////////
instance DIA_AmbientDementor		(C_INFO)
{
	nr		 	= 	1;
	condition	= 	DIA_AmbientDementor_Condition;
	information	= 	DIA_AmbientDementor_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_AmbientDementor_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_AmbientDementor_Info ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	

		var int randy;
		randy = Hlp_Random (4);
	
		
	 if (CurrentLevel == DRAGONISLAND_ZEN)
		{
			
				 	if (randy == 0)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_03"); //I tak dotar�e� zbyt daleko, n�dzny robaku. Nigdy nie zst�pisz do �wi�tego sanktuarium.
					};
					if (randy == 1)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_04"); //St�j! Ani kroku dalej!
					};
					if (randy == 2)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_05"); //Daleko zaszed�e�, ale to ju� koniec twojej drogi.
					};
					if (randy == 3)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_06"); //Je�li chcesz zmierzy� si� z moim Panem, musisz najpierw mnie pokona�!
					};
				
		}
	else if (hero.guild == GIL_KDF)
		{
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_07"); //N�dzna namiastko maga, nigdy nie sprostasz boskiej mocy mego Pana i Mistrza!
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_08"); //A wi�c wybra�e� �cie�k� magii, by nas pokona�? Sprytny ruch, ale nawet to ci� teraz nie uratuje.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_09"); //Nawet jako mag nie zdo�asz nas zniszczy�.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_10"); //M�j Pan pozbawi ci� �ycia. Twoje kuglarskie sztuczki w niczym ci nie pomog�.
			};
		}
	else
		{	
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_11"); //Poddaj si�, p�ki jeszcze mo�esz. St�d nie ma ucieczki.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_12"); //Teraz poznasz prawdziw� moc mego Pana. Nic ci� ju� nie uratuje!
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_13"); //M�j Pan domaga si� twojej g�owy. Nie ma ju� dla ciebie ratunku.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_14"); //Wpad�e� w nasze sid�a. Po�egnaj si� z �yciem.
			};
		};
};


func void B_AssignDementorTalk (var C_Npc slf)
{	
	if 	(slf.guild == GIL_DMT)
	&&	(slf.npctype == NPCTYPE_AMBIENT)
	{
		DIA_AmbientDementor_EXIT.npc	= Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc			= Hlp_GetInstanceID(slf);
	};
};	
