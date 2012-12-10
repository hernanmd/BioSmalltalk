*codefu
asSortBlock
	"Answer a sort block, which evaluates this symbol for both arguments
	and compares the resulting values"

	| stream |
	stream := (String new: self size * 2 + 14) writeStream.
	stream 
		nextPutAll: '[:a :b|a ';
		nextPutAll: self;
		nextPutAll: '<=b ';
		nextPutAll: self;
		nextPut: $].
	^Compiler evaluate: stream contents