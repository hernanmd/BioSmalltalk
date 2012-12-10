testing
testAtPut

	self assert: map size = 3.

	self assert: (map at: #z put: 26) = 26.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).