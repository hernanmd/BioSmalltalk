accessing
sequenceName
	" Answer the receiver's sequence header "
	
	| seqName |
	
	^ ( ( seqName := self name ) beginsWith: '>' )
		ifTrue: [ seqName allButFirst ]
		ifFalse: [ seqName ]