exporting
rowIdentifier
	" Answer a String "
	| eName |

	self nameIndex numberOfDigits = self nameCharacterLimit
		ifFalse: [ 
			| pad |
			pad := self generateJoin: '0' 	repeat: self nameCharacterLimit - self nameIndex numberOfDigits.
			eName := pad , self nameIndex asString ]
		ifTrue: [ 
			eName := self nameIndex asString ].
	self nameIndex: self nameIndex + 1.		
	^ eName