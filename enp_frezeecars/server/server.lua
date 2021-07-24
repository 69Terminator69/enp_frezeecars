TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local spawned = false

ESX.RegisterServerCallback('enp_frezeecars:server', function( source, cb )
	cb(spawned)
    if not spawned then
        spawned = true
    end
end)

local name = '^2[enp_frezeecars] Corriendo en la version 1.0'
print(name)