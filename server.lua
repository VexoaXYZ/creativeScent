-- Create a table to store the scents that have been detected
local detectedScents = {}

-- Event handler to listen for the "NotifyNearbyPlayers" event
RegisterServerEvent("NotifyNearbyPlayers")
AddEventHandler("NotifyNearbyPlayers", function(scentType, playerPos)
    -- Loop through all players and check if they are within the detection radius
    for _, player in ipairs(GetPlayers()) do
        local playerPed = GetPlayerPed(player)
        local playerCoords = GetEntityCoords(playerPed)
        
        if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, playerPos.x, playerPos.y, playerPos.z, true) < Config.DetectionRadius then
            -- Add the scent to the detected scents table
            table.insert(detectedScents, scentType)

            -- Trigger the client event to display the notification
            TriggerClientEvent("DisplayNotification", player, scentType)

            -- Trigger the server event to store the scent on the client's end
            TriggerClientEvent("StoreDetectedScents", player, detectedScents)
        end
    end
end)

-- Event handler to listen for the "ClearAllScents" event
RegisterServerEvent("ClearMyScents")
AddEventHandler("ClearMyScents", function()
local player = source -- Get the player who triggered the event
-- Clear the detected scents table for this player
SetDetectedScents(player, {})
end)

-- Helper function to get a player's detected scents
function GetDetectedScents(player)
local detectedScents = {}
-- Get the detected scents table for this player from the player's "detectedScents" data
if Players[player] and Players[player].detectedScents then
    detectedScents = Players[player].detectedScents
end

return detectedScents
end

-- Helper function to set a player's detected scents
function SetDetectedScents(player, detectedScents)
-- Save the detected scents table for this player to the player's "detectedScents" data
if not Players[player] then
Players[player] = {}
end
Players[player].detectedScents = detectedScents
end
      
        
-- Function to remove a player's data when they disconnect
AddEventHandler("playerDropped", function()
local player = source -- Get the player who disconnected
                
                -- Remove the player's data from the table
Players[player] = nil
end)
