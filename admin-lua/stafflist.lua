
staffListUsgn = {132253,94885, 1
}
staffListSteam = {"12",
}

mutedPlayers = {94885}


function sea.Player:isAdmin()
    local usgn, steamID = self.usgn, self.steamID

    if usgn ~= 0 and table.contains(staffListUsgn, usgn) then
        return true
    end
    
    if steamID ~= "0" and table.contains(staffListSteam, steamID) then
        return true
    end

    return false
end

function muteP(player)

end