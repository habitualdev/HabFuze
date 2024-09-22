class CfgCloudlets
{
	class Default;
	class WPCloud;

	class HabFuze_WPLinger_81: Default {
	        interval=.25;
    		circleRadius=0;
    		circleVelocity[]={0,0,0};
    		particleShape="\A3\data_f\ParticleEffects\Universal\Universal";
    		particleFSNtieth=16;
    		particleFSIndex=12;
    		particleFSFrameCount=13;
    		particleFSLoop=0;
    		angleVar=1;
    		animationName="";
    		particleType="Billboard";
    		timerPeriod=1;
    		lifeTime=12;
    		lifeTimeVar=4;
    		moveVelocity[]={0.2,0,0.2};
    		rotationVelocity=0;
    		weight=10;
    		volume=7.9000001;
    		rubbing=0.1;
    		size[]={5,10,13,16,18,20,21,22};
    		color[]=
    		{
    			{1,1,1,1},
    			{1,1,1,0}
    		};
    		animationSpeed[]={3,2,1};
    		randomDirectionPeriod=1;
    		randomDirectionIntensity=0;
    		onTimerScript="";
    		positionVar[]={4,3,4};
    		MoveVelocityVar[]={0.2,0.2,0.2};
    		rotationVelocityVar=20;
    		sizeVar=0.30000001;
    		colorVar[]={0,0,0,0};
    		randomDirectionPeriodVar=0;
    		randomDirectionIntensityVar=0;
            damageType="Fire";
    		coreDistance=7;
    		coreIntensity=200;
    		damageTime=0.1;
    		emissiveColor[] = {{30,30,30,0},{0,0,0,0}};
    };

    	class HabFuze_WPLinger_155: Default {
    	        interval=.25;
        		circleRadius=0;
        		circleVelocity[]={0,0,0};
        		particleShape="\A3\data_f\ParticleEffects\Universal\Universal";
        		particleFSNtieth=16;
        		particleFSIndex=12;
        		particleFSFrameCount=13;
        		particleFSLoop=0;
        		angleVar=1;
        		animationName="";
        		particleType="Billboard";
        		timerPeriod=1;
        		lifeTime=12;
        		lifeTimeVar=4;
        		moveVelocity[]={0.2,0,0.2};
        		rotationVelocity=0;
        		weight=10;
        		volume=7.9000001;
        		rubbing=0.1;
        		size[]={5,10,13,16,18,20,21,22};
        		color[]=
        		{
        			{1,1,1,1},
        			{1,1,1,0}
        		};
        		animationSpeed[]={3,2,1};
        		randomDirectionPeriod=1;
        		randomDirectionIntensity=0;
        		onTimerScript="";
        		positionVar[]={10,10,10};
        		MoveVelocityVar[]={0.2,0.2,0.2};
        		rotationVelocityVar=20;
        		sizeVar=0.30000001;
        		colorVar[]={0,0,0,0};
        		randomDirectionPeriodVar=0;
        		randomDirectionIntensityVar=0;
                damageType="Fire";
        		coreDistance=12;
        		coreIntensity=200;
        		damageTime=0.1;
        		emissiveColor[] = {{30,30,30,0},{0,0,0,0}};
        };

	class WPtrails;
	class HabFuze_WPCloud_81: Default
	{
		interval=.5;
		circleRadius=0;
		circleVelocity[]={0,0,0};
		particleShape="\A3\data_f\ParticleEffects\Universal\Universal";
		particleFSNtieth=16;
		particleFSIndex=12;
		particleFSFrameCount=13;
		particleFSLoop=0;
		angleVar=1;
		animationName="";
		particleType="Billboard";
		timerPeriod=1;
		lifeTime=12;
		lifeTimeVar=4;
		moveVelocity[]={0.2,0,0.2};
		rotationVelocity=0;
		weight=10;
		volume=7.9000001;
		rubbing=0.1;
		size[]={5,10,13,16,18,20,21,22};
		color[]=
		{
			{1,1,1,1},
			{1,1,1,0}
		};
		animationSpeed[]={3,2,1};
		randomDirectionPeriod=1;
		randomDirectionIntensity=0;
		onTimerScript="";
		beforeDestroyScript="habfuze\AddOns\fuze_functions\habfuze_wp_81.sqf";
		positionVar[]={4,3,4};
		MoveVelocityVar[]={0.2,0.2,0.2};
		rotationVelocityVar=20;
		sizeVar=0.30000001;
		colorVar[]={0,0,0,0};
		randomDirectionPeriodVar=0;
		randomDirectionIntensityVar=0;
	};

	class HabFuze_WPCloud_155: Default
	{
		interval=.5;
		circleRadius=0;
		circleVelocity[]={0,0,0};
		particleShape="\A3\data_f\ParticleEffects\Universal\Universal";
		particleFSNtieth=16;
		particleFSIndex=12;
		particleFSFrameCount=13;
		particleFSLoop=0;
		angleVar=1;
		animationName="";
		particleType="Billboard";
		timerPeriod=1;
		lifeTime=12;
		lifeTimeVar=4;
		moveVelocity[]={0.2,0,0.2};
		rotationVelocity=0;
		weight=10;
		volume=7.9000001;
		rubbing=0.1;
		size[]={5,10,13,16,18,20,21,22};
		color[]=
		{
			{1,1,1,1},
			{1,1,1,0}
		};
		animationSpeed[]={3,2,1};
		randomDirectionPeriod=1;
		randomDirectionIntensity=0;
		onTimerScript="";
		beforeDestroyScript="habfuze\AddOns\fuze_functions\habfuze_wp_155.sqf";
		positionVar[]={10,10,10};
		MoveVelocityVar[]={0.2,0.2,0.2};
		rotationVelocityVar=20;
		sizeVar=0.30000001;
		colorVar[]={0,0,0,0};
		randomDirectionPeriodVar=0;
		randomDirectionIntensityVar=0;
	};
};


class HabFuze_WPExplosion_81
{
	class LightExp
	{
		simulation="light";
		type="ExploLight";
		position[]={0,0,0};
		intensity=0.001;
		interval=1;
		lifeTime=1;
	};
	class Explosion1
	{
		simulation="particles";
		type="WPCloud";
		position[]={0,0,0};
		intensity=1;
		interval=1;
		lifeTime=1;
	};
	class Explosion2
	{
		simulation="particles";
		type="HabFuze_WPCloud_81";
		position[]={0,0,0};
		intensity=1;
		interval=1;
		lifeTime=1;
	};
	class Trails
	{
		simulation="particles";
		type="WPTrails";
		position[]={0,0,0};
		intensity=1;
		interval=1;
		lifeTime=1;
	};
};

class HabFuze_WPExplosion_155
{
	class LightExp
	{
		simulation="light";
		type="ExploLight";
		position[]={0,0,0};
		intensity=0.001;
		interval=1;
		lifeTime=1;
	};
	class Explosion1
	{
		simulation="particles";
		type="WPCloud";
		position[]={0,0,0};
		intensity=1;
		interval=1;
		lifeTime=1;
	};
	class Explosion2
	{
		simulation="particles";
		type="HabFuze_WPCloud_155";
		position[]={0,0,0};
		intensity=1;
		interval=1;
		lifeTime=1;
	};
	class Trails
	{
		simulation="particles";
		type="WPTrails";
		position[]={0,0,0};
		intensity=1;
		interval=1;
		lifeTime=1;
	};
};