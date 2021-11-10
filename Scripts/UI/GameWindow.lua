gameWindow = class(Turbine.UI.Lotro.GoldWindow);

-- Constructor
function gameWindow:Constructor()
	Turbine.UI.Lotro.GoldWindow.Constructor(self);
	self:SetText("Word Guesser");
	self:SetVisible(false);
    self:SetSize(600, 500);
	self:SetPosition(Scripts.windowPosition["xPos"], Scripts.windowPosition["yPos"]);
	self.campaignIndex = nil;
	self.timeObjective = nil;
	self.timeUntilGameOver = 0;
	self.IsGameRunning = false;
	self.totalFeaturedWords = 0;
	self.currentPoints = 0;
	self.pointsToWin = 0;


	
	-- Characters label
	self.AvailableCharactersLabel = Turbine.UI.Label();
	self.AvailableCharactersLabel:SetParent(self);
	self.AvailableCharactersLabel:SetSize(self:GetWidth(), 50);
	self.AvailableCharactersLabel:SetPosition(0, 30);
	self.AvailableCharactersLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.AvailableCharactersLabel:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
	self.AvailableCharactersLabel:SetForeColor(Scripts.color["white"]);
    self.AvailableCharactersLabel:SetText("");


	-- Time left label
	self.timeLeftLabel = Turbine.UI.Label();
	self.timeLeftLabel:SetParent(self);
	self.timeLeftLabel:SetSize(150, 20);
	self.timeLeftLabel:SetPosition(410, 30);
	self.timeLeftLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleRight);
	self.timeLeftLabel:SetForeColor(Scripts.color["white"]);
    self.timeLeftLabel:SetText("");
	self.timeLeftLabel:SetWantsUpdates(false);
	self.timeLeftLabel.Update = function()
		self:UpdateTimer();
	end


	-- Game result text


	self.resultRatingImage = Turbine.UI.Label();
	self.resultRatingImage:SetParent(self);
	self.resultRatingImage:SetSize(48, 14);
	self.resultRatingImage:SetVisible(false);
	self.resultRatingImage:SetPosition(435, 340);
	self.resultRatingImage:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.resultRatingImage:SetText("");


	self.resultText = Turbine.UI.Label();
	self.resultText:SetParent(self);
	self.resultText:SetVisible(false);
	self.resultText:SetSize(180, 50);
	self.resultText:SetPosition(370, 350);
	self.resultText:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.resultText:SetFont(Turbine.UI.Lotro.Font.VerdanaBold16);
    self.resultText:SetText("");


	self.campaignResultObjective1 = Turbine.UI.Label();
	self.campaignResultObjective1:SetParent(self);
	self.campaignResultObjective1:SetVisible(false);
	self.campaignResultObjective1:SetSize(180, 50);
	self.campaignResultObjective1:SetPosition(370, 380);
	self.campaignResultObjective1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    self.campaignResultObjective1:SetText("");


	
	self.campaignResultObjective2 = Turbine.UI.Label();
	self.campaignResultObjective2:SetParent(self);
	self.campaignResultObjective2:SetVisible(false);
	self.campaignResultObjective2:SetSize(180, 50);
	self.campaignResultObjective2:SetPosition(370, 415);
	self.campaignResultObjective2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    self.campaignResultObjective2:SetText("");





	-- Words guessed label
	self.wordsGuessedLabel = Turbine.UI.Label();
	self.wordsGuessedLabel:SetParent(self);
	self.wordsGuessedLabel:SetSize(100, 30);
	self.wordsGuessedLabel:SetPosition(30, 30);
	self.wordsGuessedLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.wordsGuessedLabel:SetForeColor(Scripts.color["white"]);
    self.wordsGuessedLabel:SetText("");


	-- Words
	self.featuredWordLabels = self:CreateFeaturedWordLabels();

	-- Word input
	self.wordInputBackground = Turbine.UI.Control();
	self.wordInputBackground:SetParent(self);
	self.wordInputBackground:SetSize(200, 25);
	self.wordInputBackground:SetPosition(30, 370);
	self.wordInputBackground:SetBackColor(Scripts.color["white"]);

	self.wordInput = Turbine.UI.TextBox();
	self.wordInput:SetParent(self.wordInputBackground);
	self.wordInput:SetSize(self.wordInputBackground:GetWidth() - 5, self.wordInputBackground:GetHeight() - 5);
	self.wordInput:SetPosition(5, 5);
	self.wordInput:SetMultiline(false);
	self.wordInput:SetBackColor(Scripts.color["white"]);
	self.wordInput:SetForeColor(Scripts.color["black"]);
	self.wordInput:SetFont(Turbine.UI.Lotro.Font.Verdana14);
	self.wordInput:SetSelectable(true);
	self.wordInput:SetEnabled(false);
	self.wordInput:SetWantsKeyEvents(false);
	self.wordInput.KeyDown = function(sender,args)
		if (args.Action == 162 and self.IsGameRunning) then
			self.guessWordButton.Click();
		end
	end

	self.guessWordButton = Turbine.UI.Lotro.Button();
	self.guessWordButton:SetParent(self);
	self.guessWordButton:SetSize(80, 30);
	self.guessWordButton:SetPosition(245, 372);
    self.guessWordButton:SetText("Guess");
	self.guessWordButton.Click = function( sender, args)
		if (self.wordInput:GetText() ~= "") then
			self:GuessWord(self.wordInput:GetText());
			self.wordInput:SetText("");
		end
	end


	-- Quit game button
	self.quitGameButton = Turbine.UI.Lotro.Button();
	self.quitGameButton:SetParent(self);
	self.quitGameButton:SetSize(80, 30);
	self.quitGameButton:SetPosition(30, self:GetHeight() - 50);
    self.quitGameButton:SetText("Quit Game");
	self.quitGameButton.Click = function( sender, args)
		self:EndGame(false);
		WordGuesser.UI.campaignWindow:SetWindowPosition(self:GetPosition());
		self:SetVisibility(false);
		WordGuesser.UI.campaignWindow:SetVisibility(true);
	end



	-- -- Get seed button
	-- self.getSeedButton = Turbine.UI.Lotro.Button();
	-- self.getSeedButton:SetParent(self);
	-- self.getSeedButton:SetSize(80, 30);
	-- self.getSeedButton:SetPosition(150, self:GetHeight() - 50);
    -- self.getSeedButton:SetText("Get Seed");
	-- self.getSeedButton.Click = function( sender, args)
	-- 	Scripts.notification("You are playing game generated with seed: " .. tonumber(Scripts.randomSeed[2]) * tonumber(Scripts.randomSeed[1]));
	-- end
end



-- Set Visibility
function gameWindow:SetVisibility(state)
    self:SetVisible(state);
end



-- Set position
function gameWindow:SetWindowPosition(x, y)
    self:SetPosition(x, y);
end



function gameWindow:CreateFeaturedWordLabels()

	local featuredWordLabels = {};
	local yPos = 100;

	for i = 1, 10, 1 do
		local word = Turbine.UI.Label();
		word:SetParent(self);
		word:SetSize(400, 20);
		word:SetPosition(30, yPos);
		word:SetForeColor(Scripts.color["white"]);
		word:SetText("");
		featuredWordLabels[i] = word;
		yPos = yPos + 25;
	end

	return featuredWordLabels;
end



function gameWindow:StartGame(timeLimit, timeObjective, campaignIndex)

	self.campaignIndex = campaignIndex;
	self.timeObjective = timeObjective;
	self.currentPoints = 0;
	self.timeUntilGameOver = math.floor(Turbine.Engine.GetGameTime()) + timeLimit;

	self.IsGameRunning = true;
	self.wordInput:SetWantsKeyEvents(true);
	self.timeLeftLabel:SetWantsUpdates(true);
	self.wordInput:SetEnabled(true);
	self.guessWordButton:SetEnabled(true);
	self.resultText:SetVisible(false);
	self.resultRatingImage:SetVisible(false);
	self.campaignResultObjective1:SetVisible(false);
	self.campaignResultObjective2:SetVisible(false);

	self.wordInput:SetText("");
	self.AvailableCharactersLabel:SetText(Scripts.Utility.ConvertArrayToString(Scripts.chosenLetters));


	for i = 1, #self.featuredWordLabels, 1 do
		self.featuredWordLabels[i]:SetForeColor(Scripts.color["white"]);
		self.featuredWordLabels[i]:SetText("");
	end


	self.totalFeaturedWords = Scripts.Utility.GetTableSize(Scripts.featuredWords);


	if (self.totalFeaturedWords > 8) then
		self.pointsToWin = 8;
	elseif (self.totalFeaturedWords > 6) then
		self.pointsToWin = 7;
	elseif (self.totalFeaturedWords > 4) then
		self.pointsToWin = 5;
	else
		self.pointsToWin = self.totalFeaturedWords;
	end


	self.wordsGuessedLabel:SetText("Words Left\n" .. self.currentPoints .. "/" .. self.pointsToWin);


	local i = 1;
	for key,value in pairs(Scripts.featuredWords) do
		local string = i .. ")  ";
		if (i < 10) then
			string = string .. " ";
		end
		local charactersRevealed = 0;

		if (string.len(key) == 2) then
			charactersRevealed = 1;
		end

		if (string.len(key) == 1) then
			charactersRevealed = 2;
		end
		

		for i = 1, string.len(key), 1 do

			if (charactersRevealed < 2) then
				local random = math.random(1, 100);
				-- 25% chance to reveal a character
				if (random <= 25) then
					string = string .. string.sub(key, i, i):upper() .. "  ";
					charactersRevealed = charactersRevealed + 1;
				else
					string = string .. "_  ";
				end
			else
				string = string .. "_  ";
			end
		end

		self.featuredWordLabels[i]:SetText(string);
		self.featuredWordLabels[i].correctWord = key;
		i = i + 1;
	end
end


function gameWindow:EndGame(result)
	self.IsGameRunning = false;
	self.wordInput:SetWantsKeyEvents(false);
	self.timeLeftLabel:SetWantsUpdates(false);
	self.wordInput:SetEnabled(false);
	self.guessWordButton:SetEnabled(false);
	self.wordInput:SetText("");

	-- Display VICTORY or FAILED message
	self.resultText:SetVisible(true);
	self.campaignResultObjective1:SetVisible(true);
	self.campaignResultObjective2:SetVisible(true);
	self.resultRatingImage:SetVisible(true);


	if (self.currentPoints >= self.pointsToWin) then
		-- Victory
		self.resultText:SetForeColor(Scripts.color["green"]);
		self.resultText:SetText("VICTORY");

		if (self.campaignIndex ~= nil) then
			if (Scripts.settings["progress"] == self.campaignIndex) then
				Scripts.settings["progress"] = Scripts.settings["progress"] + 1;
			end
		end

		local rating = 1;

		self.campaignResultObjective1:SetText("Guess every words (" .. self.currentPoints .. "/" .. self.totalFeaturedWords .. ")");
		self.campaignResultObjective1:SetForeColor(Scripts.color["grey"]);
		if (self.totalFeaturedWords == self.currentPoints) then
			rating = rating + 1;
			self.campaignResultObjective1:SetForeColor(Scripts.color["green"]);
		end

		self.campaignResultObjective2:SetText("Guess every word with more than " .. self.timeObjective .. " seconds to spare");
		self.campaignResultObjective2:SetForeColor(Scripts.color["grey"]);
		if (self.timeUntilGameOver - math.floor(Turbine.Engine.GetGameTime()) > self.timeObjective) then
			rating = rating + 1;
			self.campaignResultObjective2:SetForeColor(Scripts.color["green"]);
		end

		Scripts.settings["ratings"]["stage-" .. self.campaignIndex] = rating;
		self.resultRatingImage:SetBackground(Turbine.UI.Graphic("WordGuesser/Images/rating" .. rating .. ".tga"));

	else
		-- Failed game
		self.resultText:SetForeColor(Scripts.color["red"]);
		self.resultText:SetText("FAILED");
	end

	-- Reveal missed words
	for key,value in pairs(Scripts.featuredWords) do
		for i = 1, #self.featuredWordLabels, 1 do
			if (self.featuredWordLabels[i].correctWord == key) then
				self.featuredWordLabels[i]:SetText(self.featuredWordLabels[i]:GetText() .. "(" .. key .. ")");
			end
		end
	end
end




function gameWindow:UpdateTimer()
	local timeLeft = self.timeUntilGameOver - math.floor(Turbine.Engine.GetGameTime());
	self.timeLeftLabel:SetText(Scripts.Utility.ConvertSecondsToMinutes(timeLeft));
	if (timeLeft <= 0) then
		self.timeLeftLabel:SetText("Time's Up!");
		self:EndGame(false);
	end
end




function gameWindow:GuessWord(word)

	if (Scripts.Utility.KeyInTable(Scripts.featuredWords, word)) then

		self.currentPoints = self.currentPoints + 1;

		for i = 1, #self.featuredWordLabels, 1 do
			if (word == self.featuredWordLabels[i].correctWord) then
				local label = i .. ")";

				if (i < 10) then
					label = label .. " ";
				end

				for k = 1, #word do
					local character = word:sub(k,k)
					label = label .. "  " .. string.upper(character);
				end


				self.featuredWordLabels[i]:SetText(label);
				self.featuredWordLabels[i]:SetForeColor(Scripts.color["green"]);
				break;
			end
		end

		Scripts.Utility.TableRemoveKey(Scripts.featuredWords, word)
		self.wordsGuessedLabel:SetText("Words Left\n" .. self.currentPoints .. "/" .. self.pointsToWin);

		if (self.totalFeaturedWords == self.currentPoints) then
			self:EndGame()
		end
	end

	if (Scripts.Utility.KeyInTable(Scripts.possibleWords, word)) then
		self.timeUntilGameOver = self.timeUntilGameOver + 10;
		Scripts.notification("guessed other word: " .. word .. " adding extra time (10 seconds)");
		Scripts.Utility.TableRemoveKey(Scripts.possibleWords, word)
	end


end



if (not WordGuesser.UI) then WordGuesser.UI = {}; end
WordGuesser.UI.gameWindow = gameWindow();