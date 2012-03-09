accesing public - protein synthesis
translateWithTableId: aTableIdentifier stopSymbol: stopCharacter toStop: stopBoolean cds: cdsBoolean
	" Answer a new instance of the receiver's with the receiver's sequence translated to its corresponding Protein, adjusting the alphabet. 

	aTableIdentifier		Specifies which codon table to use.
			Evaluate BioCodonTables tableIdentifiers to get the NCBI identifiers (Integer).
			Evaluate BioCodonTables tableNames to get only the table Names (String) 
			Evaluate BioCodonTables tableAllNames to get a mapping of NCBI identifiers and names (Dictionary)
			Default = 1 (Standard table)
			
	stopSymbol			Specifies terminator Character. 
						Default is asterisk ($*) 
				
	stopBoolean			<true>	specifies to stop the translation after the first stop codon is found, the stopSymbol is not appended to the answered protein sequence 
						<false>	specifies a full translation continuing on past any stop codons (translated as the specified stop_symbol)
						Default = <false>
						
	cdsBoolean			<true>	specifies a complete CDS. 
			Checks the sequence starts with a valid alternative start codon (translated as methionine, M), 
			Checks that the sequence length is a multiple of three, 
			Checks that there is a single in frame stop codon at the end (this will be excluded from the protein sequence, regardless of the to_stop option).
			If these tests fail, an exception is raised.
						Default = <false>
	"
	
	^ self class 
		newWith: ( 
			self translationTable: aTableIdentifier 
				stopSymbol: stopCharacter 
				toStop: stopBoolean 
				cds: cdsBoolean )
		alphabet: BioIUPACProtein new
