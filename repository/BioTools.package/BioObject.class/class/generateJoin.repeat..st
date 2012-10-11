accessing
generateJoin: anObject repeat: repetitions
	" Generate, join and answer anObject repetition times 
	( Object new generateJoin: 2 repeat: 4 ) = '2222'
	"
	
	repetitions >= 0
		ifFalse: [ self signalInvalidObject: 'Repetitions must be >= 0 ' , repetitions asString ].
	^ ( BioObject generate: anObject repeat: repetitions ) 
			inject: String new 
			into: [:a :b | String streamContents: [: stream |
							stream 
								nextPutAll: a;
								nextPutAll: b asString ] ].
