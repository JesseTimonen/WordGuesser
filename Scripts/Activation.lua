-- Activate Plugin
Plugins[pluginName].Load = function()
	notification("Activated version " .. Plugins[pluginName]:GetVersion() .. " by Henna.");
end

-- Unload Plugin
Plugins[pluginName].Unload = function()
	notification("Plugin has been deactivated.");
	saveSettings();
	saveAchievements();
	saveStatistics();
end

-- Load settings
loadSettings();
loadAchievements();
loadStatistics();