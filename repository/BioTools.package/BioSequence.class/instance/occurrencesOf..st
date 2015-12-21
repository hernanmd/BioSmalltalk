accessing
occurrencesOf: aCharacter
	" Answer how many of the receiver's elements are equal to aLetter "
	
	^ seq asUppercase occurrencesOf: aCharacter asAminoacidLetter asUppercase