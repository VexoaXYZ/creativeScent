-- Client-side code

-- Function to display a notification to the player
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
  end
  
  -- Event handler to listen for the "weed" and "cannabis" commands
  RegisterNetEvent("DisplayWeedNotification")
  AddEventHandler("DisplayWeedNotification", function(location)
    -- Display the notification to the player
    ShowNotification("There's a scent of weed/cannabis nearby at "..location)
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
  