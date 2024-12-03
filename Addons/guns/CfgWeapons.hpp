class CfgWeapons{
    class Launcher;
        class Launcher_Base_F: Launcher {
            class WeaponSlotsInfo;
        };
    class rhs_mortar_81mm;
    class habfuze_mortar_81mm: rhs_mortar_81mm {
        magazines[] = {"rhs_1Rnd_m821_HE","rhs_12Rnd_m821_HE", "8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_Smoke_white","8Rnd_82mm_Mo_guided","8Rnd_82mm_Mo_LG", "habfuze_81mm_12Rnd_WP"};
    };

    class rhs_weap_m284;
    class habfuze_weap_m284: rhs_weap_m284 {
    ace_laser_canSelect = 1;
    magazines[] = {"habfuze_16Rnd_155mm_M712", "rhs_mag_155mm_m795_28","rhs_mag_155mm_m825a1_2","rhs_mag_155mm_485_2","rhs_mag_155mm_m712_2","rhs_mag_155mm_m731_1","rhs_mag_155mm_raams_1","rhs_mag_155mm_m864_3","habfuze_32Rnd_155mm_WP", "habfuze_32Rnd_155mm_HC"};
    };

    class RHS_weap_M119;
    class habfuze_weap_M119: RHS_weap_M119 {
    magazines[] = {"RHS_mag_m1_he_12","rhs_mag_m314_ilum_4","habfuze_105mm_smoke_12Rnd"};
    };

    class habfuze_mortar_81_carry: Launcher_Base_F {
        scope = 2;
        displayName = "M252 (VT Fuze) Gun Bag";
        modes[] = {};
        model = "\z\ace\addons\apl\ACE_CSW_Bag.p3d";
        picture = "\rhsusf\addons\rhsusf_heavyweapons\data\ico\RHS_M252_D_ca.paa";
        class ACE_CSW {
            type = "weapon"; // Use "weapon" for weapons or "mount" for tripods - see below
            deployTime = 10;  // How long it takes to deploy the weapon onto the tripod
            pickupTime = 10;  // How long it takes to disassemble weapon from the tripod
            class assembleTo {
                // What tripod can this weapon deploy onto, and what vehicle will it spawn when it is deployed
                ace_csw_mortarBaseplate = "hab_fuze_rhsusf_m252_d";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
                    class MuzzleSlot {
                        iconScale = 0.1;
                    };
                    mass = 300; // 84 lb / 38 kg
                };

    };


    class habfuze_mortar_81mm_proxy: habfuze_mortar_81mm {
        magazineReloadTime = 0.5;
    };
};