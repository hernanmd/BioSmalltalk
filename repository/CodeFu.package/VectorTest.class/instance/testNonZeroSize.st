test
testNonZeroSize

	v := self vectorClass new: 100 withAll: 0.
	self assert: v sparseSize = 0.
	v at: 23 put: 1.
	self assert: v sparseSize = 1.
	v at: 23 put: 0.
	self assert: v sparseSize = 0.
	v at: 17 put: 1.
	v at: 27 put: 2.
	v at: 77 put: 3.
	self assert: v sparseSize = 3.
	v at: 27 put: 4.
	self assert: v sparseSize = 3.
	v at: 17 put: 0.
	self assert: v sparseSize = 2.
	v at: 43 put: 0.
	self assert: v sparseSize = 2.