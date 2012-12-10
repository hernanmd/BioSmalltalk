running
testRemoveHapaxes

	terms := Terms sample.
	self assert: terms distinctSize = 56.
	terms removeHapaxes.
	self assert: terms distinctSize = 12.

	^terms