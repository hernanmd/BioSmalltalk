accessing
characters: aString
	"This call corresponds to the Java SAX call characters(char[] ch, int start, int length)."

	catchNodes ifTrue: [ results add: aString ].
	current := nil.
	self catchOff.