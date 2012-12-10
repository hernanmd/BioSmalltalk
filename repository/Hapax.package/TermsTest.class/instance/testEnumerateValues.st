running
testEnumerateValues

	terms := Terms sample.
	terms termsDo: [ :each | 
		self assert: each isString ]