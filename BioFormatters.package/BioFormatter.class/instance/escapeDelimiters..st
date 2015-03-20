convenience-delimiters
escapeDelimiters: aString
	" Answer a String replacing the receiver's #delimiter with #replacementDelimiter in aString "
	
	| answer |
	((answer := aString) includes: self delimiterSourceCharacter)
		ifTrue: [ answer := answer 
				copyReplaceAll: self delimiterSourceCharacter asString 
				with: self delimiterTargetCharacter asString ].
	^ answer
