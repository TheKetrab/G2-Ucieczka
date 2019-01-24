
var int Uroboros_Exp;

func void B_Add_Uroboros_Exp() {

	if (Uroboros_Exp == 0) {
		Uroboros_Exp = 50;
	};

	B_GivePlayerXP(Uroboros_Exp);
	Uroboros_Exp *= 2;
};

