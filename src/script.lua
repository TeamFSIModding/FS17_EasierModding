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
    if not g_currentMission.missionDynamicInfo.isMultiplayer then
        addConsoleCommand("emReloadVehicle", "Reloads a whole vehicle", "consoleCommandReloadVehicle", g_currentMission);
    end
    addConsoleCommand("emChangeLanguage", "Changes the game language", "consoleCommandChangeLanguage");
    addConsoleCommand("emReloadCurrentGui", "Reloads the gui", "consoleCommandReloadCurrentGui");
    addConsoleCommand("emSetDebugRenderingMode", "Changes the rendering mode", "consoleCommandSetDebugRenderingMode");
    addConsoleCommand("emShowVehicleDistance", "Shows the distance between vehicle and cam", "consoleCommandShowVehicleDistance", g_currentMission);
    addConsoleCommand("emSuspendApp", "Suspends the game", "consoleCommandSuspendApp");
    addConsoleCommand("emVerifyI18N", "Checks the I18N", "consoleCommandVerifyAll", g_i18n);
    if g_currentMission:getIsServer() then
        addConsoleCommand("emAddBale", "Adds a bale", "consoleCommandAddBale", g_currentMission);
        addConsoleCommand("emBuyAllFields", "Buys all fields", "consoleCommandBuyAllFields", g_currentMission);
        addConsoleCommand("emBuyField", "Buys a field", "consoleCommandBuyField", g_currentMission);
        addConsoleCommand("emCheatMoney", "Add a lot of money", "consoleCommandCheatMoney", g_currentMission);
        addConsoleCommand("emCheatSilo", "Add silo amount", "consoleCommandCheatSilo", g_currentMission);
        addConsoleCommand("emDeleteAllVehicles", "Deletes all vehicles", "consoleCommandDeleteAllVehicles", g_currentMission);
        addConsoleCommand("emExportStoreItems", "Exports storeItem data", "consoleCommandExportStoreItems", g_currentMission);
        addConsoleCommand("emFillVehicle", "Fills the vehicle with given filltype", "consoleCommandFillVehicle", g_currentMission);
        addConsoleCommand("emSetAnimals", "Sets the amount of given animals", "consoleCommandSetAnimals", self);
        addConsoleCommand("emSetDirtScale", "Sets a given dirt scale", "consoleCommandSetDirtScale", g_currentMission);
        addConsoleCommand("emSetFieldFruit", "Sets a given fruit to field", "consoleCommandSetFieldFruit", g_currentMission);
        addConsoleCommand("emSetFieldGround", "Sets a given fruit to field", "consoleCommandSetFieldGround", g_currentMission);
        addConsoleCommand("emSetFuel", "Sets the vehicle fuel level", "consoleCommandSetFuel", g_currentMission);
        addConsoleCommand("emSetOperatingTime", "Sets the vehicle operating time", "consoleCommandSetOperatingTime", g_currentMission);
        addConsoleCommand("emShowTipCollisions", "Shows the collisions for tipping on the ground", "consoleCommandShowTipCollisions", g_currentMission);
        addConsoleCommand("emStartBrandSale", "Starts a brand sale", "consoleStartBrandSale", g_currentMission);
        addConsoleCommand("emStartGreatDemand", "Starts a great demand", "consoleStartGreatDemand", g_currentMission);
        addConsoleCommand("emStartVehicleSale", "Starts a vehicle sale", "consoleStartVehicleSale", g_currentMission);
        addConsoleCommand("emTakeVehicleScreenshotsFromInside", "Takes several screenshots of the selected vehicle from inside", "consoleCommandTakeScreenshotsFromInside", g_currentMission);
        addConsoleCommand("emTakeVehicleScreenshotsFromOutside", "Takes several screenshots of the selected vehicle from outside", "consoleCommandTakeScreenshotsFromOutside", g_currentMission);
        addConsoleCommand("emTeleport", "Teleports to given field or x/z-position", "consoleCommandTeleport", g_currentMission);
        addConsoleCommand("emUpdateTipCollisions", "Updates the collisions for tipping on the ground around the current camera", "consoleCommandUpdateTipCollisions", g_currentMission);
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
    removeConsoleCommand("emAddBale");
    removeConsoleCommand("emBuyAllFields");
    removeConsoleCommand("emBuyField");
    removeConsoleCommand("emChangeLanguage");
    removeConsoleCommand("emCheatMoney");
    removeConsoleCommand("emCheatSilo");
    removeConsoleCommand("emDeleteAllVehicles");
    removeConsoleCommand("emExportStoreItems");
    removeConsoleCommand("emFillVehicle");
    removeConsoleCommand("emReloadCurrentGui");
    removeConsoleCommand("emReloadVehicle");
    removeConsoleCommand("emSetAnimals");
    removeConsoleCommand("emSetDebugRenderingMode");
    removeConsoleCommand("emSetDirtScale");
    removeConsoleCommand("emSetFieldFruit");
    removeConsoleCommand("emSetFieldGround");
    removeConsoleCommand("emSetFuel");
    removeConsoleCommand("emSetOperatingTime");
    removeConsoleCommand("emShowTipCollisions");
    removeConsoleCommand("emShowVehicleDistance");
    removeConsoleCommand("emStartBrandSale");
    removeConsoleCommand("emStartGreatDemand");
    removeConsoleCommand("emStartVehicleSale");
    removeConsoleCommand("emSuspendApp");
    removeConsoleCommand("emTakeVehicleScreenshotsFromInside");
    removeConsoleCommand("emTakeVehicleScreenshotsFromOutside");
    removeConsoleCommand("emTeleport");
    removeConsoleCommand("emUpdateTipCollisions");
    removeConsoleCommand("emVerifyI18N");
end

function EasierModding:keyEvent(unicode, sym, modifier, isDown)
end

function EasierModding:mouseEvent(posX, posY, isDown, isUp, button)
end

function EasierModding:update(dt)
end

function EasierModding:draw()
end

function EasierModding:consoleCommandSetAnimals(type, amount)
    local usage = "emSetAnimals type(cow | pig | sheep) amount";
    local husbandry = g_currentMission.husbandries[type];
    if type == nil or type == "" or husbandry == nil then
        return "Invalid type. " .. usage;
    end
    amount = tonumber(amount);
    if amount == nil then
        return "Invalid amount. " .. usage;
    end
    local oldAmount = husbandry.numAnimals[0];
    local difAmount = amount - oldAmount;
    if difAmount > 0 then
        husbandry:addAnimals(difAmount, 0);
    else
        husbandry:removeAnimals(math.abs(difAmount), 0);
    end
    return string.format("Setted %s from %s to %s(%s)", type, oldAmount, amount, difAmount);
end

addModEventListener(EasierModding);
