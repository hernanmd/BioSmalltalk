testing
testAtPutOverride

	self assert: map size = 3.
	self assert: (map atValue: 2) = #b.
	self assert: (map atValue: 4711) = nil.

	self assert: (map at: #b put: 4711) = 4711.

	self assert: map size = 3.
	self assert: (map atValue: 2) = nil.
	self assert: (map atValue: 4711) = #b.