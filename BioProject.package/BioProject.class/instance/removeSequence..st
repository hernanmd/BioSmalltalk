accessing-sequences
removeSequence: aBioSequence
	" Remove aBioSequence from the receiver's first job which includes aBioSequence "
	
	| jobOrNil |
	
	jobOrNil := self jobs 
		detect: [ : job | job includesSequence: aBioSequence ]
		ifNone: [ nil ].
	jobOrNil
		ifNotNilDo: [: job | 
			job removeSequence: aBioSequence.
			self info removeSequence: aBioSequence. ]
		ifNil: [ self signalNotFound: 'Sequence not found ' , aBioSequence asString ]