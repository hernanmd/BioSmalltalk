accessing
formatPlatformPath: aPath
	" Private - Given aPath answer a <String> with the path properly formatted for the current platform "
	
	^ self isRunningInWindows
		ifTrue: [ String streamContents: [ : stream | stream nextPutAll: aPath between: $" -> $" ] ]
		ifFalse: [ aPath ]