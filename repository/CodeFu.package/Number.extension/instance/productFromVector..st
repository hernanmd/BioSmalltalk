*codefu
productFromVector: aVector

	^aVector collect: [ :a | a * self ]