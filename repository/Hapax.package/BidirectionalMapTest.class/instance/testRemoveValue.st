testing
testRemoveValue


	self assert: (map includes: 2).
	self assert: (map includesKey: #b).

	self should: [ map removeValue: #b ] raise: Error.
	map removeValue: 2.

	self assert: (map includes: 2) not.
	self assert: (map includesKey: #b) not.