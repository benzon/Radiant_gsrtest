--[[
Radiant GSR Test V1.5
Credits - BattleRat
/////License/////
Do not reupload/re release any part of this script without my permission
]]


ESX = nil
local hasShot = false

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

------------ CODE STARTS HERE ---------------

local timer = 3600


Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsPedShooting(GetPlayerPed(-1)) and not (hasShot) then
      hasShot = true
		  TriggerServerEvent('addGsrRecord', timer)
    elseif IsPedShooting(GetPlayerPed(-1)) and (hasShot) then
      hasShot = true
      timer = 3600
      TriggerServerEvent('timeUpdate', timer)
		end
	end
end)


Citizen.CreateThread(function()
  while true do
    Wait(0)
    if (hasShot) and timer > 0 then
      timer = timer - 0.1
      timecheck(timer)
    end

    if timer <= 1 and (hasShot) then
      hasShot = false
      timer = 3600
      TriggerServerEvent('removeGsrRecord')
    end
  end
end)



function timecheck(time)
  if time < 3600 and time > 3500 then
    TriggerServerEvent('timeUpdate', time)
--  elseif time < 2500 and time > 2400 then
--    TriggerServerEvent('timeUpdate', time)
--  elseif time < 2000 and time > 1900 then
--    TriggerServerEvent('timeUpdate', time)
--  elseif time < 1500 and time > 1400 then
--    TriggerServerEvent('timeUpdate', time)
--  elseif time < 1000 and time > 900 then
--    TriggerServerEvent('timeUpdate', time)
--  elseif time < 500 and time > 400 then
--    TriggerServerEvent('timeUpdate', time)
--  elseif time < 250 and time > 200 then
--    TriggerServerEvent('timeUpdate', time)
  elseif time < 100 then
    TriggerServerEvent('timeUpdate', time)
  end
end


------------------------------------------------------------
------              All pNotify Events                ------
------------------------------------------------------------
RegisterNetEvent('noPlayerNotify')
  AddEventHandler('noPlayerNotify', function()
    exports.pNotify:SetQueueMax("left", 1)
    exports.pNotify:SendNotification({
        text = "Person is too far...",
        type = "error",
        timeout = 3000,
        layout = "centerLeft",
        queue = "left",
        killer = true
           })
  end)  

  RegisterNetEvent('hasShotNotify')
  AddEventHandler('hasShotNotify', function()
    exports.pNotify:SetQueueMax("left", 1)
    exports.pNotify:SendNotification({
        text = "Traces of gunpowder were found.",
        type = "error",
        timeout = 5000,
        layout = "centerLeft",
        queue = "left",
        killer = true
           })
  end)

  RegisterNetEvent('hasNotShotNotify')
  AddEventHandler('hasNotShotNotify', function()
    exports.pNotify:SetQueueMax("left", 1)
    exports.pNotify:SendNotification({
        text = "No traces of gunpowder were found",
        type = "success",
        timeout = 5000,
        layout = "centerLeft",
        queue = "left",
        killer = true
           })
  end)
