*BioTools
generate: aValue repeat: aRepetitions
	" ( self new generate: 2 repeat: 4 ) = #(2 2 2 2) "
	
	^ ( Generator on: [: g | 
			aRepetitions timesRepeat: [ g yield: aValue ] ] ) upToEnd