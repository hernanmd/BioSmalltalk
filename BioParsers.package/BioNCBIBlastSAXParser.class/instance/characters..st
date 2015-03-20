content
characters: aString
	"This call corresponds to the Java SAX call characters(char[] ch, int start, int length)."
	
	current
		ifNotNil: [ 
			current blastValue: aString.
			results addNode: current ]