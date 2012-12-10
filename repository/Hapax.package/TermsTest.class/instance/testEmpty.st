running
testEmpty

	terms := Terms new.

	self assert: terms size = 0.
	self assert: terms distinctSize = 0.
	
	terms do: [ :each | self assert: false ]