double dispatching
productFromMatrix: aMatrix

	^aMatrix with: self collect: [ :a :b | a * b ]