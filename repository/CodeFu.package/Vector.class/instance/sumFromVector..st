double dispatching
sumFromVector: aVector

	^aVector with: self collect: [ :a :b | a + b ]