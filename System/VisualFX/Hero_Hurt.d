/***********************************\
             BLOODSPLATS
\***********************************/

/* Diese Instanz wird in der Bloodsplats.d verwendet
 * und gehört in Scripts/System/VisualFX/VisualFxInst.d
 */

instance HERO_HURT(CFx_Base_Proto)
{
    visName_S = "screenblend.scx";
    userString[0] = "0.1";
    userString[1] = "128 0 0 64";
    userString[2] = "0.1";
    userString[3] = "";
    visAlphaBlendFunc_S = "ADD";
    emFXLifeSpan = 0.1;
};