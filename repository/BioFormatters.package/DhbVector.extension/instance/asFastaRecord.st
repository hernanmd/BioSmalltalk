*BioFormatters
asFastaRecord
	" Answer a <BioFastaRecord> "

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