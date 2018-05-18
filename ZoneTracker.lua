local BONK, E, L, V, P, G = unpack(select(2, ...))

local IsInInstance = IsInInstance

local BZT = BONK:NewEventHandler()
BONK.BZT = BZT

------
-- BZT:Initialize
------
function BZT:Initialize()
    BONK:Print("BZT Initializing")
    self.instanceType = "none"
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:RegisterEvent("ADDON_LOADED", "ZONE_CHANGED_NEW_AREA")
end

------
-- BZT:InArena
------
function BZT:InArena()
    if E.db.BONK.General.Debug then
        return true
    else
        return self.instanceType == "arena"
    end
end

------
-- BZT:DisableDebug
------
function BZT:ToggleDebug()
    self:ZONE_CHANGED_NEW_AREA("DEBUG")
end

------
-- BZT:ZONE_CHANGED_NEW_AREA
------
function BZT:ZONE_CHANGED_NEW_AREA(event)
    BONK:Print(event)
    local _, instanceType = IsInInstance()

    if self:InArena() == true then
        BONK.BFM:Start()
        BONK.BCH:Start()
    else
        BONK.BFM:Stop()
        BONK.BCH:Stop()
    end
    self.instanceType = instanceType
end
