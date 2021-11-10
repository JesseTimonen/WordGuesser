-- Plugin's name
pluginName = "WordGuesser";


-- Savefile names
settingsFileName = "WordGuesser_Settings";
statisticsFileName = "WordGuesser_Statistics";
achievementsFileName = "WordGuesser_Achievements";


-- Users screen size
screenWidth, screenHeight = Turbine.UI.Display:GetSize();


-- Default settings
settings = {
    loadWindowOnStartUp = true,
    progress = 11,
    ratings = {
        ["stage-1"] = 0;
        ["stage-2"] = 0;
        ["stage-3"] = 0;
        ["stage-4"] = 0;
        ["stage-5"] = 0;
        ["stage-6"] = 0;
        ["stage-7"] = 0;
        ["stage-8"] = 0;
        ["stage-9"] = 0;
        ["stage-10"] = 0;
        ["stage-11"] = 0;
        ["stage-12"] = 0;
    }
};


-- Default statistics
statistics = {
    ["xxxxxx"] = 0;
    ["yyyyyy"] = 51;
}


-- Default achievements
achievements = {
    ["xxxxxx"] = false;
    ["yyyyyy"] = true;
}


-- Default window position
windowPosition = {
    xPos = (screenWidth / 2) - 300,
    yPos = screenHeight / 2 - 250,
};


-- Notification color codes
rgb = {
    pluginName = "<rgb=#DAA520>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};


-- Turbine colors
color = {
    black = Turbine.UI.Color(0, 0, 0),
    darkgrey = Turbine.UI.Color(0.4, 0.4, 0.35),
    grey = Turbine.UI.Color(0.65, 0.64, 0.59),
    lightgrey = Turbine.UI.Color(0.8, 0.8, 0.75),
    white = Turbine.UI.Color(1, 1, 1),
    golden = Turbine.UI.Color(242/255, 217/255, 140/255),
    yellow = Turbine.UI.Color(244/255, 255/255, 51/255),
    orange = Turbine.UI.Color(1, 0.5, 0),
    red = Turbine.UI.Color(0.8, 0, 0),
    lightred = Turbine.UI.Color(1, 0.5, 0.5),
    darkred = Turbine.UI.Color(0.4, 0, 0),
    green = Turbine.UI.Color(0, 0.7, 0),
    lightgreen = Turbine.UI.Color(0.56, 0.93, 0.56),
    darkgreen = Turbine.UI.Color(0, 0.4, 0),
    blue = Turbine.UI.Color(0, 0, 1),
    lightblue = Turbine.UI.Color(0, 1, 1),
    darkblue = Turbine.UI.Color(0, 0.25, 0.5),
};


-- Initialize arrays
chosenLetters = {};
possibleWords = {};
featuredWords = {};