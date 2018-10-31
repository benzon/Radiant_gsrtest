# Radiant GSR Test - v1.7
**Version:** 1.7
**Created by:** BattleRat for Radiant RP

# ESX_GSR - v1.1
**Version:** 1.1
**Created by:** BZNDK aka. BenZoN

**Requirements Radiant_gsrtest**
[es_extended](https://github.com/ESX-Org/es_extended)
[pNotify](https://github.com/Nick78111/pNotify)
[mysql-async v3.x.x](https://github.com/brouznouf/fivem-mysql-async)

**Requirements esx_gsr**
[es_extended](https://github.com/ESX-Org/es_extended)
[pNotify](https://github.com/Nick78111/pNotify)

**Description**
This script will allow players with the "police" job to run a GSR (gun shot residue) test to see if a player has shot a gun within a certain amount of time.

Difference of Radiant GSR Test and ESX_GSR is that ESX_GSR dos not use MySQL to save the GSR data, and there is a couple of extra configuration options ex. (you can now set the amount of time the player needs to be in water to wash off the gsr)

**Features**
- Will auto count down the timer in the database and will delete the entry once the timer is over.
- If you shoot again while you are already in the database, it will restart the timer again.
- Auto deletes entry from the database when the player disconnects.
- Auto clear the database table on server restart/start.
- Current timer set to about 60 minutes (1 Hour) I believe

**Installation Radiant_gsrtest**
- Download - https://github.com/BattleRattt/Radiant_gsrtest/archive/master.zip
- Put it in the `[esx]` directory
- Import `gsr.sql` in your database
- Add this to your  `server.cfg`:
```
start Radiant_gsrtest
```

**Installation esx_gsr**
- Download - https://github.com/BattleRattt/Radiant_gsrtest/archive/master.zip
- Put it in the `[esx]` directory
- Add this to your  `server.cfg`:
```
start esx_gsr
```
## Legal
Radiant_gsrtest - Radiant GSR Test
esx_gsr - GSR Test

Copyright (C) 2015-2018 BattleRattt and BenZoN

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see  [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).
