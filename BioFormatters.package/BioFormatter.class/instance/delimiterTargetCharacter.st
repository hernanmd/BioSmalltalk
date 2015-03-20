convenience-delimiters
delimiterTargetCharacter
	" Answer a Character used to replace the receiver's delimiter in the receiver's result "
	
	^ delimiterTargetCharacter
		ifNil: [ delimiterTargetCharacter := $, ]