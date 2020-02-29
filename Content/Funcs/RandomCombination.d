
// @Splash
func void CreateRandomCombination(var int mobPtr, var int length)
{
    var string combination; combination = "";
    var int i; i = 0;

    repeat(i, length);
        if (Hlp_Random(2)) {
            combination = ConcatStrings(combination, "L");
        }
        else {
            combination = ConcatStrings(combination, "R");
        };
    end;

    var oCMobLockable mob; mob = _^(mobPtr);
    mob.pickLockStr = combination;
};

// @Siemekk
func void SetRandomCombination(var int node)
{
    var zCListSort list; list = _^(node);

	var int ptr; ptr = list.data;
		
	if (Hlp_Is_oCMobLockable(ptr))
	{
		var oCMobLockable mob; mob = _^(ptr);
		var int len; len = STR_Len(mob.pickLockStr);

		if(len)
		{
			CreateRandomCombination(ptr, len);
		};
	};

};
