testing
testRemoveKey


	self assert: (map includes: 2).
	self assert: (map includesKey: #b).

	self should: [ map removeKey: 2 ] raise: Error.
	map removeKey: #b.

	self assert: (map includes: 2) not.
	self assert: (map includesKey: #b) not.