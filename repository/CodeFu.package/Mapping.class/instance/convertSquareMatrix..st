application
convertSquareMatrix: aMatrix 

	^aMatrix species withMatrix: (MappedMatrix on: aMatrix map: self)