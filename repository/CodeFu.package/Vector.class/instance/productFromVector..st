double dispatching
productFromVector: aVector

	^aVector with: self collect: [ :a :b | a * b ]