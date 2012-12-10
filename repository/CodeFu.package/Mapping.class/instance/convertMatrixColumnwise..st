application
convertMatrixColumnwise: aMatrix 

	^aMatrix species withMatrix: (MappedMatrix on: aMatrix columnMap: self)