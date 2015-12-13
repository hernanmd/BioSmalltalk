accessing
sequenceName
	" Answer a <String> with the receiver's sequence header "
	
	| seqName |
	
	^ ((seqName := self name) beginsWith: '>')
		ifTrue: [ seqName allButFirst ]
		ifFalse: [ seqName ]