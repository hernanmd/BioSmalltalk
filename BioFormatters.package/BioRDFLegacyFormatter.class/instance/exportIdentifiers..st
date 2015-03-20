exporting
exportIdentifiers: hitCollection

	| tmpFile |
	
	tmpFile := self newFileNamed: 'FNetwork-Identifiers-' , Time totalSeconds asString , '.csv'.
	nameIndex := 1.
	hitCollection do: [ : hit |
		tmpFile 
			nextPutAll: self rowIdentifier;
			nextPut: $;;
			nextPutAll: ( self escapeDelimiters: hit hitDefinition );
			cr ].
	tmpFile close.