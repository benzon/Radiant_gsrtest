/////License/////
Do not reupload/re release any part of this script without my permission

------------------------------------------------------------------------------------------------------------------------------

SCRIPT NAME - Radiant GSR Test
VERSION - V1.5
CREATED BY: BattleRat for Radiant RP

DESCRIPTION - This script will allow players with the "police" job to run a GSR (gun shot residue) test to see
			if a player has shot a gun within a certain amount of time.

USAGE - police can type /gsr <id number> and it will show a pNotify on screen letting you know if they are clean or not.

FEATURES:
- Will auto count down the timer in the database and will delete the entry once the timer is over.
- If you shoot again while you are already in the database, it will restart the timer again.
- Auto deletes entry from the database when the player disconnects.
- Auto clear the database table on server restart/start.
- Current timer set to about 60 minutes (1 Hour) I believe


IF YOU WOULD LIKE TO SEE THE DATABASE UPDATE MORE FREQUENTLY FEEL FREE TO UNCOMMENT ANY OF THE LINES
BETWEEN LINES " 58 - 69 " ON THE CLIENT SIDE OF THE SCRIPT.

REQUIRED - ESX and pNotify and MySQL Async

