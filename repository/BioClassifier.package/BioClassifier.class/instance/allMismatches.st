accessing
allMismatches

	^ mismatches isNil
		ifFalse: [ mismatches at: #mismatches ]
		ifTrue: [ Array empty ]
		