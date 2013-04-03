accessing
taxonIdentifiers
	" Answer a <Collection> with the taxon identifiers in the receiver (up to 10 characters each) "

	| idCol answeredIds |
	
	idCol := (self sequences first: self numberOfTaxa) collect: #name.
	answeredIds := OrderedCollection new: self numberOfTaxa.
	idCol do: [ : idString |
		idString size = 10
			ifFalse: [ 
				| remSize pads |
				remSize := 10 - idString size.
				pads := BioObject generateJoin: ' ' repeat: remSize.
				answeredIds add: idString , pads ]
			ifTrue: [ answeredIds add: idString ] ].
	^ answeredIds