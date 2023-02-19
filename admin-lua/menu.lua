  maps = { "de_dust2","de_cs2d", "cs_assault", "de_dust", "de_inferno" }

    menucmap = sea.Menu.new ("Map List:", "big")

    for k, v in pairs(maps) do
      menucmap:addButton(v, function() 
        sea.game.map=v
      end)
    end

sea.addEvent("onHookServeraction", function (player, action)


      -- Change Map
      banmenu = sea.Menu.new ("Ban Player", "big")
      --
      banmenu:addButton("Ban IP", function() 
        user:banIP()
      end)
      banmenu:addButton("Ban Name", function() 
        user:banName()
      end)
      banmenu:addButton("Ban Steam", function() 
        user:banSteam()
      end)
      banmenu:addButton("Ban USGN", function() 
        user:banUSGN()
      end)
      -- Show player list
      menul = sea.Menu.new("Player list:", "big")

      -- Timeout

      -- 
      moderateMenu = sea.Menu.new("Player settings", "big")
      moderateMenu:addButton("Kick", function() 
        user:kick()
        player:message(""..userName.." has been kicked from the server")
      end, "Kick the player")
      moderateMenu:addButton("Ban", banmenu, "Ban the player")
      moderateMenu:addButton("Slap", function() 
        user:slap()
      player:message(""..userName.." got slapped.")
      end, "Slap the player")
      moderateMenu:addButton("Kill", function()
        user:kill()
      end, "Kill the player")
      moderateMenu:addGap()
      moderateMenu:addButton("Make T", function() 
        user.team=1
      end, "Make player T")
      moderateMenu:addButton("Make CT", function()
        user.team=2
      end, "Make player CT")
      moderateMenu:addButton("Make Spec", function() 
        user.team=3
      end, "Make player Spec")
      moderateMenu:addGap()
      moderateMenu:addButton("Teleport player",function() 
        user:setPosition(player.x , player.y)
        player:message("You teleported "..user.name.." to your location.!", sea.Color.white)
      end, "To your location")
      -- Player list
      for _, player in pairs(sea.Player.get()) do
        menul:addButton(""..player.name.."", function() 
           user = player
          return moderateMenu
        end, id)
          end

          function godMode(player)
            player:message("This is not working right now...", sea.Color.cyan)
          end

          -- Armor Packs for admins
          adminArmorPacks = sea.Menu.new ("Armor Packs (Admin Only)", "big")

          adminArmorPacks:addButton("Light Armor", function() 
          player:setArmorAttribute(201)
          end,
          "%25")
          adminArmorPacks:addButton("Armor", function() 
              player:setArmorAttribute(202)
          end,"%50")
          adminArmorPacks:addButton("Heavy Armor", function() 
              player:setArmorAttribute(203)
          end,"%85")
          adminArmorPacks:addButton("Medic Armor", function() 
              player:setArmorAttribute(204)
          end,"%50 + Heal")
          adminArmorPacks:addButton("Super Armor", function() 
              player:setArmorAttribute(205)
          end, "%95")
          adminArmorPacks:addButton("Stealth Suit", function() 
              player:setArmorAttribute(206)
          end,"%0 + Stealth")

          -- Admin Items
          adminItems = sea.Menu.new ("Admin Items", "big")
          adminItems:addButton("Armor Packs", adminArmorPacks)
          adminItems:addButton("God Mode", godMode)
          adminItems:addButton("Equip any item you want", function() 
          player:message("You need to write: item (id) ", sea.Color.white)
          itemSay = 1
          end, "")

    -- F2 button makes player see a menu that you can change moderation settings
      if action == 2 and player:isAdmin() then
      menusettings = sea.Menu.new("Server Settings", "big")
      menusettings:addButton("Change Map", menucmap)
      menusettings:addButton("Add Bots", botmenu)
      local menu2 = sea.Menu.new("Moderation Commands", "big")
      menu2:addButton("Player List", menul)
      menu2:addButton("Server Settings", menusettings)
      menu2:addButton("Admin Items", adminItems)
      
      player:displayMenu(menu2)
    end
end)

-- BOT SETTINGS
botmenu = sea.Menu.new("Bot Settings", "big")
botmenu:addButton("Add Bot (CT)", function() 
  parse("bot_add_ct")
return botmenu
end, "Add a bot to CT players.")

botmenu:addButton("Add Bot (T)", function() 
  parse("bot_add_t")
  return botmenu
end, "Add a bot to T players.")
botmenu:addGap()

botmenu:addButton("Remove bot (CT)", function() 
parse("bot_remove_ct")
return botmenu
end, "Remove a CT bot from the server.")

botmenu:addButton("Remove bot (T)", function() 
parse("bot_remove_t")
return botmenu
end, "Remove a T bot from the server.")

botmenu:addButton("Remove a bot", function() 
parse("bot_remove")
return botmenu
end, "Removes a bot from the server.")
botmenu:addGap()
botmenu:addButton("Remove all bots from the server", function() 
parse("bot_remove_all")
return botmenu
end, "X")





--sea.addEvent("onHookServeraction", function(player, action)

 --local menu2 = sea.Menu.new("Missions", "big")

   -- if action == 2 then
     --   local menu2 = sea.Menu.new("Missions", "big")
       -- menu2:addButton("Your Level:", nil, ""..player.level.."")
        --local menu = sea.Menu.new("Status", "big")
        --menu:addButton("Your Level:", nil, ""..player.level.."")
        --menu:addButton("Your XP:", nil, ""..player.xp.."/1000")
        --menu:addGap()
       -- menu:addButton("List of your missions", menu2)
        --menu:addButton("Mission status:", nil, ""..missions.progress.."")
       -- if player.progress == 0 then
       --     menu2:addButton(missions.desc, nil, player.level)
       --         else
                    
      --       menu2:addButton("Your First Mission is not completed:", nil, ""..player.level.."")
      --       end

     --   player:displayMenu(menu)
   -- elseif action == 3 then
-- addXP(player, 1000)
-- missions.progress = 1
   -- end
--end)

