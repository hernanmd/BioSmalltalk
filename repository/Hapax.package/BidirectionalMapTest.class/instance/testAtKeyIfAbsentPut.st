testing
testAtKeyIfAbsentPut

	self assert: map size = 3.

	self assert: (map atKey: #z ifAbsentPut: [ 26 ]) = 26.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).

	self assert: (map atKey: #z ifAbsentPut: [ 26 ]) = 26.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).