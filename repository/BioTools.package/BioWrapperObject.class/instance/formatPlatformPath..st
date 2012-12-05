accessing private
formatPlatformPath: aPath
	" Private - Answe a <String> with the path properly formatted for the current platform "

	^ BioObject isRunningInWindows
				ifTrue:[ 
					String streamContents: [: stream |
						stream nextPutAll: aPath between: $" -> $" ] ]
				ifFalse: [
					aPath ]