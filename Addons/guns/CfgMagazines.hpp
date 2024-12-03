class CfgMagazines
{
    class 32Rnd_155mm_Mo_shells;
    class habfuze_32Rnd_155mm_WP: 32Rnd_155mm_Mo_shells {
        scopeCurator=2;
        scopeArsenal=2;
        author="habitual";
        displayName="M109A6 155mm WP Smoke";
        displayNameShort="WP";
        displayNameMFDFormat="WP";
        count=32;
        ammo="habfuze_155mm_SMOKE";
    };
    class habfuze_32Rnd_155mm_HC: 32Rnd_155mm_Mo_shells {
            scopeCurator=2;
            scopeArsenal=2;
            author="habitual";
            displayName="M109A6 155mm HC Smoke";
            displayNameShort="HC";
            displayNameMFDFormat="HC";
            count=32;
            ammo="habfuze_155mm_SMOKE_HC";
        };
    class habfuze_16Rnd_155mm_M712 : 32Rnd_155mm_Mo_shells {
        scopeCurator=2;
        scopeArsenal=2;
        author="habitual";
        displayName="M109A6 155mm M712 Copperhead";
        displayNameShort="M712";
        displayNameMFDFormat="M712";
        count=16;
        ammo="habfuze_155mm_m712";
    };
    class rhs_mag_m60a2_smoke_4;
    class habfuze_105mm_smoke_12Rnd: rhs_mag_m60a2_smoke_4 {
        scopeCurator=2;
        scopeArsenal=2;
        author="habitual";
        displayName="M119 105mm WP Smoke";
        displayNameShort="105mm WP";
        displayNameMFDFormat="105mm";
        count=12;
        ammo="habfuze_105mm_smoke";
    };

    class rhs_12Rnd_m821_HE;
    class habfuze_81mm_12Rnd_WP: rhs_12Rnd_m821_HE {
        scopeCurator=2;
        scopeArsenal=2;
        author="habitual";
        displayName="81mm WP";
        displayNameShort="WP";
        displayNameMFDFormat="WP";
        ammo="HabFuze_A_82mm_SMOKE";
    };
};


class ACE_CSW_Groups {
    class ace_1Rnd_82mm_Mo_HE;
    class ace_1Rnd_82mm_Mo_HE {
        ACE_1Rnd_82mm_Mo_HE = 1;
        8Rnd_82mm_Mo_shells = 1;
        rhs_12Rnd_m821_HE = 1;
        rhs_mag_3vo18_10 = 1;
    };
};