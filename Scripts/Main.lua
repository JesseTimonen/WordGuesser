function SetRandomSeed()
    -- Set seed for randomizer
    randomSeed = Utility.CutString(tostring(Turbine.Engine.GetGameTime()), ".");
    math.randomseed(tonumber(randomSeed[2]) * tonumber(randomSeed[1]));
end


function GenerateRandomCharacters(amount)

    if (amount < 3) then
        notification("Cannot create game with less than 3 characters, settings characters to 3");
    elseif (amount > 30) then
        notification("Cannot create game with more than 30 characters, settings characters to 30");
    end

    -- reset chosen letters
    chosenLetters = {};

    for i = 1, amount, 1 do


        -- Get random number
        local random = math.random(1, 51);

        -- Get random wovel or consonant
        if (i % 2 == 0) then
            if (vowels[random] ~= nil) then
                table.insert(chosenLetters, vowels[random])
            else
                table.insert(chosenLetters, "a")
            end
        else
            if (consonants[random] ~= nil) then
                table.insert(chosenLetters, consonants[random])
            else
                table.insert(chosenLetters, "t")
            end
        end
    end
end





function CheckPossibleWordsFromChosenLetters()

    possibleWords = {};
    local maximumCharacters = Utility.GetTableSize(chosenLetters);
    local wordIsPossible = true;

    -- Loop through all the disctionary words
    for word,difficulty in pairs(dictionary) do

        -- Only check word if it has less characters than the search array
        if (string.len(word) <= maximumCharacters) then

            wordIsPossible = true;
            temp = {};
            for i = 1, #chosenLetters, 1 do
                table.insert(temp, chosenLetters[i]);
            end

            -- Loop trough dictionary words and check their characters
            for i = 1, string.len(word), 1 do
        
                local character = word:sub(i,i);

                if (Utility.InArray(temp, character)) then
                    -- If character was found in both dictionary word and search array continue the search and remove the found character
                    Utility.ArrayRemoveKey(temp, character);
                else
                    -- If character was not found set word as not possible and move to the next word
                    wordIsPossible = false;
                    break;
                end

            end

            if (wordIsPossible) then
                possibleWords[word] = difficulty;
            end

        end
    end
end






function SelectFeaturedWordsFromPossibleWords()

    featuredWords = {};
    local wordCount = Utility.GetTableSize(possibleWords);

    if (wordCount <= 10) then
        featuredWords = possibleWords;
        possibleWords = {};
        return;
    end

    local int = 1;
    for word,difficulty in pairs(possibleWords) do
        featuredWords[word] = difficulty;
        possibleWords[word] = nil;

        if (int == 10) then
            break;
        end

        int = int + 1;
    end
end