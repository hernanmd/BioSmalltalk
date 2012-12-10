double dispatching
quotientFromVector: aVector

	^aVector with: self collect: [ :a :b | a / b ]