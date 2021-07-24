TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.TriggerServerCallback('enp_frezeecars:server', function( spawned )
	if not spawned then
		for k,v in ipairs(Config['Cars']) do
			RequestModel(GetHashKey(v.model))
			while not HasModelLoaded(GetHashKey(v.model)) do
				Wait(0)
			end
			local entity =  CreateVehicle(GetHashKey(v.model),  v.x, v.y, v.z, v.a, false)
			SetVehicleOnGroundProperly(entity)
			SetVehicleEngineOn(entity,false,false,false)
			SetVehicleUndriveable(entity,true)
			FreezeEntityPosition(entity, true)
			SetEntityAsMissionEntity(entity, true, true)
			SetModelAsNoLongerNeeded(entity)
			SetEntityInvincible( entity, true )
			SetVehicleLights(entity, 2)
			SetVehicleDoorsLocked(entity, 2)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local _msec = 1000
		for k,v in ipairs(Config['Cars']) do
		
			local _ply = PlayerPedId()
			local _plyCoords = GetEntityCoords(_ply)
			local _dist = GetDistanceBetweenCoords(_plyCoords, v.x, v.y, v.z)
			local _draw_dist = 3
			if _dist < _draw_dist then 
				_msec = 0
				ESX.ShowFloatingHelpNotification(v.name, vector3(v.x, v.y, v.z + 2))
			end
		end
		Citizen.Wait(_msec)
	end
end)