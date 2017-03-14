accessing
indexOfFieldNamed:fieldName
	" Given fieldName answer a <Number> representing the position in the receiver's TXT file "
	
	^ (self readHeader findTokens: Character tab) doWithIndex: [ : field : index |
			field = fieldName ifTrue: [ ^ index ] ]