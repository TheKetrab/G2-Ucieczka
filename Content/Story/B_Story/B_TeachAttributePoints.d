// **********************
// B_TeachAttributePoints
// ----------------------
// Kosten abh. v. Gilde
// **********************

// ----------------------------
func int B_TeachAttributePoints (var C_NPC slf, var C_NPC oth, var int attrib, var int points, var int teacherMAX)
{
	var string concatText;

	// ------ Kostenberechnung ------
	var int kosten; 
	
	kosten = CalculateLearnLPCost(GetTalentNameByAttribute(attrib), points, teacherMax); // (B_GetLearnCostAttribute (oth, attrib) * points);
	
	
	//EXIT IF...
	
	// ------ falscher Parameter ------
	if (attrib!=ATR_STRENGTH) && (attrib!=ATR_DEXTERITY) && (attrib!=ATR_MANA_MAX)
	{
		//Print ("*** ERROR: Wrong Parameter ***");
		PrintS_Ext("*** ERROR: Wrong Parameter ***", RGBA(255,255,255,0));
		return FALSE;
	};
	
	// ------ Lernen NICHT �ber teacherMax ------
	var int realAttribute;
	if 		(attrib == ATR_STRENGTH)	{	realAttribute = oth.attribute[ATR_STRENGTH];	}	// Umwandeln von const-Parameter in VAR f�r folgende If-Abfrage
	else if (attrib == ATR_DEXTERITY)	{	realAttribute = oth.attribute[ATR_DEXTERITY];	}
	else if (attrib == ATR_MANA_MAX)	{	realAttribute = oth.attribute[ATR_MANA_MAX];	};
	
	if (realAttribute >= teacherMAX)				//Wenn der Spieler schon das teacherMAX erreicht oder �berschritten hat
	{
		concatText = ConcatStrings (PRINT_NoLearnOverPersonalMAX, IntToString(teacherMAX));
		//PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
		PrintS_Ext(concatText, RGBA(255,255,255,0));
		B_Say (slf, oth, "$NOLEARNYOUREBETTER");
	
		return FALSE;
	};
	
	if ((realAttribute + points) > teacherMAX)
	{
		concatText = ConcatStrings (PRINT_NoLearnOverPersonalMAX, IntToString(teacherMAX));
		//PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
		PrintS_Ext(concatText, RGBA(255,255,255,0));
		B_Say (slf, oth, "$NOLEARNOVERPERSONALMAX");
	
		return FALSE;
	};
		
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		//PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
		PrintS_Ext(PRINT_NotEnoughLP, RGBA(255,255,255,0));
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
		
		
	// FUNC
				
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
		
	B_RaiseAttribute (oth, attrib, points, TRUE);
	
	return TRUE;
};
