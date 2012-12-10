double dispatching
quotientFromMatrix: aMatrix

	^aMatrix with: self collect: [ :a :b | a / b ]