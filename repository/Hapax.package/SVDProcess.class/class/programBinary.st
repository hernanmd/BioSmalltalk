private
programBinary
	| handle |
	handle := Smalltalk at: #OSHandle ifAbsent: [self halt].
	^handle currentOS = #win32
		ifTrue: [ self windowsBinary ]
		ifFalse: [ ('*I386*' match: handle currentPlatformID)
			ifTrue: [ self macIntelBinary ]
			ifFalse: [ self macPowerBinary10dot4dot10]]