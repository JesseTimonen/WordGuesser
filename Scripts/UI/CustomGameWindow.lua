customGameWindow = class(Turbine.UI.Lotro.GoldWindow);

-- Constructor
function customGameWindow:Constructor()
	Turbine.UI.Lotro.GoldWindow.Constructor(self);
	self:SetText("Word Guesser");
	self:SetVisible(false);
    self:SetSize(600, 500);
    self:SetPosition(Scripts.windowPosition["xPos"], Scripts.windowPosition["yPos"]);


    -- Campaign Tab
	self.campaignTabLabel = Turbine.UI.Label();
	self.campaignTabLabel:SetParent(self);
	self.campaignTabLabel:SetSize(120, 50);
	self.campaignTabLabel:SetPosition(self:GetWidth() / 2 - self.campaignTabLabel:GetWidth() / 2 - 200, 50);
	self.campaignTabLabel:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.campaignTabLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.campaignTabLabel:SetForeColor(Scripts.color["black"]);
	self.campaignTabLabel:SetBackColor(Scripts.color["darkgrey"]);
    self.campaignTabLabel:SetText("Campaign");

    self.campaignTabLabel.MouseEnter = function( sender, args)
        self.campaignTabLabel:SetBackColor(Scripts.color["lightgrey"]);
	end

    self.campaignTabLabel.MouseLeave = function( sender, args)
        self.campaignTabLabel:SetBackColor(Scripts.color["darkgrey"]);
	end

	self.campaignTabLabel.MouseClick = function( sender, args)
        WordGuesser.UI.campaignWindow:SetWindowPosition(self:GetPosition());
        self:SetVisible(false);
        WordGuesser.UI.campaignWindow:SetVisibility(true);
	end


	-- Custom game tab
	self.customGameTabLabel = Turbine.UI.Label();
	self.customGameTabLabel:SetParent(self);
	self.customGameTabLabel:SetSize(120, 50);
	self.customGameTabLabel:SetPosition(self:GetWidth() / 2 - self.customGameTabLabel:GetWidth() / 2 - 66, 50);
	self.customGameTabLabel:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.customGameTabLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.customGameTabLabel:SetForeColor(Scripts.color["black"]);
	self.customGameTabLabel:SetBackColor(Scripts.color["lightgrey"]);
    self.customGameTabLabel:SetText("Custom Game");


    -- Statistics Tab
	self.statisticsTabLabel = Turbine.UI.Label();
	self.statisticsTabLabel:SetParent(self);
    self.statisticsTabLabel:SetVisible(true);
	self.statisticsTabLabel:SetSize(120, 50);
	self.statisticsTabLabel:SetPosition(self:GetWidth() / 2 - self.statisticsTabLabel:GetWidth() / 2 + 66, 50);
	self.statisticsTabLabel:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.statisticsTabLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.statisticsTabLabel:SetForeColor(Scripts.color["black"]);
	self.statisticsTabLabel:SetBackColor(Scripts.color["darkgrey"]);
    self.statisticsTabLabel:SetText("Statistics");

    self.statisticsTabLabel.MouseEnter = function( sender, args)
        self.statisticsTabLabel:SetBackColor(Scripts.color["lightgrey"]);
	end

    self.statisticsTabLabel.MouseLeave = function( sender, args)
        self.statisticsTabLabel:SetBackColor(Scripts.color["darkgrey"]);
	end

	self.statisticsTabLabel.MouseClick = function( sender, args)
        WordGuesser.UI.statisticsWindow:SetWindowPosition(self:GetPosition());
        self:SetVisible(false);
        WordGuesser.UI.statisticsWindow:SetVisibility(true);
	end


	-- Achievements tab
	self.achievementsTabLabel = Turbine.UI.Label();
	self.achievementsTabLabel:SetParent(self);
	self.achievementsTabLabel:SetSize(120, 50);
	self.achievementsTabLabel:SetPosition(self:GetWidth() / 2 - self.statisticsTabLabel:GetWidth() / 2 + 200, 50);
	self.achievementsTabLabel:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.achievementsTabLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.achievementsTabLabel:SetForeColor(Scripts.color["black"]);
	self.achievementsTabLabel:SetBackColor(Scripts.color["darkgrey"]);
	self.achievementsTabLabel:SetText("Achievements");

	self.achievementsTabLabel.MouseEnter = function( sender, args)
		self.achievementsTabLabel:SetBackColor(Scripts.color["lightgrey"]);
	end
	
	self.achievementsTabLabel.MouseLeave = function( sender, args)
		self.achievementsTabLabel:SetBackColor(Scripts.color["darkgrey"]);
	end
	
	self.achievementsTabLabel.MouseClick = function( sender, args)
		WordGuesser.UI.achievementsWindow:SetWindowPosition(self:GetPosition());
		self:SetVisible(false);
		WordGuesser.UI.achievementsWindow:SetVisibility(true);
	end





	
	self.stageInfoNameTitle = Turbine.UI.Label();
	self.stageInfoNameTitle:SetParent(self.stageInfoBackground);
	self.stageInfoNameTitle:SetSize(200, 20);
	self.stageInfoNameTitle:SetPosition(20, 50);
	self.stageInfoNameTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoNameTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoNameTitle:SetText("Name:");



end



-- Set Visibility
function customGameWindow:SetVisibility(state)
    self:SetVisible(state);
end



-- Set position
function customGameWindow:SetWindowPosition(x, y)
    self:SetPosition(x, y);
end



if (not WordGuesser.UI) then WordGuesser.UI = {}; end
WordGuesser.UI.customGameWindow = customGameWindow();