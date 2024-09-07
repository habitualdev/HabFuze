// M109A6
class CfgVehicles {
	class LandVehicle;
	class Tank: LandVehicle {
        class ACE_SelfActions;
	};
	class Tank_F: Tank {
        class ACE_SelfActions: ACE_SelfActions {};
		class Turrets {
			class MainTurret;
		};
		class AnimationSources;
	};
	class MBT_01_base_F: Tank_F {
        class ACE_SelfActions: ACE_SelfActions {};
		class Turrets: Turrets {
				class MainTurret: MainTurret {};
		};
		class AnimationSources: AnimationSources {};
	};
	class MBT_01_arty_base_F: MBT_01_base_F {
        class ACE_SelfActions: ACE_SelfActions {};
		class AnimationSources: AnimationSources {};
		class Turrets: Turrets {
				class MainTurret: MainTurret { };
		};
	};
	class B_MBT_01_arty_base_F: MBT_01_arty_base_F {
        class ACE_SelfActions: ACE_SelfActions {};
		class AnimationSources: AnimationSources {};
		class Turrets: Turrets {
				class MainTurret: MainTurret { };
		};
	};

	class rhsusf_m109tank_base : B_MBT_01_arty_base_F {
        class ACE_SelfActions: ACE_SelfActions {};
		class AnimationSources: AnimationSources {};
		class Turrets: Turrets {
				class MainTurret: MainTurret { };
		};
	};
	class rhsusf_m109_usarmy: rhsusf_m109tank_base {
		class AnimationSources: AnimationSources {};
		class Turrets: Turrets {
				class MainTurret: MainTurret { };
		};
	};
	class habfuze_rhsusf_m109_usarmy: rhsusf_m109_usarmy {
		displayname = "M109A6 VT Fuze (WD)";
		scopeCurator = 2;
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				magazines[] = {
					rhs_mag_155mm_m795_28, rhs_mag_155mm_m825a1_2, rhs_mag_155mm_485_2, rhs_mag_155mm_m712_2, rhs_mag_155mm_m731_1, rhs_mag_155mm_raams_1, rhs_mag_155mm_m864_3
				};
				lockWhenVehicleSpeed= 5;
				maxHorizontalRotSpeed = "((360/30)/45)";
			};
		};
		class EventHandlers {
				init = "_this call HAB_FUZE_fnc_init_m109_fuzes";
		
		};
		class AnimationSources: AnimationSources {};
	};
	class rhsusf_m109d_usarmy: rhsusf_m109_usarmy {
        class ACE_SelfActions: ACE_SelfActions {};
		class AnimationSources: AnimationSources {};
		class Turrets: Turrets {
				class MainTurret: MainTurret { };
		};
	};
	class habfuze_rhsusf_m109d_usarmy: rhsusf_m109d_usarmy {
		displayname = "M109A6 VT Fuze";
		scopeCurator = 2;
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				magazines[] = {
					rhs_mag_155mm_m795_28, rhs_mag_155mm_m825a1_2, rhs_mag_155mm_485_2, rhs_mag_155mm_m712_2, rhs_mag_155mm_m731_1, rhs_mag_155mm_raams_1, rhs_mag_155mm_m864_3
				};
				lockWhenVehicleSpeed= 5;
				maxHorizontalRotSpeed = "((360/30)/45)";
			};
		};
		class AnimationSources: AnimationSources {};
		class EventHandlers {
			init = "_this call HAB_FUZE_fnc_init_m109_fuzes"
		};
	};
	
// M252

		class NewTurret;
		class Bag_Base;
	class Weapon_Bag_Base: Bag_Base {
		class assembleInfo;
	};
	class RHS_M2_Tripod_Bag: Weapon_Bag_Base {
		class assembleInfo: assembleInfo {};
	};
	class rhs_M252_Bipod_Bag: RHS_M2_Tripod_Bag {
		class assembleInfo: assembleInfo {};
	};
	class habfuze_M252_Bipod_Bag: rhs_M252_Bipod_Bag {
		displayName = "M252 VT Fuze Tripod Bag";
		class assembleInfo: assembleInfo {
			displayName = "M252 VT Fuze Mortar";
			assembleTo = "hab_fuze_rhsusf_m252_d";
			base[] = {"habfuze_M252_Gun_Bag"};
		};
	};
	class RHS_M2_Gun_Bag;
	class rhs_M252_Gun_Bag: RHS_M2_Gun_Bag { };
	class habfuze_M252_Gun_Bag: RHS_M2_Gun_Bag {
		displayName = "M252 VT Fuze Gun Bag";
	};
	class StaticWeapon: LandVehicle {
		class Turrets {
			class MainTurret: NewTurret {};
		};
	};
	class StaticMortar: StaticWeapon {
		class Turrets: Turrets {
			class MainTurret: MainTurret {};
		};
	};
	class RHS_M252_Base: StaticMortar {
		class Turrets: Turrets {
			class MainTurret: MainTurret {};
		};
	};
	class RHS_M252_D: RHS_M252_Base	{
		class Turrets: Turrets {
			class MainTurret: MainTurret {};
		};
	};
	class hab_fuze_rhsusf_m252_d: RHS_M252_D {
		displayname = "M252 VT Fuze";
		scopeCurator = 2;
		class assembleInfo {
			primary = 0;
			base = "";
			assembleTo = "";
			dissasembleTo[] = {"habfuze_M252_Bipod_Bag", "habfuze_M252_Gun_Bag"};
			displayName = "";
		};
		class EventHandlers {
			init = "_this call HAB_FUZE_fnc_init_m252_fuzes"
		};
	};
	
	// Naval Gun
	
	class StaticMGWeapon: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
	};
	
	class B_Ship_Gun_01_base_F: StaticMGWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
		};
	};
	
	class hab_fuze_NGS01_base: B_Ship_Gun_01_base_F {
	};

	class hab_fuze_NGS01_hammer: hab_fuze_NGS01_base {
		scope = 2;
		author = "habitual";
		displayName = "Mk45 Hammer (VT Fuze)";
		scopeCurator = 2;
		side = 1;
		faction = "BLU_F";
		crew = "B_UAV_AI";
		typicalCargo[] = {"B_UAV_AI"};
		class EventHandlers {
			init = "_this call HAB_FUZE_fnc_init_naval_fuzes"
		};
	};
	

};