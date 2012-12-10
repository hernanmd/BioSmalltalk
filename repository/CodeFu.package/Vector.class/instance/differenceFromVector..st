double dispatching
differenceFromVector: aVector

	^aVector with: self collect: [ :a :b | a - b ]