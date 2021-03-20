//Thanks for @Splash and @Siemekk for advices


const int oCMobLockable__pickLockStr_Offset = 588;

func void SetRandomCombination(var int ptr)
{		
	var int pickLockStrAdr; pickLockStrAdr = ptr+oCMobLockable__pickLockStr_Offset;
	var int len; len = MEM_ReadInt(pickLockStrAdr+zSTRING_Lenght_Offset);

	if(len == 0){ return; };
		
	var string combination; combination = "";
	var int i; i = 0;

	repeat(i, len);
		if (Hlp_Random(2)) {
			combination = ConcatStrings(combination, "L");
		}
		else {
			combination = ConcatStrings(combination, "R");
		};
	end;

	MEM_WriteString(pickLockStrAdr,combination);
};

func void ForAllMobs_RandomCombination()
{
	 var int list; list = MEM_World.voblist;
	 while(list);
		var int data; data = MEM_ReadInt(list+zCListSort_Data_Offset);
		if (Hlp_Is_oCMobLockable(data))
		{
			SetRandomCombination(data);
		};
		var int next; next = MEM_ReadInt(list+zCListSort_Next_Offset);
        list = next;
    end;
};
