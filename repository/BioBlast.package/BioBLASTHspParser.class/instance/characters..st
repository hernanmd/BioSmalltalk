content
characters: aString
	"This call corresponds to the Java SAX call
	characters(char[] ch, int start, int length)."
	
	catchNodes
		ifTrue: [ current value: aString ].
	self catchOff.