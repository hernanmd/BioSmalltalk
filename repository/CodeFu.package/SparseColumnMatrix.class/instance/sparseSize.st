accessing
sparseSize

	^columns inject: 0 into: [ :sum :each | sum + each sparseSize ]