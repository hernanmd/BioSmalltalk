accessing private
complementaryAt: aCharacter
	" Private - Answer a Character with the receiver's complementary "
	
	^ self alphabet complementaryTable at: aCharacter asLowercase