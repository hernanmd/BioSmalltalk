accessing
buildResults: aCollection
	" Answer an identified object for the receiver's parsing output "

	self halt.
	aCollection first isString
		ifTrue: [ 
			self resultsForParse 
				addFastaRecord: 	( BioFastaRecord 
					named: aCollection first
					sequence: ( self seqFrom: aCollection last ) ) ]
		ifFalse: [ aCollection do: [ : seq | self buildResults: seq ] ].
	^ self results