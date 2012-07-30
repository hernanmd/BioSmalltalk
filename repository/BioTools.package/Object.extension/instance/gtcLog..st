*BioTools
gtcLog: aString
	" Conditional write aString to a streamer "
	
	self class shouldLog
		ifTrue: [ self bioLog: aString ]