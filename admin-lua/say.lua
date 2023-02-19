sea.addEvent("onHookSay", function(player,text)

    if text:sub(1,4) == "item" and itemSay==1 then
      local idC = text:sub(6,9)
      player:equip(tonumber(idC))
    player:message("You equipped the item (ID: "..idC..")", sea.Color.white)
    itemSay=0
    return 1
    end

 -- Help 
  if text == "!help" and player:isAdmin() then
    player:message("!kick (id)")
    player:message("!banip (id)")
    player:message("!banname (id)")
    player:message("!bansteam (id)")
    player:message("!banusgn (id)")
    player:message("!slap (id)")
    player:message("!kill (id)")
    player:message("!maket (id)")
    player:message("!makect (id)")
    player:message("!makespec (id)")
    return 1
  end

  -- Commands
  if text:sub(1,5) == "!kick" and player:isAdmin() then
    local kickID = text:sub(7,8)
      sea.player[tonumber(kickID)]:kick()
  return 1
  end

  if text:sub(1,6) == "!banip" and player:isAdmin() then
    local banID = text:sub(8,9)
    sea.player[tonumber(banID)]:banIP()
    return 1
  end

  if text:sub(1,8) == "!banname" and player:isAdmin() then
    local banNameID = text:sub(10,11)
    sea.player[tonumber(banNameID)]:banName()
    return 1
  end

  if text:sub(1,9) == "!bansteam" and player:isAdmin() then
    local banSteamID = text:sub(11,12)
    sea.player[tonumber(banSteamID)]:banSteam()
    return 1
  end

  if text:sub(1,8) == "!banusgn" and player:isAdmin() then
    local banUsgnID = text:sub(10,11)
    sea.player[tonumber(banUsgnID)]:banUSGN()
    return 1
  end

  if text:sub(1,5) == "!slap" and player:isAdmin() then
    local slapID = text:sub(7,8)
      sea.player[tonumber(slapID)]:slap()
  return 1
  end

if text:sub(1,5) == "!kill" and player:isAdmin() then
  local killID = text:sub(7,8)
  sea.player[tonumber(killID)]:kill()
return 1
end

if text:sub(1,6) == "!maket" and player:isAdmin() then
  local maketID = text:sub(8,9)
  sea.player[tonumber(maketID)].team=1
  return 1
end

if text:sub(1,7) == "!makect" and player:isAdmin() then
  local makectID = text:sub(9,10)
  for k, v in pairs(sea.player[id]) do
  sea.player[tonumber(makectID)].team=2
  return 1
  end
end

end)

