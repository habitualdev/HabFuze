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

	class rhs_ammo_m1_he;
	class habfuze_105mm: rhs_ammo_m1_he {
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

        	class rhs_ammo_m60a2_smoke;
        	class habfuze_105mm_smoke: rhs_ammo_m1_he {
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
    class habfuze_155mm_SMOKE_HC: Sh_155mm_AMOS
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
                    ExplosionEffects="HabFuze_HCExplosion_155";
                    artilleryCharge=0.50999999;
                };


    class habfuze_155mm_m712: Sh_155mm_AMOS
                {
                    cameraViewAvailable = 1;
                    initTime = 0;
                    thrustTime = 0;
                    thrust = 0;
                    manualControl = 0;
                    artilleryLock = 0;
                    maneuverability = 0;
                    artilleryCharge=0.50999999;
                    airFriction = 0;
                    sideAirFriction = .2;
                    autoSeekTarget = 0;
                    laserLock = 0;
                    lockType = 0;
                    ace_frag_charge = 669;
                    ace_frag_metal = 1000;
                    model = "\A3\Weapons_F\Ammo\Bomb_01_fly_F";
                    simulation = "shotMissile";
                    ACE_damageType = "shell";
                    hit = 25;
                    indirectHit = 100;
                    indirectHitRange = 10;
                    weaponLockSystem = 0;
                    trackOversteer = 1;
                    trackLead = 1;
                    CraterEffects = "ExploAmmoCrater";
                    explosionEffects = "ATRocketExplosion";
                    submunitionAmmo = "ammo_Penetrator_Scalpel";
                    submunitionDirectionType = "SubmunitionModelDirection";
                    submunitionInitialOffset[] = {0,0,-0.2};
                    submunitionInitSpeed = 1000;
                    submunitionParentSpeedCoef = 0;
                    triggerOnImpact = 1;
                    class ace_missileguidance {
                        enabled = 1;
                        canVanillaLock = 0;
                        pitchRate = 10;
                        yawRate = 10;
                        defaultAttackProfile = "DIR";
                        defaultSeekerType = "SALH";
                        seekerTypes[] = { "SALH" };

                        defaultSeekerLockMode = "LOAL";
                        seekerLockModes[] = { "LOAL" };

                        defaultNavigationType = "Direct";
                        navigationTypes[] = { "Direct" };

                        seekLastTargetPos = 1;
                        seekerAngle = 90;
                        seekerAccuracy = 1;

                        seekerMinRange = 1;
                        seekerMaxRange = 2000;
                        attackProfiles[] = {"DIR"};
                    };

                };
};

