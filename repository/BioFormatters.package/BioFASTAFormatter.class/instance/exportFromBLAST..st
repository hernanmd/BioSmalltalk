exporting
exportFromBLAST: hitCollection
	" Write a time-stamped file in the receiver's format from hitCollecction "
	
	| blastAlignLength |
	
	blastAlignLength := hitCollection first alignLength asNumber.
	stream := WriteStream on: ( String new: ( hitCollection size + 1 ) * ( blastAlignLength + 1 ) ).	
	hitCollection do: [: hitNode |
		stream 
			nextPut: $>;
			nextPutAll: hitNode hitDefinition;
			cr.
		hitNode hSequence do: [: letter |
			stream nextPut: letter ].
		stream cr ].
	
	self dumpToFileNamed: self outputFilename contents: stream contents
