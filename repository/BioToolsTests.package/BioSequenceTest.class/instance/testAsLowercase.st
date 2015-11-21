testing
testAsLowercase

	self assert: (self sequence asLowercase asString allSatisfy: [: car | car isLowercase ]).	