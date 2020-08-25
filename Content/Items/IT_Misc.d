
const int Value_SwordBlade = 10;
const int Value_SwordBladeHot = 10;
const int Value_SwordRawHot = 10;
const int Value_SwordRaw = 10;
const int Value_Brush = 3;
const int Value_Flask = 3;
const int Value_Stomper = 3;
const int Value_Pan = 20;
const int Value_Saw = 20;
const int Value_Broom = 10;
const int Value_Rake = 10;
const int Value_Hammer = 10;
const int Value_Scoop = 3;
const int Value_Nugget = 50;
const int Value_Joint = 30;
const int Value_Alarmhorn = 10;
const int Value_Lute = 10;
const int Value_Gold = 1;
const int Value_RuneBlank = 100;
const int Value_Sulfur = 20;
const int Value_Quartz = 20;
const int Value_Pitch = 10;
const int Value_Rockcrystal = 10;
const int Value_Aquamarine = 100;
const int Value_HolyWater = 20;
const int Value_Coal = 2;
const int Value_DarkPearl = 1000;
const int VALUE_ItMi_ApfelTabak = 10;
const int VALUE_ItMi_PilzTabak = 10;
const int VALUE_ItMi_SumpfTabak = 10;
const int VALUE_ItMi_DoppelTabak = 10;
const int VALUE_ItMi_HonigTabak = 10;
const int Value_SilverRing = 120;
const int Value_SilverNecklace = 200;
const int Value_SilverCandleHolder = 50;
const int Value_SilverPlate = 100;
const int Value_SilverCup = 100;
const int Value_SilverChalice = 250;
const int Value_GoldPlate = 200;
const int Value_GoldRing = 250;
const int Value_GoldNecklace = 300;
const int Value_GoldCandleHolder = 120;
const int Value_GoldCup = 350;
const int Value_BloodCup = 200;
const int Value_GoldChalice = 500;
const int Value_GoldChest = 750;
const int Value_JeweleryChest = 1000;
const int Value_InnosStatue = 100;
const int Value_Sextant = 1500;

instance ItMi_Stomper(C_Item)
{
	name = "Rozdrabniacz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stomper;
	visual = "ItMi_Stomper.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_RuneBlank(C_Item)
{
	name = "Runa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RuneBlank;
	visual = "ItMi_RuneBlank.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Pliers(C_Item)
{
	name = "Szczypce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RuneBlank;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Flask(C_Item)
{
	name = "Menzurka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Flask;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Hammer(C_Item)
{
	name = "M³otek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Hammer;
	visual = "ItMi_Hammer.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Scoop(C_Item)
{
	name = "£y¿ka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Scoop;
	visual = "ItMi_Scoop.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Pan(C_Item)
{
	name = "Patelnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pan;
	visual = "ItMi_Pan.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_PanFull(C_Item)
{
	name = "Patelnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pan;
	visual = "ItMi_PanFull.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Saw(C_Item)
{
	name = "Pi³a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Saw;
	visual = "ItMi_Saw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordraw(C_Item)
{
	name = "Surowa stal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRaw;
	visual = "ItMiSwordraw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordrawhot(C_Item)
{
	name = "Rozgrzana stal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRawHot;
	visual = "ItMiSwordrawhot.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordbladehot(C_Item)
{
	name = "Rozgrzane ostrze";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBladeHot;
	visual = "ItMiSwordbladehot.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordblade(C_Item)
{
	name = "Ostrze";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBlade;
	visual = "ItMiSwordblade.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Broom(C_Item)
{
	name = "Miot³a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Broom;
	visual = "ItMi_Broom.3DS";
	material = MAT_WOOD;
	scemeName = "BROOM";
	on_state[0] = Use_Broom;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Broom()
{
	if(Npc_IsPlayer(self) && (Wld_GetPlayerPortalGuild() == GIL_NOV) && (MIS_ParlanFegen == LOG_Running))
	{
		B_Say(self,self,"$NOSWEEPING");
		Print(PRINT_NoSweeping);
	};
};


instance ItMi_Lute(C_Item)
{
	name = "Lutnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lute;
	visual = "ItMi_Lute.3DS";
	material = MAT_WOOD;
	scemeName = "LUTE";
	on_state[0] = Use_Lute;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Lute()
{
};


instance ItMi_Brush(C_Item)
{
	name = "Szczotka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "ItMi_Brush.3ds";
	material = MAT_WOOD;
	scemeName = "BRUSH";
	on_state[0] = Use_Brush;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Brush()
{
};


instance ItMi_Joint(C_Item)
{
	name = "£odyga bagiennego ziela";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Joint;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


func void Use_Joint()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ItMi_Packet(C_Item)
{
	name = "Paczka";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UsePacket()
{
};


instance ItMi_Pocket(C_Item)
{
	name = "Skórzany mieszek";
	mainflag = ITEM_KAT_NONE | ITEM_MULTI;
	flags = 0;
	value = 10;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UsePocket;
	description = name;
	text[2] = "A narrow bag,";
	text[3] = "not very heavy.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UsePocket()
{
	CreateInvItems(hero,ItMi_Gold,10);
	Print(PRINT_FoundGold10);
	Snd_Play("Geldbeutel");
};


instance ItMi_Nugget(C_Item)
{
	name = "Bry³ka rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Nugget;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Gold(C_Item)
{
	name = "Z³oto";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Gold;
	visual = "ItMi_Gold.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_OldCoin(C_Item)
{
	name = "Stara moneta";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_OldCoin.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_GoldCandleHolder(C_Item)
{
	name = "Z³oty œwiecznik";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldCandleHolder;
	visual = "ItMi_GoldCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldNecklace(C_Item)
{
	name = "Z³oty naszyjnik";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = Value_GoldNecklace;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ItMi_SilverRing(C_Item)
{
	name = "Srebrny pierœcieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_SilverRing;
	visual = "ItMi_SilverRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItMi_SilverCup(C_Item)
{
	name = "Srebrny puchar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_SilverPlate(C_Item)
{
	name = "Srebrny talerz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverPlate;
	visual = "ItMi_SilverPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldPlate(C_Item)
{
	name = "Z³oty talerz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldCup(C_Item)
{
	name = "Z³oty puchar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldCup;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_BloodCup_MIS(C_Item)
{
	name = "Krwawy puchar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BloodCup;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = "Krwawy puchar";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldRing(C_Item)
{
	name = "Z³oty pierœcieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_GoldRing;
	visual = "ItMi_GoldRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItMi_SilverChalice(C_Item)
{
	name = "Srebrne naczynie";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverChalice;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_JeweleryChest(C_Item)
{
	name = "Skrzynka z kosztownoœciami";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_JeweleryChest;
	visual = "ItMi_JeweleryChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldChalice(C_Item)
{
	name = "Z³ote naczynie";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldChalice;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldChest(C_Item)
{
	name = "Skrzynka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldChest;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_InnosStatue(C_Item)
{
	name = "Pos¹¿ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Sextant(C_Item)
{
	name = "Sekstans";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sextant;
	visual = "ItMi_Sextant.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_SilverCandleHolder(C_Item)
{
	name = "Srebrny œwiecznik";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCandleHolder;
	visual = "ItMi_SilverCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_SilverNecklace(C_Item)
{
	name = "Srebrny naszyjnik";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = Value_SilverNecklace;
	visual = "ItMi_SilverNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Sulfur(C_Item)
{
	name = "Siarka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sulfur;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Quartz(C_Item)
{
	name = "Kwarc";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Quartz;
	visual = "ItMi_Quartz.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ItMi_Pitch(C_Item)
{
	name = "Smo³a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pitch;
	visual = "ItMi_Pitch.3DS";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Rockcrystal(C_Item)
{
	name = "Ska³a krystaliczna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rockcrystal;
	visual = "ItMi_Rockcrystal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Aquamarine(C_Item)
{
	name = "Akwamaryn";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Aquamarine;
	visual = "ItMi_Aquamarine.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_HolyWater(C_Item)
{
	name = "Woda œwiêcona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Coal(C_Item)
{
	name = "Wêgiel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_DarkPearl(C_Item)
{
	name = "Czarna per³a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DarkPearl;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_ApfelTabak(C_Item)
{
	name = "Tabaka jab³kowa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_ApfelTabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "O s³odkim posmaku œwie¿ych jab³ek.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_PilzTabak(C_Item)
{
	name = "Tabaka grzybowa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_PilzTabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Mocna tabaka o smaku grzybów.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_DoppelTabak(C_Item)
{
	name = "Podwójna jab³kowa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_DoppelTabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "WyraŸny smak jab³ek...";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Honigtabak(C_Item)
{
	name = "Tabaka miodowa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_HonigTabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "S³odka tabaka z miodu.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_SumpfTabak(C_Item)
{
	name = "Tabaka zio³owa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_SumpfTabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Mieszanka bagiennego zio³a.";
	text[5] = NAME_Value;
	count[5] = value;
};

