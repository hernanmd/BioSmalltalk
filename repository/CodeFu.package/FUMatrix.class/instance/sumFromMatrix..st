double dispatching
sumFromMatrix: aMatrix

	^aMatrix with: self collect: [ :a :b | a + b ]