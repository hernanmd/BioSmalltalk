accessing
executeOSProcessCommand: aCommandName
	" Private - Execute aCommandName and answer a <String> with any output returned "

	| osProcess teeCmd |
	
	teeCmd := 'tee -a last.run'.
	osProcess := ((self classFor: self providerClass) command: aCommandName) | teeCmd.
	^ osProcess outputAndError