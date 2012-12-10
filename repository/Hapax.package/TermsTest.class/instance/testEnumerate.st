running
testEnumerate

	terms := Terms sample.
	terms do: [ :each | 
		self assert: each isString ]