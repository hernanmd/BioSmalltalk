private-algorithm
stemEndsWithDoubleConsonant
	"comment stating purpose of message"

	^cursor >= 2 and: 
			[(string at: cursor) = (string at: cursor - 1) 
				and: [self isConsonantAt: cursor]]