accessing
buildTokensFrom: aCollection

	| taxaNumber collection seqIndex seqBlock |

	taxaNumber := self taxaNumberFrom: aCollection.
	collection := self buildTokensFromFirstBlock: aCollection.
	seqIndex := 1.
	(seqBlock := aCollection third) doWithIndex: [:seq :index | 
			index \\ (taxaNumber + 1) = 0
				ifTrue: [seqIndex := 1].
			index <= seqBlock size
				ifFalse: [ ^ collection ].
			collection
				at: seqIndex
				put: (String
						streamContents: [:str | str
								nextPutAll: (collection at: seqIndex);
								nextPutAll: (seqBlock at: index)]).
			seqIndex := seqIndex + 1].
	^ collection
