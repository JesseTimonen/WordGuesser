-- Save settings
function saveSettings()
    Turbine.PluginData.Save(Turbine.DataScope.Server, settingsFileName, settings);
end


-- Save achievements
function saveAchievements()
    Turbine.PluginData.Save(Turbine.DataScope.Server, achievementsFileName, settings);
end


-- Save statistics
function saveStatistics()
    Turbine.PluginData.Save(Turbine.DataScope.Server, statisticsFileName, settings);
end


-- Load settings
function loadSettings()
    local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, settingsFileName);
    if _settings ~= nil then settings = _settings; end

    -- TODO: Make sure settings are valid and fix if needed
    if (settings["loadWindowOnStartUp"] == nil) then settings["loadWindowOnStartUp"] = true; end
    if (settings["progress"] == nil) then settings["progress"] = 1; end
    if (settings["ratings"] == nil) then settings["ratings"] = {["stage-1"] = 0;["stage-2"] = 0;["stage-3"] = 0;["stage-4"] = 0;["stage-5"] = 0;["stage-6"] = 0;["stage-7"] = 0;["stage-8"] = 0;["stage-9"] = 0;["stage-10"] = 0;["stage-11"] = 0;["stage-12"] = 0;}; end

end


-- Load achievements
function loadAchievements()
    local _achievements = Turbine.PluginData.Load(Turbine.DataScope.Server, achievementsFileName);
    if _achievements ~= nil then achievements = _achievements; end

    -- TODO: Make sure achievements are valid and fix if needed
end


-- Load statistics
function loadStatistics()
    local _statistics = Turbine.PluginData.Load(Turbine.DataScope.Server, statisticsFileName);
    if _statistics ~= nil then statistics = _statistics; end

    -- TODO: Make sure statistics are valid and fix if needed
end