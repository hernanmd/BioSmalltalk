printing
printOn: aStream
	" Private - See superimplementor's comment "

	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title.
	aStream 
		nextPutAll: self alphabet asString between: $( -> $);
		space;
		nextPutAll: self asString between: $[ -> $]