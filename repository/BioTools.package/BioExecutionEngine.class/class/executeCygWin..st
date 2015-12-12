accessing
executeCygWin: programName
	" Execute programName in a cygwin environment and answer a resulting <String> "

	| cmdParts cmdLine cmdParams |
	cmdParts := programName findTokens: Character space.
	cmdLine := cmdParts collect: [ :cmdPart | cmdPart copyReplaceAll: '\' with: '/' ].
	cmdLine := cmdLine collect: [ : cmdPart | cmdPart copyReplaceAll: ':' with: '' ].
	cmdParams := cmdLine	allButFirst collect: [ : par | 
			(par beginsWith: '-') ifTrue: [ par ] ifFalse: [ '/cygdrive/' , par ] ].
	cmdLine := (OrderedCollection with: cmdParts first) 	addAll: cmdParams; yourself.
	^ self adapterClass executeCommand: (cmdLine joinUsing: Character space)