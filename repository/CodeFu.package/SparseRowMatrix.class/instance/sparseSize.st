accessing
sparseSize

	^rows inject: 0 into: [ :sum :each | sum + each sparseSize ]