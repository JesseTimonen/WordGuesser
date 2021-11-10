campaignWindow = class(Turbine.UI.Lotro.GoldWindow);

-- Constructor
function campaignWindow:Constructor()
	Turbine.UI.Lotro.GoldWindow.Constructor(self);
	self:SetText("Word Guesser");
	self:SetVisible(true);
    self:SetSize(600, 500);
    self:SetPosition(Scripts.windowPosition["xPos"], Scripts.windowPosition["yPos"]);
	self.selectedCampaign = nil;


    -- Campaign tab
	self.campaignTabLabel = Turbine.UI.Label();
	self.campaignTabLabel:SetParent(self);
	self.campaignTabLabel:SetSize(120, 50);
	self.campaignTabLabel:SetPosition(self:GetWidth() / 2 - self.campaignTabLabel:GetWidth() / 2 - 200, 50);
	self.campaignTabLabel:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.campaignTabLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.campaignTabLabel:SetForeColor(Scripts.color["black"]);
	self.campaignTabLabel:SetBackColor(Scripts.color["lightgrey"]);
    self.campaignTabLabel:SetText("Campaign");


	-- Custom game tab
	self.customGameTabLabel = Turbine.UI.Label();
	self.customGameTabLabel:SetParent(self);
	self.customGameTabLabel:SetSize(120, 50);
	self.customGameTabLabel:SetPosition(self:GetWidth() / 2 - self.customGameTabLabel:GetWidth() / 2 - 66, 50);
	self.customGameTabLabel:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.customGameTabLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.customGameTabLabel:SetForeColor(Scripts.color["black"]);
	self.customGameTabLabel:SetBackColor(Scripts.color["darkgrey"]);
    self.customGameTabLabel:SetText("Custom Game");

    self.customGameTabLabel.MouseEnter = function( sender, args)
        self.customGameTabLabel:SetBackColor(Scripts.color["lightgrey"]);
	end

    self.customGameTabLabel.MouseLeave = function( sender, args)
        self.customGameTabLabel:SetBackColor(Scripts.color["darkgrey"]);
	end

	self.customGameTabLabel.MouseClick = function( sender, args)
        WordGuesser.UI.customGameWindow:SetWindowPosition(self:GetPosition());
        self:SetVisible(false);
        WordGuesser.UI.customGameWindow:SetVisibility(true);
	end


	-- Statistics tab
	self.statisticsTabLabel = Turbine.UI.Label();
	self.statisticsTabLabel:SetParent(self);
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


	-- Create stages
	self.stages = {};
	self.stageYPosition = self:GetHeight() - 50;
	for i = 1, 12, 1 do
		table.insert(self.stages, self:CreateStage(i, self.stageYPosition));
		self.stageYPosition = self.stageYPosition - 30;
	end


	-- Activate stages
	self:EnableStages();


	-- limitedGuesses
	-- predifined characterset


	-- Stages information
	self.stageInfo = {
		[1] = {
			["name"] = "Campaign Stage 1",
			["timeLimit"] = 120,
			["timeObjective"] = 60,
			["CharacterCount"] = 5,
			["wordDifficultyLabel"] = "Easy, Medium",
			["wordDifficulty"] = {"easy", "medium"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[2] = {
			["name"] = "Campaign Stage 2",
			["timeLimit"] = 190,
			["timeObjective"] = 60,
			["CharacterCount"] = 6,
			["wordDifficultyLabel"] = "Easy, Medium",
			["wordDifficulty"] = {"easy", "medium"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[3] = {
			["name"] = "Campaign Stage 3",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 6,
			["wordDifficultyLabel"] = "Easy, Medium, Hard",
			["wordDifficulty"] = {"easy", "medium", "hard"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[4] = {
			["name"] = "Campaign Stage 4",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 6,
			["wordDifficultyLabel"] = "Easy, Medium, Hard",
			["wordDifficulty"] = {"easy", "medium", "hard"},
			["modifiersInfo"] = "You only have 30 guesses before game ends.",
			["modifiers"] = {"limitedGuesses30"},
		},
		[5] = {
			["name"] = "Campaign Stage 5",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 7,
			["wordDifficultyLabel"] = "Medium, Hard",
			["wordDifficulty"] = {"medium", "hard"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[6] = {
			["name"] = "Campaign Stage 6",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 8,
			["wordDifficultyLabel"] = "Medium, Hard",
			["wordDifficulty"] = {"medium", "hard"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[7] = {
			["name"] = "Campaign Stage 7",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 7,
			["wordDifficultyLabel"] = "Medium, Hard, Difficult",
			["wordDifficulty"] = {"medium", "hard", "difficult"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[8] = {
			["name"] = "Campaign Stage 8",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 10,
			["wordDifficultyLabel"] = "Easy, Medium, Hard, Difficult",
			["wordDifficulty"] = {"easy", "medium", "hard", "difficult"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[9] = {
			["name"] = "Campaign Stage 9",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 8,
			["wordDifficultyLabel"] = "Hard, Difficult",
			["wordDifficulty"] = {"hard", "difficult"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[10] = {
			["name"] = "Campaign Stage 10",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 10,
			["wordDifficultyLabel"] = "Hard, Difficult, Extreme",
			["wordDifficulty"] = {"hard", "difficult", "extreme"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[11] = {
			["name"] = "Campaign Stage 11",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 8,
			["wordDifficultyLabel"] = "Hard, Difficult",
			["wordDifficulty"] = {"hard", "difficult"},
			["modifiersInfo"] = "none",
			["modifiers"] = {"none"},
		},
		[12] = {
			["name"] = "Campaign Stage 12",
			["timeLimit"] = 61,
			["timeObjective"] = 30,
			["CharacterCount"] = 7,
			["wordDifficultyLabel"] = "Easy, Medium, Hard, Difficult, Extreme",
			["wordDifficulty"] = {"easy", "medium", "hard", "difficult", "extreme"},
			["modifiersInfo"] = "You start with a predifined characters.",
			["modifiers"] = {"predifined"},
			["predefined_characters"] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"},
		}
	 }


	-- stage info background
	self.stageInfoBackground = Turbine.UI.Label();
	self.stageInfoBackground:SetParent(self);
	self.stageInfoBackground:SetSize(340, 350);
	self.stageInfoBackground:SetPosition(220, 120);
	self.stageInfoBackground:SetBackColor(Scripts.color["darkgrey"]);
    self.stageInfoBackground:SetText("");


	-- Stage info title
	self.stageInfoTitle = Turbine.UI.Label();
	self.stageInfoTitle:SetParent(self.stageInfoBackground);
	self.stageInfoTitle:SetSize(self.stageInfoBackground:GetWidth(), 20);
	self.stageInfoTitle:SetPosition(0, 10);
	self.stageInfoTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoTitle:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.stageInfoTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoTitle:SetText("Stage Information");


	-- Stage info name
	self.stageInfoNameTitle = Turbine.UI.Label();
	self.stageInfoNameTitle:SetParent(self.stageInfoBackground);
	self.stageInfoNameTitle:SetSize(200, 20);
	self.stageInfoNameTitle:SetPosition(20, 50);
	self.stageInfoNameTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoNameTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoNameTitle:SetText("Name:");

	self.stageInfoName = Turbine.UI.Label();
	self.stageInfoName:SetParent(self.stageInfoBackground);
	self.stageInfoName:SetSize(200, 20);
	self.stageInfoName:SetPosition(72, 54);
	self.stageInfoName:SetForeColor(Scripts.color["black"]);
    self.stageInfoName:SetText("");


	-- Stage info rating
	self.stageInfoRatingTitle = Turbine.UI.Label();
	self.stageInfoRatingTitle:SetParent(self.stageInfoBackground);
	self.stageInfoRatingTitle:SetSize(200, 20);
	self.stageInfoRatingTitle:SetPosition(20, 80);
	self.stageInfoRatingTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoRatingTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoRatingTitle:SetText("Score:");

	self.stageInfoRating = Turbine.UI.Label();
	self.stageInfoRating:SetParent(self.stageInfoBackground);
	self.stageInfoRating:SetSize(48, 14);
	self.stageInfoRating:SetPosition(70, 81);
	self.stageInfoRating:SetText("");


	-- Stage info time limit
	self.stageInfoTimeLimitTitle = Turbine.UI.Label();
	self.stageInfoTimeLimitTitle:SetParent(self.stageInfoBackground);
	self.stageInfoTimeLimitTitle:SetSize(200, 20);
	self.stageInfoTimeLimitTitle:SetPosition(20, 110);
	self.stageInfoTimeLimitTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoTimeLimitTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoTimeLimitTitle:SetText("Time:");

	self.stageInfoTimeLimit = Turbine.UI.Label();
	self.stageInfoTimeLimit:SetParent(self.stageInfoBackground);
	self.stageInfoTimeLimit:SetSize(200, 20);
	self.stageInfoTimeLimit:SetPosition(65, 114);
	self.stageInfoTimeLimit:SetForeColor(Scripts.color["black"]);
    self.stageInfoTimeLimit:SetText("");


	-- Stage info character count
	self.stageInfoCharacterCountTitle = Turbine.UI.Label();
	self.stageInfoCharacterCountTitle:SetParent(self.stageInfoBackground);
	self.stageInfoCharacterCountTitle:SetSize(200, 20);
	self.stageInfoCharacterCountTitle:SetPosition(20, 140);
	self.stageInfoCharacterCountTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoCharacterCountTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoCharacterCountTitle:SetText("Character Count:");
	
	self.stageInfoCharacterCount = Turbine.UI.Label();
	self.stageInfoCharacterCount:SetParent(self.stageInfoBackground);
	self.stageInfoCharacterCount:SetSize(200, 20);
	self.stageInfoCharacterCount:SetPosition(151, 144);
	self.stageInfoCharacterCount:SetForeColor(Scripts.color["black"]);
    self.stageInfoCharacterCount:SetText("");


	-- Stage info word difficulty
	self.stageInfoWordDifficultyTitle = Turbine.UI.Label();
	self.stageInfoWordDifficultyTitle:SetParent(self.stageInfoBackground);
	self.stageInfoWordDifficultyTitle:SetSize(200, 20);
	self.stageInfoWordDifficultyTitle:SetPosition(20, 170);
	self.stageInfoWordDifficultyTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoWordDifficultyTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoWordDifficultyTitle:SetText("Word Difficulty:");

	self.stageInfoWordDifficulty = Turbine.UI.Label();
	self.stageInfoWordDifficulty:SetParent(self.stageInfoBackground);
	self.stageInfoWordDifficulty:SetSize(200, 40);
	self.stageInfoWordDifficulty:SetPosition(30, 190);
	self.stageInfoWordDifficulty:SetForeColor(Scripts.color["black"]);
    self.stageInfoWordDifficulty:SetText("");


	-- Stage info modifies
	self.stageInfoModifiersTitle = Turbine.UI.Label();
	self.stageInfoModifiersTitle:SetParent(self.stageInfoBackground);
	self.stageInfoModifiersTitle:SetSize(200, 20);
	self.stageInfoModifiersTitle:SetPosition(20, 220);
	self.stageInfoModifiersTitle:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.stageInfoModifiersTitle:SetForeColor(Scripts.color["black"]);
    self.stageInfoModifiersTitle:SetText("Modifiers:");

	self.stageInfoModifiers = Turbine.UI.Label();
	self.stageInfoModifiers:SetParent(self.stageInfoBackground);
	self.stageInfoModifiers:SetSize(200, 50);
	self.stageInfoModifiers:SetPosition(30, 240);
	self.stageInfoModifiers:SetForeColor(Scripts.color["black"]);
    self.stageInfoModifiers:SetText("");


	-- Start game button
	self.startCampaignGameButton = Turbine.UI.Lotro.Button();
	self.startCampaignGameButton:SetParent(self.stageInfoBackground);
	self.startCampaignGameButton:SetSize(80, 30);
	self.startCampaignGameButton:SetPosition(self.stageInfoBackground:GetWidth() / 2 - self.startCampaignGameButton:GetWidth() / 2, self.stageInfoBackground:GetHeight() - 30);
    self.startCampaignGameButton:SetText("Start Game");
	self.startCampaignGameButton:SetEnabled(false);
	self.startCampaignGameButton.Click = function( sender, args)

		Scripts.SetRandomSeed();

		i = 1;

		if (Scripts.Utility.ValueInTable(self.stageInfo[self.selectedCampaign]["modifiers"], "predifined")) then

			Scripts.chosenLetters = self.stageInfo[self.selectedCampaign]["predefined_characters"];
			Scripts.CheckPossibleWordsFromChosenLetters();

		else

			while (Scripts.Utility.GetTableSize(Scripts.possibleWords) < 2 and i < 100) do
				Scripts.GenerateRandomCharacters(self.stageInfo[self.selectedCampaign]["CharacterCount"]);
				Scripts.CheckPossibleWordsFromChosenLetters();
				i = i + 1;
			end

		end

		if (Scripts.Utility.GetTableSize(Scripts.possibleWords) < 2) then
			Scripts.notification("Failed to create game, not enough words found!");
		else
			Scripts.SelectFeaturedWordsFromPossibleWords();
			WordGuesser.UI.gameWindow:SetWindowPosition(self:GetPosition());
			self:SetVisible(false);
			WordGuesser.UI.gameWindow:SetVisibility(true);
			WordGuesser.UI.gameWindow:StartGame(self.stageInfo[self.selectedCampaign]["timeLimit"], self.stageInfo[self.selectedCampaign]["timeObjective"], self.selectedCampaign, self.stageInfo[self.selectedCampaign]["modifiers"]);
		end
	end
end



-- Set Visibility
function campaignWindow:SetVisibility(state)
    self:SetVisible(state);

	if (state) then
		self:ResetCampaignInfoDisplay();
		self:EnableStages();
	end
end



function campaignWindow:EnableStages()
	for i = 1, Scripts.settings["progress"], 1 do
		self.stages[i]["button"]:SetEnabled(true);
		self.stages[i]["button"]:SetText("Enter");
	end
end



-- Set position
function campaignWindow:SetWindowPosition(x, y)
    self:SetPosition(x, y);
end



-- Reset campaign info
function campaignWindow:ResetCampaignInfoDisplay()
	self.selectedCampaign = nil;
	self.startCampaignGameButton:SetEnabled(false);
	self.stageInfoName:SetText("");
	self.stageInfoTimeLimit:SetText("");
	self.stageInfoCharacterCount:SetText("");
	self.stageInfoWordDifficulty:SetText("");
	self.stageInfoModifiers:SetText("");
	self.stageInfoRating:SetBackground(nil);
end



function campaignWindow:CreateStage(index, ypos)
	-- Create label to stage
	local label = Turbine.UI.Label();
	label:SetParent(self);
	label:SetSize(80, 30);
	label:SetPosition(40, ypos);
	label:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	label:SetForeColor(Scripts.color["white"]);
    label:SetText("Stage " .. index);

	-- Create button to enter stage
	local button = Turbine.UI.Lotro.Button();
	button:SetParent(self);
	button:SetSize(80, 30);
	button:SetPosition(120, ypos);
    button:SetText("Locked");
	button:SetEnabled(false);
	button.Click = function( sender, args)
		self.selectedCampaign = index;
		self.startCampaignGameButton:SetEnabled(true);
		self.stageInfoName:SetText(self.stageInfo[index]["name"]);
		self.stageInfoTimeLimit:SetText(Scripts.Utility.ConvertSecondsToMinutes(self.stageInfo[index]["timeLimit"]));
		self.stageInfoCharacterCount:SetText(self.stageInfo[index]["CharacterCount"]);
		self.stageInfoWordDifficulty:SetText(self.stageInfo[index]["wordDifficultyLabel"]);
		self.stageInfoModifiers:SetText(self.stageInfo[index]["modifiersInfo"]);
		self.stageInfoRating:SetBackground(Turbine.UI.Graphic("WordGuesser/Images/rating" .. Scripts.settings["ratings"]["stage-" .. index] .. ".tga"));
	end

	-- Return both label and button
	stage = {}
	stage["label"] = label;
	stage["button"] = button;
	return stage;
end



if (not WordGuesser.UI) then WordGuesser.UI = {}; end
WordGuesser.UI.campaignWindow = campaignWindow();