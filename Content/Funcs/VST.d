// V = s/t -> s = V*t

// NASZ_ZAPALISADA_KLASZTOR_03
// NASZ_ZAPALISADA_KLASZTOR_18
// -> dist = 5250 cm = 52,5 m

// RUN:
// 15s - 52,5m
// x s - 1m --> x = 0,285 s
// ==> 250 ms +=1

// WALK:
// 35s - 52,5m
// x s - 1m --> x = 0,67 s
// ==> 3x 250 ms +=1

// SPRINT:
// 8,5 s - 52,5m
// 0,25 s - x -> x = 1,54
// -> 0,5s -> 3m
// ==> 2x 250 ms += 3
// ==> 1x 250 ms += 1

// SNEAK:
// 80 s - 52,5 m
// x s - 1m --> x = 1,52 s
// ==> 6x 250 ms += 1


const int VST_RUN = 1;
const int VST_WALK = 2;
const int VST_SPRINT = 3;
const int VST_SNEAK = 4;

var int VST_Current;
var int VST_Previous;
var int VST_Time; // ile razy current == previous

var int VST_Kilometers;
var int VST_Meters;
/*
class oCNpcTimedOverlay 
{
    var string m_sMdsName;
    var float m_fTime;
};

const string Sprint_Mds = "HUMANS_SPRINT.MDS";

func int SprintMdsActived()
{
	var oCNpc her; her = Hlp_GetNpc(hero);
	
	
	var int mds; mds = her.timedOverlays_data;
	var int loop; loop = MEM_StackPos.position;
	
	if(mds)
	{
		var string mdsName; mdsName = MEM_ReadString(mds);
		Print(mdsName);
		if(Hlp_StrCmp(mdsName,Sprint_Mds))
		{
			Print("aaaa");
			
			return 1;
		};
		
		mds = MEM_ReadInt(mds+4);
		MEM_StackPos.position = loop;
	}
	else
	{
		return 0;
	};
	
	
};*/

// frame function every 250 ms
func void DistanceMeasurement() {

	// archivize
	VST_Previous = VST_Current;

	// set new VST mode
	if      (WillMaUbranySpeedRing && C_BodyStateContains(hero,BS_RUN))	{ VST_Current = VST_SPRINT;	} // UWAGA, nie dziala na miksturze szybkosci i zebatym zielu, trzebaby zrobic ticktocka po wypiciu/zjedzeniu, nie dziala tez na apply overlay mds humans_sprint
	//if      (C_BodyStateContains(hero,BS_RUN) && (WillMaUbranySpeedRing || SprintMdsActived()))	{ VST_Current = VST_SPRINT;	} 
	else if (C_BodyStateContains(hero,BS_RUN))							{ VST_Current = VST_RUN;	}
	else if (C_BodyStateContains(hero,BS_WALK))							{ VST_Current = VST_WALK;	}
	else if (C_BodyStateContains(hero,BS_SNEAK)) 						{ VST_Current = VST_SNEAK;	}
	else 																{ VST_Current = 0;			};

	// Print(ConcatStrings("Current: ",IntToString(VST_Current)));
	// Print(ConcatStrings("Time: ",IntToString(VST_Time)));

	// ----- ----- -----
	//     measure
	if (VST_Previous == VST_Current) { 
		
		VST_Time += 1; 

		if      (VST_Current == VST_RUN)							{ VST_Meters += 1; VST_Time = 0; }
		else if (VST_Current == VST_WALK && VST_Time == 3)			{ VST_Meters += 1; VST_Time = 0; }
		else if (VST_Current == VST_SPRINT && VST_Time == 2)		{ VST_Meters += 3; VST_Time = 0; }
		else if (VST_Current == VST_SNEAK && VST_Time == 6)			{ VST_Meters += 1; VST_Time = 0; };
		
	}
	
	// clean if changed
	else {
		VST_Time = 0;
	};
	
	
	// recount meters to kilometers
	if (VST_Meters >= 1000) {
		var int km; km = VST_Meters / 1000;
		VST_Kilometers += km;
		VST_Meters = VST_Meters - km*1000;
	};
};
