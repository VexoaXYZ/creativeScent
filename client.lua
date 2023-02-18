-- Function to display a notification to the player
function ShowNotification(text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(false, false)
end

-- Event handler to listen for the "weed" and "cannabis" commands
RegisterNetEvent("DisplayNotification")
AddEventHandler("DisplayNotification", function(text)
-- Display the notification to the player
ShowNotification(text)
end)

-- Register the "weed" command
local isWeedEnabled = false
RegisterCommand("weed", function()
-- Toggle the "weed" command on/off
isWeedEnabled = not isWeedEnabled
        if isWeedEnabled then
    -- Display command information to the player
    ShowNotification("You used the /weed command, nearby players have been notified of a scent of weed.")

    -- Trigger the server event to notify nearby players
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("NotifyNearbyPlayers", "Weed", playerPos)
else
    -- Display command information to the player
    ShowNotification("You turned off the /weed command, nearby players will no longer be notified of a scent of weed.")

    -- Trigger the server event to remove the scent of weed
    TriggerServerEvent("RemoveScent", "Weed")
end
end, false)

-- Register the "cannabis" command
local isCannabisEnabled = false
RegisterCommand("cannabis", function()
-- Toggle the "cannabis" command on/off
isCannabisEnabled = not isCannabisEnabled
if isCannabisEnabled then
    -- Display command information to the player
    ShowNotification("You used the /cannabis command, nearby players have been notified of a scent of cannabis.")

    -- Trigger the server event to notify nearby players
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("NotifyNearbyPlayers", "Cannabis", playerPos)
else
    -- Display command information to the player
    ShowNotification("You turned off the /cannabis command, nearby players will no longer be notified of a scent of cannabis.")

    -- Trigger the server event to remove the scent of cannabis
    TriggerServerEvent("RemoveScent", "Cannabis")
end
end, false)


-- Register the "cannabis" command
local isAlcoholEnabled = false
RegisterCommand("alcohol", function()
-- Toggle the "cannabis" command on/off
isCannabisEnabled = not isCannabisEnabled
if isCannabisEnabled then
    -- Display command information to the player
    ShowNotification("You used the /alcohol command, nearby players have been notified of a scent of cannabis.")

    -- Trigger the server event to notify nearby players
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("NotifyNearbyPlayers", "Alcohol", playerPos)
else
    -- Display command information to the player
    ShowNotification("You turned off the /cannabis command, nearby players will no longer be notified of a scent of Alcohol.")

    -- Trigger the server event to remove the scent of cannabis
    TriggerServerEvent("RemoveScent", "Cannabis")
end
end, false)


        
        
