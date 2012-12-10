application
convertMatrixRowwise: aMatrix 

	^aMatrix species withAll: (MappedMatrix on: aMatrix rowMap: self)