
func string TeachString(var string abilityText, var int gold, var int lp) {

	var string result; result = abilityText;
	result = ConcatStrings(result," (");
	result = ConcatStrings(result,IntToString(gold));
	result = ConcatStrings(result," szt. z³ota) (Koszt: ");
	result = ConcatStrings(result,IntToString(lp));
	result = ConcatStrings(result," PN)");
	
	return result;
};