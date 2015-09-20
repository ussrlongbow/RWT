class RWT
{
	tag = "RWT";
	class forInit {
		class rwt_config {
			file = "RWT\rwt_config.sqf";
			preInit = 1;
		};
	};
	class forArrays {
		file = "RWT\functions\forArrays";
		class arrayRotate;
		class arrayUniqueIntersect;
		class arrayMaxValue;
	};
	class forConfigs {
		file = "RWT\functions\forConfigs";
		class getCompatibleWeaponItems;
	};
	class forControls {
		file = "RWT\functions\forControls";
		class keyDown;
		class keyUp;
		class ctrlDown;
		class ctrlUp;
	};
	class forInventory {
		file = "RWT\functions\forInventory";
		class getUnitCapacity;
		class getUnitFreeSpace;
		class getItemMass;
		class hasSomeBombs;
	};
	class forPlayers {
		file = "RWT\functions\forPlayers";
		class initPlayer;
		class toggleEarplugs;
		class toggleLights;
	};
	class forSmartMenu {
		file = "RWT\functions\forSM";
		class smartMenuConfig;
		class smartMenuToggle;
		class smartMenuScroll;
		class smartMenuAct;
		class smartDebug;
		class smartMenuIcon;
		class smartShowBombs;
	};
	class forUI {
		file = "RWT\functions\forUI";
		class spawnNotification;
		class spawnWeaponMenu;
		class swapSidemount;
		class uiDebug;
		class scrollNumber;
		class expLocalizeBombName;
		class expFindBombImage;
	};
	class forVehicles {
		file = "RWT\functions\forVehicles";
		class initVehicle;
		//class enableLaserGuide;
		class findDoor;
		class doorMove;
	};
	class forWeapons {
		file = "RWT\functions\forWeapons";
		class getFiremodeToPic;
		class limitArsenal;
		class limitArsenalTFAR;
		class getAvailableWeaponItems;
		class getNonFullMagazines;
		class simpleMagRepack;
		class rotateBomb;
		class ifaceExplosives;
		class placeBomb;
	};
};