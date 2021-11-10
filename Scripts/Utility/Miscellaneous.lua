-- Cuts string into array using delimiter
-- Example: CutString("11-22", "-") returns array {"11", "22"}
function CutString(string, delimiter)
    local result = {};

    for match in string.gmatch(string, "([^".. delimiter .."]+)") do
        table.insert(result, match);
    end

    return result;
end



-- Checks the size of a table
function GetTableSize(table)
	
	if table == nil then return 0; end
    
	local count = 0;
	for a, b in pairs(table) do
		count = count + 1;
    end
    
	return count;
end



-- Check if key exists in table
function KeyInTable(table, key)
    if (table[key] ~= nil) then
        return true;
    end

	return false;
end



-- Check is value exist in table
function ValueInTable(table, value)
    for k,v in pairs(table) do
        if (v == value) then
            return true;
        end
    end

    return false;
end



-- Remove key from table
function TableRemoveKey(table, key)
	table[key] = nil;
end



-- Remove value from table
function TableRemoveValue(table, value)
    for k,v in pairs(table) do
        if (v == value) then
            table[k] = nil;
            break;
        end
    end
end



-- Check if value is in array
function InArray(array, value)

    for i = 1, #array, 1 do
        if (array[i] == value) then
            return true;
        end
    end

	return false;
end



-- Remove value from table
function ArrayRemoveKey(array, value)
    for i = 1, #array, 1 do
        if (array[i] == value) then
            table.remove(array, i);
            break;
        end
    end
end



-- Convert int (seconds) to minutes as string
function ConvertSecondsToMinutes(seconds)

    if (seconds <= 60) then
        return seconds .. " s";
    end

    local minutes = math.floor(seconds / 60);
    local seconds = seconds % 60;
    local suffix = " mins";

    if (seconds < 10) then
        seconds = "0" .. seconds;
    end

    if (minutes == 1) then
        suffix = " min";
    end

    return minutes .. ":" .. seconds .. suffix;
end


-- Converts table keys {["one"] = 1, ["two"] = 2, ["three"] = 3} into string "one   two   three"
function ConvertTableKeysToString(table)
    local string = "";
    local tableSize = GetTableSize(table);
    local i = 1;
    for key,value in pairs(table) do
        string = string .. key;

        if (i ~= tableSize) then
            string = string .. "   ";
        end

        i = i + 1;
    end

    return string:upper()
end



-- Converts table values {["one"] = 1, ["two"] = 2, ["three"] = 3} into string "1   2   3"
function ConvertTableValuesToString(table)
    local string = "";
    local tableSize = GetTableSize(table);
    local i = 1;
    for key,value in pairs(table) do
        string = string .. value;

        if (i ~= tableSize) then
            string = string .. "   ";
        end

        i = i + 1;
    end

    return string:upper()
end



-- Converts array {"one", "two", "three"} into string "one   two   three"
function ConvertArrayToString(array)
    local string = "";
    local arraySize = GetTableSize(array);

    for i = 1, arraySize, 1 do
        string = string .. array[i];

        if (i ~= arraySize) then
            string = string .. "   ";
        end

        if (i == 10) then
            string = string .. "\n";
        end
    end

    return string:upper();
end