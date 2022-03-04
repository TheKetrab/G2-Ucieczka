
func int _Umin(var int a, var int b) {
	if (a <= b) { return a; };
	return b;
};

func int _Umax(var int a, var int b) {
	if (a >= b) { return a; };
	return b;
};

func int _Uclamp(var int a, var int v, var int b) {
	return _Umax(a, _Umin(v, b));
};
