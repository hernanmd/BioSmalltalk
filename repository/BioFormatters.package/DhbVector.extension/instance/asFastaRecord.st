*BioFormatters
asFastaRecord
	" Answer a <BioFastaRecord>. Assume receiver with 3 elements: (Number String String) "

	| fastaRecord |
	fastaRecord := BioFastaRecord new.
	self do: [ : each |
		each isNumber
			ifFalse: [
				each isBiologicalSequence 
					ifFalse: [ fastaRecord name: each ]
					ifTrue: [ fastaRecord sequence: each ]
			] ].
	^ fastaRecord