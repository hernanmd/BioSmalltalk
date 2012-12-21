private
programBinary

	^OSPlatform isWin32
		ifTrue: [ self windowsBinary ]
		ifFalse: [ ('*I386*' match: OSPlatform platformName)
			ifTrue: [ self macIntelBinary ]
			ifFalse: [ self macPowerBinary10dot4dot10]]