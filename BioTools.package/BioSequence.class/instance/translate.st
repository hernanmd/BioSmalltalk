accesing public - protein synthesis
translate
	" Answer a new instance of the receiver's with the receiver's sequence 
	translated to its corresponding Protein, adjusting the alphabet. Use the defaults.
	See comment in #translateTable:stopSymbol:toStop:cds: "
	
	^ self class 
		newWith: (self translationTable: (self codonTables atCodonTable: 1) 
				stopSymbol: $* 
				toStop: false 
				cds: false)
		alphabet: BioIUPACProtein new
