accessing
locateProgram: programName
	" Answer a <String> with the full qualified path to programName if can be located by the which command "
	
	^ self programLocation isEmpty
		ifTrue: [ self locateProgramNamed: programName ]
		ifFalse: [ self programLocation ].
