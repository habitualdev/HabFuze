class CfgAmmo{
	class ammo_ShipCannon_120mm_HE;
	class habfuze_120mm: ammo_ShipCannon_120mm_HE {
    explosionTime = 0.0001;
	};
	
	class Sh_155mm_AMOS;
	class habfuze_155mm: Sh_155mm_AMOS {
	explosionTime = 0.0001;
	};
	
	class Sh_82mm_AMOS;
	class habfuze_82mm: Sh_82mm_AMOS {
	explosionTime = 0.0001;
	};

	class HabFuze_A_82mm_SMOKE: Sh_82mm_AMOS
        	{
        	    ace_frag_metal = 10;
        	    ace_frag_charge = 10;
        		hit=50;
        		indirectHit=30;
        		indirectHitRange=6;
        		dangerRadiusHit=-1;
        		suppressionRadiusHit=15;
        		CraterEffects="HEShellCrater";
        		CraterWaterEffects="ImpactEffectsWaterHE";
        		ExplosionEffects="HabFuze_WPExplosion_81";
        		artilleryCharge=0.50999999;
        	};

    class habfuze_155mm_SMOKE: Sh_155mm_AMOS
        	{
        	    ace_frag_metal = 10;
        	    ace_frag_charge = 10;
        		hit=50;
        		indirectHit=30;
        		indirectHitRange=6;
        		dangerRadiusHit=-1;
        		suppressionRadiusHit=15;
        		CraterEffects="HEShellCrater";
        		CraterWaterEffects="ImpactEffectsWaterHE";
        		ExplosionEffects="HabFuze_WPExplosion_155";
        		artilleryCharge=0.50999999;
        	};
};
