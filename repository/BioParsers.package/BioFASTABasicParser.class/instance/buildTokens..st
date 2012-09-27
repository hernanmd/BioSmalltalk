accessing private
buildTokens: aCollection
	" Answer an identified object for the receiver's parsing output "

	aCollection first isString
		ifTrue: [ 
			self resultsForTokenize
					add: aCollection first;
					add: ( BioSequence joinSequence: ( self sequenceCollectionFrom: aCollection last ) ) ]
		ifFalse: [ aCollection do: [ : seq | self buildTokens: seq ] ].
	^ self results		