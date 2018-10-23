--[[
Radiant GSR Test V1.6
Credits - BattleRat
/////License/////
Do not reupload/re release any part of this script without my permission
]]


ESX 				= nil


-----------------------------

--ESX base
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---------------------------------------------------------------------

AddEventHandler('chatMessage', function(source, n, message)
	cm = stringsplit(message, " ")
	local xPlayer 		= ESX.GetPlayerFromId(source)

		
		if cm[1] == "/gsr" then
			if xPlayer.job.name == 'police' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local _source = source
				local identifier = GetPlayerIdentifiers(tPID)[1]
				gsrcheck(source, identifier)
			end
		end
end)


AddEventHandler('esx:playerDropped', function(source)
  local _source = source
  local identifier = GetPlayerIdentifiers(_source)[1]
  MySQL.Async.execute("DELETE FROM gsr WHERE identifier = @identifier",
			{
				['@identifier']   = identifier,
			})
end)

-----------------------------------------------------------------------------
---     ADD / REMOVE Database Items
-----------------------------------------------------------------------------

AddEventHandler('onMySQLReady', function()
	MySQL.Async.execute('DELETE FROM gsr',{}
	)
end)


RegisterNetEvent("removeGsrRecord")
AddEventHandler("removeGsrRecord", function()
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]
		MySQL.Async.execute("DELETE FROM gsr WHERE identifier = @identifier",
			{
				['@identifier']   = identifier,
			})
end)


RegisterServerEvent('addGsrRecord')
AddEventHandler('addGsrRecord', function(timer)
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]
	local time = timer
		MySQL.Async.execute("INSERT INTO gsr ( identifier, time) VALUES (@identifier, @time)",
			    {
			      ['@identifier']   = identifier,
			      ['@time']			= time
			    })
end)



function gsrcheck(source, identifier)
	local _source = source
	local identifier = identifier
	MySQL.Async.fetchAll('SELECT * FROM gsr WHERE identifier=@identifier', {['@identifier'] = identifier}, function(gotInfo)
		if gotInfo[1] ~= nil then
			TriggerClientEvent('hasShotNotify', _source)
		else
			TriggerClientEvent('hasNotShotNotify', _source)
		end
	end)
end


RegisterServerEvent("timeUpdate")
AddEventHandler("timeUpdate", function(time)
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]
		MySQL.Async.execute("UPDATE gsr SET time=@time WHERE identifier=@identifier",
			    {
			      ['@time']			= time,
			      ['@identifier']   = identifier
			    })
end)


---------------------------------------------------------------------------
---		This Makes The Commands And Such Work. ** DON'T TOUCH THIS**
---------------------------------------------------------------------------

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end