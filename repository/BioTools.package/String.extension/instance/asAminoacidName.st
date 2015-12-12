*BioTools
asAminoacidName
	" Answer the complete name of each receiver's aminoacid. Input may be one or three letter code. "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self size = 1
		ifTrue: [ self first asAminoacidName ]
		ifFalse: [ 
			self size = 3
				ifTrue: [ 
					BioIUPACAlphabet threeLetterAminoacidNames 
							at: self asUppercase
							ifAbsent: [ self signalNotFound: 'Three letter code not recognized as aminoacid' ] ]
				ifFalse: [ self signalInvalidObject: 'This method only accepts one or three letter codes' ] ]