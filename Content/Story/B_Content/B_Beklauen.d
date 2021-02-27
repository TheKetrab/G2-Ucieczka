
// ----- ===== KRADZIEŻ ===== ----- //

// ID:	| wymagane:	| ile ukradniesz?
// ----------------------------------
// 001	|			|
// 002	| 41		| 12 szt. złota
// 003	|			|
// 004	|			|
// 005	|			|
// 006	|			|
// 007	| 73		| 42 szt. złota
// 008	| 78		| 3x mikstura lecznicza
// 009	|			|
// 010	| 102		| masowe zniszczenie, zwój
// 011	|			|
// 012	| 			| 
// 013	|			|
// 014	|			|
// 015	| 115		| 183 szt. złota
// 016	| 23		| 5x łodyga bagiennego ziela
// 017	| 			| 
// 018	| 			| 
// 019	|			|
// 020	| 23		| esencja lecznicza
// -------------------------------------
// 101	| 36		| 23 szt. złota
// 102	| 			|
// 103	| 16		| Oko myśliwego (amulet)
// 104	| 24		| 2x piwo
// 105	|			|
// 106	| 17		| 3x stalowy pręt
// 107	| 7			| 21 sz. złota
// 108	|			|
// 109	| 62		| 82 szt. złota
// 110	| 94		| 162 szt. złota
// 111	| 33		| 2x światło
// 112	| 38		| 32 szt. złota
// 113	|			|
// 114	| 68		| 77 szt. złota
// 115	| 82		| 148 szt. złota
// 116	| 67		| 2x mikstura szybkości
// 117	| 43		| 4x ekstrakt leczniczy
// 118	| 64		| 44 szt. złota
// 119	| 73		| 4x mikstura, 3x ekstrakt leczniczy
// 120	| 38		| 2x piła, 1 młot
// 121	|			|
// 123	| 55		| 6x bryłka rudy
// 124	| 38		| 2x kula ognia, 1x błyskawica
// 125	| 27		| 3x piwo
// 126	| 36		| 56 szt. złota
// 127	| 7			| 8x piwo
// 128	|			|
// ---------------------------------------
// 201	| 82		| 144 szt. złota
// 202	|			|
// 203	| 47		| 56 strzał			
// 204	| 12		| 33 szt. złota
// 205	|			|
// 206	|			|
// 207	|			|
// 208	|			|
// 209	|			|
// 210	|			|
// 211	| 36		| 84 ształy
// 212	|			|
// 213	| 87		| 120 szt. złota
// 214	| 44		| 47 strzał
// 215	| 61		| 28 szt. złota
// 216	| 54		| 4 ekstrakty lecznicze
// 217	| 7			| klucz Louisa
// 218	| 57		| 88 strzał
// 219	| 37		| 6 łodyg bagiennego ziela
// 220	| 32		| 3 ekstrakty, 3 eliksiry lecznicze i 1 esencja many
// 221	| 63		| 72 szt. złota
// 222	| 26		| 36 szt. złota
// 223	| 58		| pierścień zręczności
// 224	| 32		| 73 strzały
// 225	|			|
// 226	| 39		| 31 szt. złota
// 227	| 63		| 84 strzały
// 228	| 44		| 48 strzał
// 229	| 54		| 89 szt. złota
// 230	| 27		| 33 szt. złota
// 231	| 40		| 42 ostre strzały
// 232	| 35		| 33 szt. złota
// ---------------------------------------
// 301	|			|
// 302	|			|
// 303	| 72		| 66 szt. złota
// 304	| 61		| 3 ekstrakty lecznicze
// 305	| 48		| 2 bryłki rudy
// 306	| 32		| 31 szt. złota
// 307	| 58		| 49 bełtów
// 308	| 48		| eliksir siły
// 309	|			|
// 310	|			|
// 311	|			|
// 312	|			|
// 313	|			|
// 314	|			|
// 315	|			|
// 316	| 33		| 42 szt. złota
// 317	|			|
// 318	| 26		| 4x piwo
// 319	|			|
// 320	|			|
// 321	|			|
// 322	|			|
// 323	|			|
// 324	|			|
// 325	|			|
// 326	| 34		| 52 bełty
// 327	| 9			| 5 łososi
// ---------------------------------------

















func int C_Beklauen (var int TheftDex)
{	
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff))

	{
		if (Npc_IsInState (self, ZS_Talk))
			{
				if (TheftDex <= 20)
				{
					TheftDexGlob = 10; //"Doddle" works always
				}
				else
				{
					TheftDexGlob = TheftDex;
				};
				
			};
		return TRUE;
	};

};	
	
func void B_BeklauenGold (var int TheftGold)
{	
	if (other.attribute[ATR_DEXTERITY] >= TheftDexGlob)
	{
		TheftGoldGlob = TheftGold;
		B_GiveInvItems (self, other, ItMi_Gold, TheftGoldGlob);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();//B_GivePlayerXP (XP_Ambient);
		Snd_Play ("Geldbeutel");
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};	


// --- DODANE ---
func void B_BeklauenThings (var int itm, var int ammount)
{	
	if (other.attribute[ATR_DEXTERITY] >= TheftDexGlob)
	{
		B_GiveInvItems (self, other, itm, ammount);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();//B_GivePlayerXP (XP_Ambient);
		Snd_Play ("Geldbeutel");
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};	