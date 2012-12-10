testing
testAtValueIfAbsentPut

	self assert: map size = 3.

	self assert: (map atValue: 26 ifAbsentPut: [ #z ]) = #z.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).

	self assert: (map atValue: 26 ifAbsentPut: [ #z ]) = #z.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).