-- Table to store spotted users
local spottedUsers = {}

-- Function to display a notification to nearby players
function DisplayNotificationToNearbyPlayers(location, scentType)
    -- Get all players in the server
    local players = GetPlayers()

    -- Loop through each player
    for _, playerId in ipairs(players) do
        -- Get the player's ped and position
        local playerPed = GetPlayerPed(playerId)
        local playerPos = GetEntityCoords(playerPed)

        -- Calculate the distance between the player and the scent location
        local distance = #(playerPos - location)

        -- If the player is within a certain distance, display the notification to them
        if distance <= 50.0 then
            TriggerClientEvent("DisplayNotification", playerId, "There's a scent of "..scentType.." nearby at "..location)
        end
    end
end

-- Event handler for when a player leaves the server
AddEventHandler("playerDropped", function()
    -- Remove the player from the spotted users table
    spottedUsers[source] = nil
end)

-- Function to print a message when the script starts
Citizen.CreateThread(function()
    print("Thanks for using Weed/Cannabis Script By Creative Solutions")
end)

-- Export function to get the last spotted user
exports("GetLastSpottedUser", function()
    local lastUser = nil
    local lastLocation = nil

    -- Loop through all spotted users
    for userId, data in pairs(spottedUsers) do
        -- If this user was spotted more recently than the previous one, update the last spotted user
        if lastLocation == nil or #(data.position - lastLocation) < 10.0 then
            lastUser = userId
            lastLocation = data.position
        end
    end

    return lastUser
end)

-- Event handler to listen for the "NotifyNearbyPlayers" command
RegisterServerEvent("NotifyNearbyPlayers")
AddEventHandler("NotifyNearbyPlayers", function(scentType, location)
    -- Store the location in the spotted users table
    spottedUsers[source] = {position = location, scentType = scentType}

    -- Display the notification to nearby players
    DisplayNotificationToNearbyPlayers(location, scentType)
end)
