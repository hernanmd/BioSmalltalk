double dispatching
differenceFromMatrix: aMatrix

	^aMatrix with: self collect: [ :a :b | a - b ]