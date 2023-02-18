-- Function to display a notification to the player
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Event handler to listen for the "DisplayNotification" event
RegisterNetEvent("DisplayNotification")
AddEventHandler("DisplayNotification", function(text)
    -- Display the notification to the player
    ShowNotification(text)
end)

-- Register the "weed" command
RegisterCommand("weed", function(source, args, rawCommand)
    -- Display command information to the player
    ShowNotification("You used the /weed command, nearby players have been notified of a scent of weed.")

    -- Trigger the server event to notify nearby players
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("NotifyNearbyPlayers", "Weed", playerPos)
end, false)

-- Register the "cannabis" command
RegisterCommand("cannabis", function(source, args, rawCommand)
    -- Display command information to the player
    ShowNotification("You used the /cannabis command, nearby players have been notified of a scent of cannabis.")

    -- Trigger the server event to notify nearby players
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("NotifyNearbyPlayers", "Cannabis", playerPos)
end, false)

-- Register the "alcohol" command
RegisterCommand("alcohol", function(source, args, rawCommand)
    -- Display command information to the player
    ShowNotification("You used the /alcohol command, nearby players have been notified of a scent of alcohol.")

    -- Trigger the server event to notify nearby players
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("NotifyNearbyPlayers", "Alcohol", playerPos)
end, false)

-- Register the "toggle" command
RegisterCommand("toggle", function(source, args, rawCommand)
    local scentType = args[1]

    -- Clear all previously stored scents
    TriggerServerEvent("ClearAllScents")

    -- Display command information to the player
    ShowNotification("You used the /toggle command, nearby players have been notified of a scent of "..scentType)

    -- Trigger the server event to notify nearby players
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("NotifyNearbyPlayers", scentType, playerPos)
end, false)

-- Function to print a message when the script starts
Citizen.CreateThread(function()
    print("Thanks for using Weed/Cannabis Script By Creative Solutions")
end)
