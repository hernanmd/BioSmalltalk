exporting
exportMatrixFromBLAST: hitCollection
	
	hitCollection do: [: hitNode |
		| prev name |		
		" Write the description "
		prev := 0.
		name := self escapeDelimiters: hitNode hitDefinition blastValue.	
		stream nextPutAll: name.
		(self mutationIndexesIn: hitNode) do: [: index |
			self exportHitCount: (index - prev) - 1 in: stream.
			stream 
				nextPut: self delimiterSourceCharacter;
				nextPut: (hitNode selectHspHSeq at: index).
			prev := index ].
		" Write remaining identities "	
		prev = hitNode selectHspMidLine size ifFalse: [ 
			self exportHitCount: hitNode selectHspMidLine size - prev in: stream ].
		stream cr ].
