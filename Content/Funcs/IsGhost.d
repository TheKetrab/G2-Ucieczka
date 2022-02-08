func int C_IsGhost(var c_npc slf) {

	if (slf.id == 17) // Joru
	|| (slf.id == 23) // Duch Sekciarza
	|| (slf.id == 24) // BaalOrun
	|| (slf.id == 25) // Shrat
	|| (slf.id == 26) // Duch Nowicjusza
	|| (slf.id == 27) // Ghorim
	|| (slf.id == 30) // Dusty
	{
		return TRUE;
	};

	return FALSE;
};