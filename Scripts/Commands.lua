localTimeDisplayCommand = Turbine.ShellCommand();

-- Execute command
function localTimeDisplayCommand:Execute(command, args)

end

-- Commands
Turbine.Shell.AddCommand("words", localTimeDisplayCommand);