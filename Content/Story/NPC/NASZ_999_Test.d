instance NASZ_999_Test (Npc_Default)
{
	// ------ NSC ------
	name 		= "Test"; 
	guild 		= GIL_OUT;
	id 			= 999;
	voice 		= 6;
	flags       = NPC_FLAG_IMMORTAL;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Out_Weapon_H);
	EquipItem	(self, ItRw_Bow_H_02); 

	// ------ Inventory ------
	
	// Sakwy-paczki
	CreateInvItems (self, Receptures,1);
	CreateInvItems (self, Projects,1);
	CreateInvItems (self, G1Swords,1);
	CreateInvItems (self, Helmets,1);
	CreateInvItems (self, Shields,1);
	CreateInvItems (self, Keys,1);

	
	// Artefakty
	CreateInvItems (self, ItNa_Wiernosc,1);
	CreateInvItems (self, ItNa_Pierscien_Glodu,1);
	CreateInvItems (self, ItNa_Pierscien_Zarazy,1);
	CreateInvItems (self, ItNa_Amulet_Wojny,1);
	CreateInvItems (self, ItNa_Pas_Smierci,1);
	CreateInvItems (self, ItNa_KurganDuch,1);
	CreateInvItems (self, ItNa_Pierscien_Arto,1);
	CreateInvItems (self, ItNa_Pierscien_Blizny,1);
	CreateInvItems (self, ItNa_Amulet_Gomeza,1);
	CreateInvItems (self, ItNa_Pas_Bartholo,1);
	CreateInvItems (self, ItNa_Ring_Wiernosc,1);
	CreateInvItems (self, ItNa_PierscienGrubegoMysliwego,1);
	CreateInvItems (self, ItNa_PierscienAsasyna,1);
	
	CreateInvItems (self, ItNa_Artefakt_Sila,1);
	CreateInvItems (self, ItNa_Artefakt_Moc,1);
	CreateInvItems (self, ItNa_Artefakt_Odpornosc,1);
	CreateInvItems (self, ItNa_Artefakt_Caly,1);
	CreateInvItems (self, ItRi_Str_Mud,1);
	CreateInvItems (self, ItNa_OkoSwiata,1);
	CreateInvItems (self, ItNa_AmuletKrzywegoOgnika,1);
	CreateInvItems (self, ItNa_HuntAmulet,1);
	CreateInvItems (self, ItNa_AmuletZRudy,1);
	
	// Bronie
	CreateInvItems (self, ItNa_OstrzeLowcy,1);
	CreateInvItems (self, ItNa_ShaBaNakk,1);
	CreateInvItems (self, ItNa_MalaMaczuga,1);
	CreateInvItems (self, ItNa_Maczuga,1);
	CreateInvItems (self, ItNa_MieczSwiatla,1);
	CreateInvItems (self, ItNa_Zmija,1);
	CreateInvItems (self, ItMw_1H_Mace_02,1);
	CreateInvItems (self, ItMw_2H_Axe_Old_03,1);
	CreateInvItems (self, ItMw_2H_Axe_Old_01,1);
	CreateInvItems (self, ItMw_1H_Sword_Long_03,1);
	CreateInvItems (self, ItMw_1H_Sword_05,1);
	CreateInvItems (self, ItMw_1H_Sword_04,1);
	CreateInvItems (self, ItMw_1H_Sword_02,1);
	CreateInvItems (self, ItMw_1H_Sword_Short_02,1);
	CreateInvItems (self, ItNa_Kostur_UrShaka,1);
	CreateInvItems (self, ItNa_RytualneOstrze,1);
	CreateInvItems (self, ItNa_RekaTrolla,1);
	CreateInvItems (self, ItNa_DJG_Crossbow,1);
	CreateInvItems (self, ItNa_DJG_CrossbowH,1);
	CreateInvItems (self, ItNa_KuszaLowcy,1);
	CreateInvItems (self, ItNa_BAN_Crossbow,1);
	CreateInvItems (self, ItNa_Kusza_Domenic,1);
	CreateInvItems (self, ItNa_OrkowaKusza,1);
	CreateInvItems (self, ItNa_SmiercPradawnych,1);
	CreateInvItems (self, ItNa_ZabojcaPradawnych,1);
	CreateInvItems (self, ItNa_Djg_Weapon_L,1);
	CreateInvItems (self, ItNa_Djg_Weapon_M,1);
	CreateInvItems (self, ItNa_Djg_Weapon_H,1);
	CreateInvItems (self, ItNa_Out_Weapon_H,1);
	CreateInvItems (self, ItNa_Out_Weapon_S,1);
	CreateInvItems (self, ItNa_Ban_Weapon_H,1);
	CreateInvItems (self, ItNa_Ban_Weapon_M,1);
	CreateInvItems (self, ItNa_Jaszczur_WP,1);
	CreateInvItems (self, ItNa_ZlotySztylet,1);
	CreateInvItems (self, ItNa_MieczRuniczny,1);
	CreateInvItems (self, ItNa_MieczRunicznyKeroloth,1);
	CreateInvItems (self, ItNa_MieczRunicznyA,1);
	CreateInvItems (self, ItNa_MieczRunicznyB,1);
	CreateInvItems (self, ItNa_MieczRunicznyC,1);
	CreateInvItems (self, ItNa_CatSan_Sword,1);
	CreateInvItems (self, ItNa_Smyk,1);
	CreateInvItems (self, ItNa_Kosmyk,1);
	CreateInvItems (self, ItNa_MieczSusan,1);	
	CreateInvItems (self, ItNa_GrzechSzakala,1);
	CreateInvItems (self, ItNa_Szabla,1);
	CreateInvItems (self, ItNa_StaryPykacz,1);
	CreateInvItems (self, ItNa_Rozpruwacz,1);
	CreateInvItems (self, ItNa_SolidnaKlinga,1);
	CreateInvItems (self, ItNa_Klujec,1);
	CreateInvItems (self, ItNa_OstryMiecz,1);
	CreateInvItems (self, ItNa_NiewyostrzonyMiecz,1);
	CreateInvItems (self, ItNa_JezykTopielcaSword,1);
	CreateInvItems (self, ItNa_MlotOrkow,1);
	
	
	// Pisma
	CreateInvItems (self, ItNa_KsiegaReputacji,1);
	CreateInvItems (self, ItNa_KsiegaPotworow,1);
	CreateInvItems (self, ItNa_KsiegaOsiagniec,1);
	CreateInvItems (self, ItNa_KsiegaBosow,1);
	CreateInvItems (self, ItNa_KsiegaZmiennych,1);
	CreateInvItems (self, ItNa_Uroboros1,1);
	CreateInvItems (self, ItNa_Uroboros2,2);
	CreateInvItems (self, ItNa_Uroboros3,3);
	CreateInvItems (self, ItNa_Uroboros4,4);
	CreateInvItems (self, ItNa_Uroboros5,5);
	CreateInvItems (self, ItNa_Uroboros6,6);
	CreateInvItems (self, ItNa_KsiegaXardasOld,1);
	CreateInvItems (self, ItNa_HowToEscape,1);
	CreateInvItems (self, ItNa_PamietnikKannaha,1);
	CreateInvItems (self, ItNa_CorKalom_Book,1);
	CreateInvItems (self, ItNa_Zagadka_Adanos,1);
	CreateInvItems (self, ItNa_FreeMine,1);
	CreateInvItems (self, ItNa_AyanList,1);
	CreateInvItems (self, ItNa_Matt_Kartka,1);
	CreateInvItems (self, ItNa_ClueMirror,1);
	CreateInvItems (self, ItNa_Lista_Mikstur,1);
	CreateInvItems (self, ItNa_StaryPergaminOrc1,1);
	CreateInvItems (self, ItNa_StaryPergaminOrc2,1);
	CreateInvItems (self, ItNa_List_Keroloth,1);
	CreateInvItems (self, ItNa_List_AranOrkowie,1);
	CreateInvItems (self, ItNa_List_Jaszczuroludzie,1);
	CreateInvItems (self, ItNa_ListBandyci,1);
	CreateInvItems (self, ItNa_ZezwolenieBandyci,1);
	CreateInvItems (self, ItNa_Niewolnicy,1);
	CreateInvItems (self, ItWr_PradawnePismo_1,1);
	CreateInvItems (self, ItNa_Fexo,1);
	CreateInvItems (self, ItNa_Mghej4,1);
	CreateInvItems (self, ItNa_PreriowyScierwojad,1);
	CreateInvItems (self, ItNa_TheKetrab,1);
	CreateInvItems (self, ItNa_Bogu,1);
	CreateInvItems (self, ItNa_Simen,1);
	CreateInvItems (self, ItNa_Mchuable,1);

	
	// Mapy
	CreateInvItems (self, ItNa_Mapa_Domenic,1);
	CreateInvItems (self, ItNa_Mapa_GraveMission,1);
	CreateInvItems (self, ItNa_Mapa_Adanos,1);
	CreateInvItems (self, ItNa_Mapa_Demonow,1);
	CreateInvItems (self, ItNa_Mapa_ObozWypadowy,1);
	CreateInvItems (self, ItNa_Mapa_Morska,1);
	CreateInvItems (self, ItNa_Mapa_Lens,1);
	CreateInvItems (self, ItNa_Mapa_NowyOboz,1);
	CreateInvItems (self, ItNa_Mapa_ObozNaBagnie,1);
	CreateInvItems (self, ItNa_Mapa_Bracia,1);

	// Strza³y i be³ty
	CreateInvItems (self, ItRw_Arrow,100);
	CreateInvItems (self, ItRw_Bolt,100);
	CreateInvItems (self, ItRw_SharpBolt,100);
	CreateInvItems (self, ItNa_OgnistaStrzala,100);
	CreateInvItems (self, ItNa_OstraStrzala,100);
	CreateInvItems (self, ItNa_LodowaStrzala,100);
	
	
	// Czary
	CreateInvItems (self, It_Heart_IceCube,1);
	CreateInvItems (self, ItNa_TeleportMysliwi,1);
	CreateInvItems (self, ItNa_TeleportOrcTown,1);
	CreateInvItems (self, ItNa_TeleportLowcy,1);
	CreateInvItems (self, ItNa_TeleportBandyci,1);
	CreateInvItems (self, ItNa_TeleportTwierdza,1);
	CreateInvItems (self, ItNa_TeleportOzywieniec,1);
	CreateInvItems (self, ItNa_TeleportAlchemicy,1);
	CreateInvItems (self, ItNa_TeleportPrzelecz,1);
	CreateInvItems (self, ItNa_TeleportRockcamp,1);
	CreateInvItems (self, ItNa_TeleportBagno,1);
	CreateInvItems (self, ItNa_TrfMeatbug,1);
	CreateInvItems (self, ItNa_TrfGolem,1);
	CreateInvItems (self, ItNa_TrfSwampDrone,1);
	CreateInvItems (self, ItNa_SummonStraznik,1);
	CreateInvItems (self, ItNa_Inflate,1);
	CreateInvItems (self, ItNa_GroupHeal,1);
	CreateInvItems (self, ItNa_Grow,1);
	CreateInvItems (self, ItNa_Oswojenie,1);
	CreateInvItems (self, ItNa_CreatePortal,1);
	CreateInvItems (self, ItNa_GotoPortal,1);
	CreateInvItems (self, ItNa_CreatePortal2,1);
	CreateInvItems (self, ItNa_GotoPortal2,1);
	
	// Armor
	CreateInvItems (self, ITNA_GUR_M,1);
	CreateInvItems (self, ITNA_Cook_Armor,1);
	CreateInvItems (self, ITNA_BAN_L,1);
	CreateInvItems (self, ITNA_Nov_L,1);
	CreateInvItems (self, ITNA_OUT_L,1);
	CreateInvItems (self, ITNA_OUT_M,1);
	CreateInvItems (self, ITNA_OUT_H,1);
	CreateInvItems (self, ITNA_OUT_S,1);
	CreateInvItems (self, ITNA_OUT_ULTRA,1);
	CreateInvItems (self, ItNa_BAN_M,1);
	CreateInvItems (self, ItNa_BAN_H,1);
	CreateInvItems (self, ITNA_DJG_L,1);
	CreateInvItems (self, ITNA_DJG_M,1);
	CreateInvItems (self, ITNA_DJG_H,1);
	CreateInvItems (self, ITNA_DJG_S_WILL,1);
	CreateInvItems (self, ITNA_DJG_S,1);
	CreateInvItems (self, ITNA_DJG_ULTRA,1);
	CreateInvItems (self, ITNA_ARMOR_ANCIENT,1);
	CreateInvItems (self, ItNa_UkrytaZbroja,1);
	CreateInvItems (self, ItNa_PancerzKrolewski,1);
	
	
	// Pasy
	CreateInvItems (self, ItNa_PasMysliwego,1);
	CreateInvItems (self, ItNa_PasStalowejReki,1);
	CreateInvItems (self, ItNa_PasLowcyOrkow,1);
	CreateInvItems (self, ItNa_SzarfaSniacego,1);
	CreateInvItems (self, ItNa_PasBandyty,1);
	CreateInvItems (self, ItNa_PasMadrosci,1);
	CreateInvItems (self, ItNa_PasZawodowcow,1);
	CreateInvItems (self, ItNa_PasMistrzowski,1);
	
	
	// Mikstury
	CreateInvItems (self, ItNa_SakwaMikstur_Health,1);
	CreateInvItems (self, ItNa_SakwaMikstur_Mana,1);
	CreateInvItems (self, ItNa_SakwaMikstur_Power,1);
	CreateInvItems (self, ItNa_WywarVachuta,1);
	CreateInvItems (self, ItNa_PoteznyWywar,1);	
	CreateInvItems (self, ItNa_Jabol,1);
	CreateInvItems (self, ItNa_Ryzowka,1);
	CreateInvItems (self, ItNa_WyciagJagody,1);
	CreateInvItems (self, ItNa_WyciagGrzyby,1);
	CreateInvItems (self, ItNa_Odtrutka,1);
	CreateInvItems (self, ItNa_TruciznaDaryl,1);
	CreateInvItems (self, ItNa_Trucizna,1);
	CreateInvItems (self, ItNa_OrkowaMikstura,1);
	CreateInvItems (self, ItNa_RykSmoka,1);
	CreateInvItems (self, ItNa_CienCieniostwora,1);
	CreateInvItems (self, ItNa_ZmoraGwardzisty,1);
	CreateInvItems (self, ItNa_MiksturaUspokajajaca,1);
	CreateInvItems (self, ItNa_KropleDuszy,1);
	
	
	// Ró¿ne
	CreateInvItems (self, ItNa_Empty,1);
	CreateInvItems (self, ItNa_Ratford_Pierscien,1);
	CreateInvItems (self, ItNa_Ratford_Naczynie,1);
	CreateInvItems (self, ItNa_Ratford_Puchar,1);
	CreateInvItems (self, ItNa_Ratford_Talerz,1);
	CreateInvItems (self, ItNa_Ratford_Skrzyneczka,1);
	CreateInvItems (self, ItNa_PaczkaZBronia,1);
	CreateInvItems (self, ItNa_PaczkaZZywnoscia,1);
	CreateInvItems (self, ItNa_PaczkaMikstur,1);
	CreateInvItems (self, ItNa_PaczkaGoth,1);
	CreateInvItems (self, ItNA_RabonSakwa_MIS,1);
	CreateInvItems (self, ItNa_WyszlifowanaRuda,1);
	CreateInvItems (self, ItNa_Beczulka,1);
	CreateInvItems (self, ItNa_ZapasowaPila,1);
	CreateInvItems (self, ItNa_PaczkaJana,1);
	CreateInvItems (self, ItNa_KsiegaLukora,1);
	CreateInvItems (self, ItNa_NalewkaFerros,1);
	CreateInvItems (self, ItNa_KropleFerros,1);
	CreateInvItems (self, ItNa_MagicznaMoneta,1);
	CreateInvItems (self, ItNa_KufelPiwa,1);
	CreateInvItems (self, ItNa_PaczkaZiela,1);
	CreateInvItems (self, ItNa_Innos_Posazek,1);
	CreateInvItems (self, ItNa_SkoraOrkowegoPsa,1);
	CreateInvItems (self, ItNa_BlackWolfFur,1);
	CreateInvItems (self, ItNa_IceWolfFur,1);
	CreateInvItems (self, ItNa_GigantSkora,1);
	CreateInvItems (self, ItNa_SpeedRing,1);
	CreateInvItems (self, ItNa_ZabiKorzen,1);
	CreateInvItems (self, ItNa_Chmiel,1);
	CreateInvItems (self, ItNa_RzecznePnacze,1);
	CreateInvItems (self, ItNa_LuskaBestii,1);
	CreateInvItems (self, ItNa_Drzewny_Porost,1);
	CreateInvItems (self, ItNa_JajoZebacza,1);
	CreateInvItems (self, ItNa_Butelka,1);
	CreateInvItems (self, ItNa_Aran_Lekarstwo,1);
	CreateInvItems (self, ItNa_Wrzod_Lekarstwo,1);
	CreateInvItems (self, ItNa_Miecz_Wywar,1);
	CreateInvItems (self, ItNa_WodaSwiecona_Adanos,1);
	CreateInvItems (self, ItNa_KorthRaport,1);
	CreateInvItems (self, ItNa_Matt_List,1);
	CreateInvItems (self, ItNa_RaportEraka,1);
	CreateInvItems (self, ItNa_JenkinsRaport,1);
	CreateInvItems (self, ItNa_MiesoTopielca,1);
	CreateInvItems (self, ItNa_JezykTopielca,1);
	CreateInvItems (self, ItNa_PazurWscieklegoTopielca,1);
	CreateInvItems (self, ItNa_KoscBrata,1);
	CreateInvItems (self, ItNa_KoscWargJehen,1);
	CreateInvItems (self, ItNa_Krysztal,1);
	CreateInvItems (self, ItNa_Fajka,1);
	CreateInvItems (self, ItNa_Posazek_1,1);
	CreateInvItems (self, ItNa_Posazek_2,1);
	CreateInvItems (self, ItNa_KrysztalAdanosa,1);
	CreateInvItems (self, ItNa_KoloZebate,1);
	CreateInvItems (self, ItNa_DuchSkull,1);
	CreateInvItems (self, ItNa_CzarnyKamien,1);
	CreateInvItems (self, ItNa_NiebieskiKamien,1);
	CreateInvItems (self, ItNa_MiesoDzika,1);	
	CreateInvItems (self, ItNa_FriedMushroom_01,1);
	CreateInvItems (self, ItNa_FriedMushroom_02,1);
	CreateInvItems (self, ItNa_PotrawkaZChrzaszcza,1);
	CreateInvItems (self, ItNa_PotrawkaDlaGerolda,1);
	CreateInvItems (self, ItNa_Losos,1);
	CreateInvItems (self, ItNa_FriedFish,1);
	CreateInvItems (self, ItNa_WywarRoslinaLecznicza,1);
	CreateInvItems (self, ItNa_WywarZieleLecznicze,1);
	CreateInvItems (self, ItNa_WywarKorzenLeczniczy,1);
	CreateInvItems (self, ItNa_MrokPolnocy,1);
	CreateInvItems (self, ItNa_Smar,1);
	CreateInvItems (self, ItNa_KopalnianyGrzyb,1);
	CreateInvItems (self, ItNa_PieczenSnafa,1);
	CreateInvItems (self, ItNa_Snaf_Przepis,1);
	CreateInvItems (self, ItNa_KsiegaWiedzy,1);
	CreateInvItems (self, ItNa_FragmentZwoju,1);
	CreateInvItems (self, ItNa_SakwaTed,1);
	CreateInvItems (self, ItNa_PaczkaGwozdzi,1);
	CreateInvItems (self, ItNa_JehenPaczkaZFutrami,1);
	CreateInvItems (self, ItNa_JehenPaczkaZMiesem,1);
	CreateInvItems (self, ItNa_PaczkaMalychGwozdzi,1);
	CreateInvItems (self, ItNa_PieczenDlaGotha,1);
	
	// Potrawy
	CreateInvItems (self, ItNa_SerowyGulasz,1);
	CreateInvItems (self, ItNa_ZupaZGrzybowKopalnianych,1);
	CreateInvItems (self, ItNa_GulaszMiesny,1);
	CreateInvItems (self, ItNa_PotrawkaZeScierwojada,1);
	CreateInvItems (self, ItNa_ZupaPiwna,1);
	CreateInvItems (self, ItNa_ZupaZOrkowegoPrzepisu,1);
	CreateInvItems (self, ItNa_UdziecZDzikaPoLowiecku,1);
	CreateInvItems (self, ItNa_ZupaZDuzychGrzybow,1);
	CreateInvItems (self, ItNa_ZupaJarzynowaZJagodami,1);
	CreateInvItems (self, ItNa_ZupaSerowa,1);
	CreateInvItems (self, ItNa_PrzysmakMysliwych,1);
	CreateInvItems (self, ItNa_KompotOwocowy,1);
	CreateInvItems (self, ItNa_ZupaMleczna,1);
	CreateInvItems (self, ItNa_ZupaGrzybowa,1);
	



		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kharim, BodyTex_B, ITNA_OUT_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_999;
};

FUNC VOID Rtn_Start_999 ()
{
	TA_Stand_WP	(08,00,23,00,"XXX");
    TA_Stand_WP	(23,00,08,00,"XXX");
};
