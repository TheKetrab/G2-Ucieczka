func int ViewPtr_anXY(var int ptr, var int address, var int val)
{
	CALL_IntParam	(val);
	CALL__thiscall	(ptr, address);
	return CALL_RetValAsInt();
};

func int ViewPtr_anx(var int ptr, var int x) {
	return ViewPtr_anXY(ptr, zCView__anx, x);
};	

func int ViewPtr_any(var int ptr, var int y) {
	return ViewPtr_anXY(ptr, zCView__any, y);
};	

func void ViewPtr_InsertItem(var int ptr, var int child)
{
	CALL_IntParam	(0);
	CALL_PtrParam	(child);
	CALL__thiscall	(ptr, zCView__InsertItem);
};

func void ViewPtr_RemoveItem(var int ptr, var int child)
{
	CALL_PtrParam	(child);
	CALL__thiscall	(ptr, zCView__RemoveItem);
};

func void ViewPtr_Print(var int ptr, var int x, var int y, var string text)
{
	CALL_zStringPtrParam(text);
	CALL_IntParam(y);
	CALL_IntParam(x);
	CALL__thiscall(ptr, zCView__Print);
};

func void ViewPtr_SetPos(var int ptr, var int x, var int y)
{
	var zCView v; v = _^(ptr);
	
	if(x == -1) {
		x = v.vposx;
	};
	if(y == -1) {
		y = v.vposy;
	};
	
    CALL_IntParam(y);
    CALL_IntParam(x);
    CALL__thiscall(ptr, zCView__SetPos);
};