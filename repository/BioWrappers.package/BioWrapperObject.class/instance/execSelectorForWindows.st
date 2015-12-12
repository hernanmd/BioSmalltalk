private
execSelectorForWindows

	^ self isExecCygwin
		ifTrue: [ #executeCygWin: ]
		ifFalse: [ #executeCommand: ]