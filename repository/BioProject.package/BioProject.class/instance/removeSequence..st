accessing-sequences
removeSequence: aBioSequence
	" Remove aBioSequence from the receiver's first job which includes aBioSequence "

	| jobOrNil |
	jobOrNil := self jobs
		detect: [ :job | job includesSequence: aBioSequence ]
		ifNone: [ nil ].
	jobOrNil
		ifNotNil: [ :job | 
			job removeSequence: aBioSequence ]
		ifNil: [ BioObject signalNotFound: 'Sequence not found ' , aBioSequence asString ]