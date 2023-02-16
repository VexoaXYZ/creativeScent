-- Server-side code

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

-- Event handler for the "weed" and "cannabis" commands
AddEventHandler("playerActivated", function()
  local source = source

  RegisterCommand("weed", function()
    -- Get the player's position
    local playerPos = GetEntityCoords(GetPlayerPed(source))

    -- Store the player's location in the spotted users table
    spottedUsers[source] = playerPos

    -- Display the notification to nearby players
    DisplayNotificationToNearbyPlayers(playerPos, "weed")

    -- Send a confirmation message to the player
    TriggerClientEvent("DisplayNotification", source, "You used the /weed command, nearby players have been notified of a scent of weed.")
  end, false)

  RegisterCommand("cannabis", function()
    -- Get the player's position
    local playerPos = GetEntityCoords(GetPlayerPed(source))

    -- Store the player's location in the spotted users table
    spottedUsers[source] = playerPos

    -- Display the notification to nearby players
    DisplayNotificationToNearbyPlayers(playerPos, "cannabis")

    -- Send a confirmation message to the player
    TriggerClientEvent("DisplayNotification", source, "You used the /cannabis command, nearby players have been notified of a scent of cannabis.")
  end, false)

  RegisterCommand("alcohol", function()
    -- Get the player's position
    local playerPos = GetEntityCoords(GetPlayerPed(source))

    -- Store the player's location in the spotted users table
    spottedUsers[source] = playerPos

    -- Display the notification to nearby players
    DisplayNotificationToNearbyPlayers(playerPos, "alcohol")

    -- Send a confirmation message to the player
    TriggerClientEvent("DisplayNotification", source, "You used the /alcohol command, nearby players have been notified of a scent of alcohol.")
  end, false)

  
end)

-- Function to get the last spotted user
function GetLastSpottedUser()
  local lastUser = nil
  local lastLocation = nil

  -- Loop through all spotted users
  for userId, location in pairs(spottedUsers) do
    -- If this user was spotted more recently than the previous one, update the last spotted user
    if lastLocation == nil or #(location - lastLocation) < 10.0 then
      lastUser = userId
      lastLocation = location
    end
  end

  return lastUser
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
exports("GetLastSpottedUser", GetLastSpottedUser)
