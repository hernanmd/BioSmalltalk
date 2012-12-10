accessing
at: index 
	^bits allMask: (1 bitShift: index - 1)