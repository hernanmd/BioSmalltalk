convenience-delimiters
delimiterSourceCharacter
	" Answer a Character used to delimit fields in the receiver's result "
	
	^ delimiterSourceCharacter
		ifNil: [ delimiterSourceCharacter := $; ]