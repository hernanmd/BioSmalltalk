converting
asString
	" Answer the String representation of the receiver." 	
	
	^ String streamContents: [: stream |
		stream nextPutAll: self numberOfTaxa asString;
			space;
			nextPutAll: self numberOfCharacters asString;
			cr.
		self taxonIdentifiers with: (self sequences first: self numberOfTaxa) do: [: id : seq |
			stream 
				nextPutAll: id;
				nextPutAll: seq asString;
				cr ].
		(self sequences allButFirst: self numberOfTaxa) do: [: seq |
			stream
				nextPutAll: seq ]  ]