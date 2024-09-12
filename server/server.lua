-- Register the 'smite' command with permissions for admins
RegisterCommand('smite', function(source, args, rawCommand)
    
    if not IsPlayerAceAllowed(source, "command.smite") then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'You do not have permission to use this command.',
            duration = 5000
        })
        return
    end

    local targetId = tonumber(args[1])
    
    if not targetId then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'You must specify a valid player ID.',
            duration = 5000
        })
        return
    end

    local targetPlayer = exports.qbx_core:GetPlayer(targetId)
    if not targetPlayer then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'Player is not online or does not exist.',
            duration = 5000
        })
        return
    end

    -- Get the names of the source player (admin) and target player
    local sourceName = GetPlayerName(source)
    local targetName = GetPlayerName(targetId)

    -- Log to Discord
    sendDiscordLog("**" .. sourceName .. "** used the `/smite` command on **" .. targetName .. "** (ID: " .. targetId .. ").")

    -- Get target player's coordinates and send to all clients
    local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
    local coordsTable = { x = targetCoords.x, y = targetCoords.y, z = targetCoords.z }

    -- Trigger the client event to strike lightning and cause an explosion
    TriggerClientEvent('triggerThunderbolt', -1, coordsTable)

    -- Notify the command executor
    TriggerClientEvent('ox_lib:notify', source, {
        type = 'success',
        description = 'You have smited player ' .. targetId .. '.',
        duration = 5000
    })
end, false) -- Change to true if you want ace perms to work
