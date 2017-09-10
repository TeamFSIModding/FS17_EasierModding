--
-- Easier Modding
--
-- @author TyKonKet
-- @date 06/09/2017
EasierModding = {};
EasierModding.name = "EasierModding";
EasierModding.debug = false;

function EasierModding:pinfo(text, ...)
    local start = string.format("[INFO(%s)] -> ", getDate("%H:%M:%S"));
    local ptext = string.format(text, ...);
    print(string.format("%s%s", start, ptext));
end

function EasierModding:perror(text, ...)
    local start = string.format("[ERROR(%s)] -> ", getDate("%H:%M:%S"));
    local ptext = string.format(text, ...);
    print(string.format("%s%s", start, ptext));
end

function EasierModding:initialize(missionInfo, missionDynamicInfo, loadingScreen)
    self = EasierModding;
end
g_mpLoadingScreen.loadFunction = Utils.prependedFunction(g_mpLoadingScreen.loadFunction, EasierModding.initialize);

function EasierModding:load(missionInfo, missionDynamicInfo, loadingScreen)
    self = EasierModding;
    g_currentMission.pinfo = self.pinfo;
    g_currentMission.perror = self.perror;
    g_currentMission.loadMapFinished = Utils.appendedFunction(g_currentMission.loadMapFinished, self.loadMapFinished);
    g_currentMission.onStartMission = Utils.appendedFunction(g_currentMission.onStartMission, self.afterLoad);
    g_currentMission.missionInfo.saveToXML = Utils.appendedFunction(g_currentMission.missionInfo.saveToXML, self.saveSavegame);
end
g_mpLoadingScreen.loadFunction = Utils.appendedFunction(g_mpLoadingScreen.loadFunction, EasierModding.load);

function EasierModding:loadMap(name)
    if self.debug then
        g_currentMission:pinfo("Test print with %s", "g_currentMission:pinfo");
        g_currentMission:perror("Test print with %s", "g_currentMission:perror");
    end
    addConsoleCommand("emShowVehicleDistance", "Shows the distance between vehicle and cam", "consoleCommandShowVehicleDistance", g_currentMission);
    if g_currentMission:getIsServer() then
        addConsoleCommand("emCheatMoney", "Add a lot of money", "consoleCommandCheatMoney", g_currentMission);
        addConsoleCommand("emBuyField", "Buys a field", "consoleCommandBuyField", g_currentMission);
        addConsoleCommand("emBuyAllFields", "Buys all fields", "consoleCommandBuyAllFields", g_currentMission);
        addConsoleCommand("emSetFieldFruit", "Sets a given fruit to field", "consoleCommandSetFieldFruit", g_currentMission);
        addConsoleCommand("emSetFieldGround", "Sets a given fruit to field", "consoleCommandSetFieldGround", g_currentMission);
        if not g_currentMission.missionDynamicInfo.isMultiplayer then
            addConsoleCommand("emReloadVehicle", "Reloads a whole vehicle", "consoleCommandReloadVehicle", g_currentMission);
        end
        addConsoleCommand("emShowTipCollisions", "Shows the collisions for tipping on the ground", "consoleCommandShowTipCollisions", g_currentMission);
        addConsoleCommand("emAddBale", "Adds a bale", "consoleCommandAddBale", g_currentMission);
        addConsoleCommand("emSetFuel", "Sets the vehicle fuel level", "consoleCommandSetFuel", g_currentMission);
        addConsoleCommand("emFillVehicle", "Fills the vehicle with given filltype", "consoleCommandFillVehicle", g_currentMission);
        addConsoleCommand("emSetOperatingTime", "Sets the vehicle operating time", "consoleCommandSetOperatingTime", g_currentMission);
        addConsoleCommand("emSetDirtScale", "Sets a given dirt scale", "consoleCommandSetDirtScale", g_currentMission);
        addConsoleCommand("emCheatSilo", "Add silo amount", "consoleCommandCheatSilo", g_currentMission);
        addConsoleCommand("emExportStoreItems", "Exports storeItem data", "consoleCommandExportStoreItems", g_currentMission);
        addConsoleCommand("emStartBrandSale", "Starts a brand sale", "consoleStartBrandSale", g_currentMission);
        addConsoleCommand("emStartVehicleSale", "Starts a vehicle sale", "consoleStartVehicleSale", g_currentMission);
        addConsoleCommand("emStartGreatDemand", "Starts a great demand", "consoleStartGreatDemand", g_currentMission);
        addConsoleCommand("emUpdateTipCollisions", "Updates the collisions for tipping on the ground around the current camera", "consoleCommandUpdateTipCollisions", g_currentMission);
        addConsoleCommand("emTeleport", "Teleports to given field or x/z-position", "consoleCommandTeleport", g_currentMission);
    end
    self:loadSavegame();
end

function EasierModding:loadMapFinished()
    self = EasierModding;
end

function EasierModding:afterLoad()
    self = EasierModding;
end

function EasierModding:loadSavegame()
end

function EasierModding:saveSavegame()
    self = EasierModding;
end

function EasierModding:deleteMap()
end

function EasierModding:keyEvent(unicode, sym, modifier, isDown)
end

function EasierModding:mouseEvent(posX, posY, isDown, isUp, button)
end

function EasierModding:update(dt)
end

function EasierModding:draw()
end

addModEventListener(EasierModding);
