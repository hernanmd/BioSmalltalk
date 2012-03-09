accessing
sequenceNames
	" Answer a Collection of receiver's alignments names. If any or all of the receiver's sequences are unnamed, then assign a numeric identifier corresponding to the position in the receiver's alignment set "
	
	| alignNames |
	
	alignNames := OrderedCollection new: set size.
	set doWithIndex: [: seq : index | 
		alignNames add: ( 
			seq name
				ifNil: [ index asString ]
				ifNotNil: [ seq name ] )
	].
	^ alignNames
		