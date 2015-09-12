# Russian Warfare Toolset

RWT is a set of scripts to bring features of immersive gameplay to Arma 3

## Installation

The repository contains a sample mission with scripts enabled.
To install it to your mission put RWT directory to your mission root.<br>
Edit your missions description.ext file to include RWT's configs:<br>
```
#include "RWT\rwt_ui.hpp"

class RscTitles {
  #include "RWT\rwt_rsctitles.hpp"  
};

class Params {
	#include "RWT\rwt_params.hpp"
};

class CfgSounds {
	#include "RWT\rwt_sounds.hpp"
};

class CfgFunctions {
	#include "RWT\rwt_functions.hpp"
};

class CfgNotifications {
	#include "RWT\rwt_notifications.hpp"
};
```

In initPlayerLocal.sqf place following code:<br>
```
[_player] call RWT_fnc_initPlayer;
```
