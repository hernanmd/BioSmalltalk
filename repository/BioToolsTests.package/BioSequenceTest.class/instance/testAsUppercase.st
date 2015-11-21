testing
testAsUppercase

	self assert: (self sequence asUppercase asString allSatisfy: [: car | car isUppercase ]).
