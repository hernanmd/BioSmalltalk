accessing
translate: aCodonString
	" Answer a translated amino acid by aCodonString "
	
	^ self currentCodonTable 
			at: aCodonString asUppercase
			ifAbsent: [ self signalNotFound: aCodonString asString , ' codon String not found' ]